#!/usr/bin/env python3
from glob import glob
from os import getcwd
from shutil import move
from sys import argv

print(argv)
if len(argv) < 4:
    print(f"Usage: <name> <season> <extension>")
    quit()

name = argv[1]
season = argv[2]
ext = argv[3]
files = sorted(glob(f"{getcwd()}/*.{ext}"))

to_move = []

for index, file_path in enumerate(files):
    file = file_path.replace(f"{getcwd()}/", "")
    new_file = f"{name} - {season}x{str(index + 1).rjust(2, '0')}.{ext}"
    new_file_path = f"{getcwd()}/{new_file}"
    print(f"{file} ==> {new_file}")
    to_move.append([file_path, new_file_path])

do_process = "n"
do_process = str.lower(input("Proceed? [y/N] "))
if do_process == "y":
    for movable in to_move:
        move(movable[0], movable[1])
else:
    quit()
