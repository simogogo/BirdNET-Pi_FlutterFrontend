import os
import re

def fix_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    new_lines = []
    changed = False
    
    # We'll use a sliding window/buffer to find 'const' and then look ahead
    # for 'AppColors.' before the next ';' or another 'const' or end of block.
    
    content = "".join(lines)
    
    # Very aggressive: Find all 'const ' and check if 'AppColors.' exists 
    # before the next balanced closing parenthesis or semicolon.
    # This is hard with regex alone, so we'll do a simpler approach:
    # Find all 'const' and remove them if 'AppColors.' appears in the next 10 lines
    # as long as it's likely part of the same widget tree.
    
    # Better: Identify all locations of 'AppColors.' and look backwards for 'const'.
    
    matches = list(re.finditer(r'AppColors\.', content))
    if not matches:
        return False
        
    # We'll collect indices of 'const ' to remove
    to_remove = set()
    
    for match in matches:
        pos = match.start()
        # Look backwards for the nearest 'const '
        # Limit the search to a reasonable distance (e.g. 500 chars)
        search_start = max(0, pos - 500)
        potential_consts = list(re.finditer(r'\bconst\b\s+', content[search_start:pos]))
        if potential_consts:
            # The most recent 'const' before our AppColor is a candidate
            last_const = potential_consts[-1]
            actual_pos = search_start + last_const.start()
            
            # Check if this const actually wraps our AppColor.
            # A simple heuristic: is there a ';' or '{' between them?
            # If not, it's likely part of the same expression.
            between = content[actual_pos:pos]
            if ';' not in between:
                to_remove.add((actual_pos, actual_pos + 6)) # 'const ' is 6 chars including space

    if not to_remove:
        return False
        
    # Apply removals in reverse order
    new_content = list(content)
    for start, end in sorted(list(to_remove), reverse=True):
        # Double check it's still 'const ' (sanity check)
        if "".join(new_content[start:end]) == 'const ':
            new_content[start:end] = ""
            changed = True
            
    if changed:
        with open(filepath, 'w', encoding='utf-8') as f:
            f.write("".join(new_content))
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
