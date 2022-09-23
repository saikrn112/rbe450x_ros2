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
            wget \
            curl \
            zsh \
            git
RUN wget -nv -O - https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
RUN wget https://gist.githubusercontent.com/saikrn112/b55bf8a8bad6f6538a40561bdafe45bc/raw/.vimrc
RUN wget -O - https://gist.githubusercontent.com/saikrn112/1e353283a091824bb0074c7aafe203fe/raw/zimrc-components >> .zimrc
RUN /usr/bin/zsh /root/.zim/zimfw.zsh install
RUN wget -O - https://gist.githubusercontent.com/saikrn112/b9d16ad838fc240fe7370697039eb56c/raw/fab989855e8264b2e5f7aa0d24186fca12b2ce91/alias.sh >> .zshrc
CMD ["zsh"]
MAINTAINER somidi saikrn112@gmail.com
