#!/bin/zsh
if [ "$(uname)" = "Darwin" ]; then
    vision_based_volume="${HOME}/Personal/WPI/semester_1/vision_based_manipulation/"
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
    vision_based_volume="${HOME}/Personal/vision_based_manipulation/"
fi

cmd="docker run -it --name rbe450x -v ${vision_based_volume}:/root/vision_based_manipulation/ somidi/ros-rbe450x:v1 /usr/bin/zsh"
echo "Running command ${cmd}"
eval ${cmd}
