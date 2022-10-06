## ROS2
FROM osrf/ros:humble-desktop
WORKDIR /root
RUN apt update -y
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=America/New_York
RUN apt install -y \
            software-properties-common \
            tree \
            vim \
            less \
            htop \
            wget \
            curl \
            zsh \
            git
RUN echo "deb http://packages.osrfoundation.org/gazebo/ubuntu-stable `lsb_release -cs` main" > /etc/apt/sources.list.d/gazebo-stable.list
RUN wget https://packages.osrfoundation.org/gazebo.key -O - | apt-key add -
RUN apt update -y
# HW3
RUN apt install gazebo \
            libgazebo-dev \
            ros-humble-gazebo-ros-pkgs \
            ros-humble-ros2-control \
            ros-humble-ros2-controllers \
            ros-humble-gazebo-ros2-control \
            ros-humble-xacro \
            ros-humble-joint-state-publisher \
            ros-humble-joint-state-publisher-gui \
            ros-humble-tf2-tools \
            ros-humble-tf-transformations \
            ros-humble-image-view \
            libcanberra-gtk3-module \
            python3-pip -y
RUN pip3 install opencv-python transforms3d setuptools==58.2.0

RUN wget -nv -O - https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
RUN wget https://gist.githubusercontent.com/saikrn112/b55bf8a8bad6f6538a40561bdafe45bc/raw/.vimrc
RUN wget -O - https://gist.githubusercontent.com/saikrn112/1e353283a091824bb0074c7aafe203fe/raw/zimrc-components >> .zimrc
RUN /usr/bin/zsh /root/.zim/zimfw.zsh install
RUN wget -O - https://gist.githubusercontent.com/saikrn112/b9d16ad838fc240fe7370697039eb56c/raw/62d0ef0fabce1781c818b26b2a2acfe190ebc8fa/alias.sh >> .zshrc
CMD ["zsh"]
MAINTAINER somidi saikrn112@gmail.com
