# Use Ubuntu as the base image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# Install required packages for ROS2
RUN apt-get install -y curl gnupg2 lsb-release

# Add ROS2 apt repository
RUN curl http://repo.ros2.org/repos.key | apt-key add -
RUN sh -c 'echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list'

# Update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# Install ROS2 and additional packages
RUN apt-get install -y ros-foxy-desktop
RUN apt-get install -y python3-argcomplete

# Set the default entrypoint to bash
ENTRYPOINT [ "bash" ]
