#!/usr/bin/python
import argparse
import os
from sys import platform
import time
import docker
#below command is from document https://docker-py.readthedocs.io/en/stable/containers.html
ENV_HOME = os.environ["HOME"]
ENV_USER = os.environ["USER"]

def create_docker_instance(name,args):
    options = ""
    if args.rm:
        options += " --rm "
    if args.it:
        options += " -it"
    print(f"Creating {name} instance")
    if platform == "linux" or platform == "linux2":
        vision_based_volume = f"{ENV_HOME}/Personal/vision_based_manipulation_rbe450x/"
    elif platform == "darwin":
        vision_based_volume = f"{ENV_HOME}/Personal/WPI/semester_1/vision_based_manipulation/"

    cmd= f"docker run {options} --name {name} -v {vision_based_volume}:/root/vision_based_manipulation/ somidi/ros-rbe450x:v1 /usr/bin/zsh"
    print(cmd)
    os.system(cmd)

def connect_to_container(name):
    print(f"found runing {name} container, attaching to it's zsh")
    #container.exec_run(cmd="zsh",user=ENV_HOME,workdir="/root/vision_based_manipulation/")
    cmd = f"docker exec -it {name} zsh"
    print(cmd)
    os.system(cmd)

def main():
    parser = argparse.ArgumentParser(description='start docker instance')

    parser.add_argument( "--rm",action='store_true',help="remove container on exit")
    parser.add_argument( "--it",action='store_true',help="interactive mode")
    parser.add_argument( "--name",default="rbe450x",help="interactive mode")
    args = parser.parse_args()

    name = args.name

    client = docker.from_env()

    containers_list = client.containers.list(all=True,sparse=True,filters={'name':f'{name}'})
    containers_len = len(containers_list)
    if containers_len > 1:
        print(f"expected 1 but found more containers {containers_list}")
        exit()
    elif containers_len == 1:
        container = containers_list[0]
        if container.status == "exited":
            print(f"starting container")
            container.start()
        elif container.status == "running":
            connect_to_container(name)
    elif containers_len == 0:
        create_docker_instance(name,args)

if __name__ == '__main__':
    main()
