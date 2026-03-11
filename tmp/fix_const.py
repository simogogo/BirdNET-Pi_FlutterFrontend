import os
import re

def fix_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # We want to remove 'const' from patterns like:
    # const Icon(..., color: AppColors.xxx)
    # const TextStyle(..., color: AppColors.xxx)
    # const BoxDecoration(..., color: AppColors.xxx)
    # etc.
    
    # This regex looks for 'const ' followed by an uppercase word (Widget) 
    # and then a parenthesis that contains 'AppColors.' somewhere inside.
    # We use a non-greedy .*? to stay within the balanced parentheses (roughly)
    
    def replacement(match):
        full_match = match.group(0)
        if 'AppColors.' in full_match:
            # Remove the 'const ' prefix
            return full_match[6:]
        return full_match

    # Simple regex for 'const WidgetName('
    pattern = re.compile(r'const [A-Z][a-zA-Z]*\([^)]*?\)', re.DOTALL)
    
    new_content = pattern.sub(replacement, content)
    
    # Also handle things like:
    # colors: [AppColors.primary, AppColors.primaryLight]
    # which might be inside a const [...]
    
    def replacement_list(match):
        full_match = match.group(0)
        if 'AppColors.' in full_match:
            return full_match[6:]
        return full_match
        
    pattern_list = re.compile(r'const \[[^\]]*?AppColors\..*?\]', re.DOTALL)
    new_content = pattern_list.sub(replacement_list, new_content)

    if content != new_content:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write(new_content)
        return True
    return False

def main():
    lib_dir = 'lib'
    fixed_count = 0
    for root, _, files in os.walk(lib_dir):
        for file in files:
            if file.endswith('.dart'):
                if fix_file(os.path.join(root, file)):
                    fixed_count += 1
    print(f'Fixed {fixed_count} files.')

if __name__ == '__main__':
    main()
