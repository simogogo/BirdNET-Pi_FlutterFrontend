import os
import json

def update_arb(filepath):
    try:
        with open(filepath, 'r', encoding='utf-8-sig') as f:
            data = json.load(f)
    except Exception as e:
        print(f"Error loading {filepath}: {e}")
        return False
    
    if 'themeLight' in data and 'themeDark' in data:
        return False
    
    # Determine language from filename app_lang.arb
    lang = os.path.basename(filepath).split('_')[1].split('.')[0]
    
    translations = {
        'it': ('Chiaro', 'Scuro'),
        'en': ('Light', 'Dark'),
        'fr': ('Clair', 'Sombre'),
        'es': ('Claro', 'Oscuro'),
        'de': ('Hell', 'Dunkel'),
        'pt': ('Claro', 'Escuro'),
    }
    
    light, dark = translations.get(lang, ('Light', 'Dark'))
    
    # Find insertion point (after themeWeb)
    new_data = {}
    found_themeweb = False
    for k, v in data.items():
        new_data[k] = v
        if k == 'themeWeb':
            new_data['themeLight'] = light
            new_data['themeDark'] = dark
            found_themeweb = True
            
    if not found_themeweb:
        # Just append at the end if themeWeb not found
        new_data['themeLight'] = light
        new_data['themeDark'] = dark
        
    with open(filepath, 'w', encoding='utf-8') as f:
        json.dump(new_data, f, ensure_ascii=False, indent=2)
    return True

def main():
    l10n_dir = os.path.join('lib', 'l10n')
    updated_count = 0
    for file in os.listdir(l10n_dir):
        if file.endswith('.arb') and file.startswith('app_'):
            if update_arb(os.path.join(l10n_dir, file)):
                updated_count += 1
    print(f'Updated {updated_count} arb files.')

if __name__ == '__main__':
    main()
