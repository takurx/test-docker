# Use the official Ubuntu 20.04 LTS as the base image
FROM ubuntu:20.04

# Set the working directory to /app
WORKDIR /app

# Update the package repository and install the dependencies for ROS and Node-RED
RUN apt-get update && \
    apt-get install -y \
      curl \
      gnupg2 \
      lsb-release \
      ros-noetic-desktop-full \
      python3-pip

# Add the ROS keys and repository to the package manager
RUN curl http://repo.ros2.org/repos.key | apt-key add - && \
    echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list

# Update the package repository and install ROS 2.18.0
RUN apt-get update && \
    apt-get install -y ros-dashing-desktop

# Initialize the ROS environment and setup the environment variables
RUN source /opt/ros/dashing/setup.bash && \
    echo "source /opt/ros/dashing/setup.bash" >> ~/.bashrc

# Install Node-RED and the necessary plugins
RUN npm install -g --unsafe-perm node-red && \
    npm install -g node-red-contrib-ros && \
    npm install -g node-red-contrib-web-worldmap

# Expose the port 1880 for Node-RED
EXPOSE 1880

# Run Node-RED as the main command
CMD ["node-red"]
