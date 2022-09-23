#!/usr/bin/python
import argparse
import os
from sys import platform
import subprocess

parser = argparse.ArgumentParser(description='start docker instance')

parser.add_argument( "--rm",action='store_true',help="remove container on exit")
parser.add_argument( "--it",action='store_true',help="interactive mode")
args = parser.parse_args()

options = ""
if args.rm:
    options += " --rm "
if args.it:
    options += " -it"

HOME = os.environ["HOME"]
if platform == "linux" or platform == "linux2":
    vision_based_volume = f"{HOME}/Personal/vision_based_manipulation_rbe450x/"
elif platform == "Darwin":
    vision_based_volume = f"{HOME}/Personal/WPI/semester_1/vision_based_manipulation/"

cmd= f"docker run {options} --name rbe450x -v {vision_based_volume}:/root/ somidi/ros-rbe450x:v1 /usr/bin/zsh"
print(cmd)
os.system(cmd)
