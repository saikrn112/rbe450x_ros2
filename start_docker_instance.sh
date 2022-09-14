#!/bin/zsh
docker run -it --name rbe450x -v ${HOME}/Personal/WPI/semester_1/vision_based_manipulation/:/root/ros2test --rm somidi/ros-rbe450x:v1 /usr/bin/zsh
