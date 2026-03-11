import os

def fix_const_in_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # We want to find all 'const ' occurrences.
    # For each, we find the extent of its expression.
    # If 'AppColors.' is in that extent, we remove 'const '.
    
    new_content = ""
    last_idx = 0
    
    def find_scope_end(text, start):
        # Find the end of the const expression.
        # This is roughly until the next ';' or a balanced closing char if it's a list/map/constructor.
        # We start at 'const ' (length 6)
        i = start + 6
        stack = []
        found_start = False
        
        while i < len(text):
            c = text[i]
            if not found_start:
                if c.isspace():
                    i += 1
                    continue
                else:
                    found_start = True
            
            if c in '([{':
                stack.append(c)
            elif c == ')':
                if not stack or stack.pop() != '(': return i + 1
            elif c == ']':
                if not stack or stack.pop() != '[': return i + 1
            elif c == '}':
                if not stack or stack.pop() != '{': return i + 1
            elif c == ';' and not stack:
                return i
            elif c == ',' and not stack:
                return i
            
            i += 1
        return i

    changed = False
    i = 0
    while True:
        idx = content.find('const ', i)
        if idx == -1:
            new_content += content[last_idx:]
            break
            
        # Check if it's a word boundary
        if idx > 0 and content[idx-1].isalnum():
            new_content += content[last_idx:idx+6]
            last_idx = idx + 6
            i = idx + 6
            continue
            
        end_idx = find_scope_end(content, idx)
        scope = content[idx:end_idx]
        
        if 'AppColors.' in scope:
            # Remove const
            new_content += content[last_idx:idx]
            # skip 'const '
            last_idx = idx + 6
            changed = True
        else:
            new_content += content[last_idx:idx+6]
            last_idx = idx + 6
        
        i = idx + 6

    if changed:
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
                if fix_const_in_file(os.path.join(root, file)):
                    fixed_count += 1
                    print(f"Fixed: {os.path.join(root, file)}")
    print(f'Done. Fixed {fixed_count} files.')

if __name__ == '__main__':
    main()
