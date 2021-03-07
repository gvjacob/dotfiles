import os
import pathlib

current_file = os.path.basename(__file__)

# Exclude these files for symlinks
EXLUDE = [current_file, 'README.md', '.git', '.DS_Store']

# Remove exclude files from files
# to symlink
files_in_dir = os.listdir('.')
symlink_files = [x for x in files_in_dir if x not in EXLUDE]

directory = pathlib.Path(__file__).parent.absolute()

for f in symlink_files:
    src = f'{directory}/{f}'
    dst = f'/Users/gino/{f}'

    print(f'From: {src}')
    print(f'To: {dst}')

    try:
        os.symlink(src, dst)
    except Exception as e:
        print(e)

    print()

