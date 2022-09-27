## Docker image for REB450x

This dockerimage is for ROS2 and gazebo image, by default it tries to attach my workspace directory. You can attach your own workspace by passing appropriate flags in the launch script (more on this below)

To run:
* install docker from [here](https://docs.docker.com/engine/install/)
* also follow [post-installation steps](https://docs.docker.com/engine/install/linux-postinstall/) for linux if you dont want to run docker in `sudo` 
* install docker python package to make life easy for controlling docker
```
pip install docker
```
* build the image
```
./build.sh
```
* run the python script to start and connect to the instance
```
python ./start_docker_instance.py 
```
* for more options and defaults 
```
python ./start_docker_instance.py --help
```

Following are some of the help options 
* for custom container name `--name <name_you_want>` 
* for interactive shell `--it` 
* for attaching your own volume `--workspace <absolute_path_to_your_ws>` 
* to get display out of docker give `--display` 
* make sure to run `xhost local:root` before launching the container from image
* example: to run interactive shell with display, run the following
```
#make sure existing docker image is already not spinned
xhost local:root
python ./start_docker_instance.py --it --display
```
