# Use the official Ubuntu 22.04 LTS as the base image
FROM ubuntu:22.04

# Set the working directory to /app
WORKDIR /app

# Update the package repository and install the dependencies for ROS2 and Node-RED
RUN apt-get update && \
    apt-get install -y \
      curl \
      gnupg2 \
      lsb-release \
      python3-pip

# Add the ROS keys and repository to the package manager
RUN curl http://repo.ros2.org/repos.key | apt-key add - && \
    echo "deb [arch=amd64,arm64] http://packages.ros.org/ros2/ubuntu `lsb_release -cs` main" > /etc/apt/sources.list.d/ros2-latest.list

# Update the package repository and install ROS 2.22.0
RUN apt-get update && \
    apt-get install -y ros-foxy-desktop

# Initialize the ROS environment and setup the environment variables
RUN source /opt/ros/foxy/setup.bash && \
    echo "source /opt/ros/foxy/setup.bash" >> ~/.bashrc

# Install Node-RED and the necessary plugins
RUN npm install -g --unsafe-perm node-red && \
    npm install -g node-red-contrib-ros2

# Expose the port 1880 for Node-RED
EXPOSE 1880

# Run Node-RED as the main command
CMD ["node-red"]
