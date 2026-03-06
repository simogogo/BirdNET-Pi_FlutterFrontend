import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:birdnet_pi_app/l10n/app_localizations.dart';
import '../../services/api_service.dart';
import '../../widgets/app_shell.dart';
import '../../config/theme.dart';

class AnalysisLogScreen extends ConsumerStatefulWidget {
  const AnalysisLogScreen({super.key});

  @override
  ConsumerState<AnalysisLogScreen> createState() => _AnalysisLogScreenState();
}

class _AnalysisLogScreenState extends ConsumerState<AnalysisLogScreen> {
  final List<String> _logs = [];
  String? _cursor;
  bool _isLoading = false;
  bool _autoRefresh = true;
  Timer? _refreshTimer;
  final ScrollController _scrollController = ScrollController();
  String? _error;

  @override
  void initState() {
    super.initState();
    _fetchLogs();
    _startTimer();
  }

  @override
  void dispose() {
    _refreshTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startTimer() {
    _refreshTimer?.cancel();
    _refreshTimer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_autoRefresh && !_isLoading && mounted) {
        _fetchLogs();
      }
    });
  }

  Future<void> _fetchLogs() async {
    if (mounted) setState(() => _isLoading = true);

    try {
      final api = ref.read(apiServiceProvider);
      final data = await api.getAnalysisLogs(cursor: _cursor);

      final List<dynamic> newLogs = data['logs'] ?? [];
      final String? nextCursor = data['cursor'] ?? _cursor;

      if (mounted) {
        setState(() {
          if (newLogs.isNotEmpty) {
            _logs.addAll(newLogs.map((e) => e.toString()));
            // Keep a maximum of 1000 lines to avoid memory issues
            if (_logs.length > 1000) {
              _logs.removeRange(0, _logs.length - 1000);
            }
          }
          _cursor = nextCursor;
          _error = null;
          _isLoading = false;
        });

        if (newLogs.isNotEmpty && _autoRefresh) {
          _scrollToBottom();
        }
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _error = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.analysisLog),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () => AppShell.openDrawer(),
        ),
        actions: [
          Row(
            children: [
              Text(l10n.autoRefresh, style: const TextStyle(fontSize: 12)),
              Switch(
                value: _autoRefresh,
                onChanged: (val) {
                  setState(() => _autoRefresh = val);
                  if (val) _scrollToBottom();
                },
              ),
            ],
          ),
          IconButton(icon: const Icon(Icons.refresh), onPressed: _fetchLogs),
        ],
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Column(
          children: [
            if (_error != null)
              Container(
                color: AppColors.error.withOpacity(0.15),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                width: double.infinity,
                child: Text(
                  _error!,
                  style: const TextStyle(color: AppColors.error, fontSize: 12),
                ),
              ),
            Expanded(
              child: Scrollbar(
                controller: _scrollController,
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.all(12),
                  itemCount: _logs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      child: Text(
                        _logs[index],
                        style: GoogleFonts.robotoMono(
                          color: const Color(
                            0xFF00E676,
                          ), // Vibrant terminal green
                          fontSize: 14,
                          height: 1.2,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            if (_isLoading)
              const LinearProgressIndicator(
                backgroundColor: Colors.transparent,
                color: AppColors.primaryLight,
                minHeight: 2,
              ),
          ],
        ),
      ),
    );
  }
}
