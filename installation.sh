RED='\033[0;31m' # ${RED}
NC='\033[0m' # ${NC} no color
GREEN='\033[0;32m' # ${GREEN}
BLUE='\033[0;34m' # ${BLUE}

# ------- installation for anaconda3
# sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
# wget https://repo.anaconda.com/archive/Anaconda3-2020.11-Linux-x86_64.sh
# bash Anaconda3-XXXX.XX-Linux-x86_64.sh

DIR=$(pwd)
FLIGHTMARE="FLIGHTMARE"
conda create --name $FLIGHTMARE python=3.6
conda activate $FLIGHTMARE

sudo apt-get update 
sudo apt-get install -y --no-install-recommends build-essential cmake libzmqpp-dev libopencv-dev
sudo apt-get install libgoogle-glog-dev protobuf-compiler ros-$ROS_DISTRO-octomap-msgs ros-$ROS_DISTRO-octomap-ros ros-$ROS_DISTRO-joy python-vcstool
sudo apt-get install python-pip
sudo pip install catkin-tools

echo "export FLIGHTMARE_PATH=~/flightmare_ws/src/flightmare" >> ~/.bashrc
echo "export PYTHONPATH=$PYTHONPATH:/home/$USER/anaconda3/envs/$FLIGHTMARE/lib/python3.6/site-packages" >> ~/.bashrc

# to use with ROS using pip and catkin
cd && mkdir -p flightmare_ws/src
cp -r $DIR/ ~/flightmare_ws/src/
cd ~/flightmare_ws/src/flightmare && tar -xf rpg_dep.tar.xz -C ..
cd ~/flightmare_ws/src/flightmare && tar -xf simple_dep.tar.xz -C ..
cd ~/flightmare_ws/src/ && git clone https://github.com/ethz-asl/rotors_simulator.git
pip install -r ~/flightmare_ws/src/flightmare/flightlib/externals/pybind11-src/docs/requirements.txt
cd ~/flightmare_ws/src/flightmare/flightlib
pip install .

# cd ~/flightmare_ws/src/flightmare/flightrl
# pip install .
# catkin build -j2
