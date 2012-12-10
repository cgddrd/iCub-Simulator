#########################################################################
#
# This script has been modified from code written by Valerio Sperati 
# and Francesco Mannella under the GNU General Public License 
# as published by the Free Software Foundation, either version 3 of 
# the License, or (at your option) any later version.
# 
# The original code that this script is based on can be found at:
# http://www.im-clever.eu/resources/middleware%20/the-official-repository-on-tools-on-icub/
# 
# Copyright (c) 2012 Connor Goddard - Aberystwyth University
#
# This script is under the responsibility of Connor Goddard (clg11@aber.ac.uk) 
# and not that of Aberystwyth University.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.
#
#########################################################################
# 
# This script installs the iCub Simulator, and all it's dependancies
# including the YARP Server and ODE libraries
#
# This script has been tested on Ubuntu 11.04, 11.10 & Xubuntu 11.04
#
#!/bin/bash
#########################################################################

echo " "
echo "Installing libraries..."
echo " "
apt-get update

apt-get --yes install subversion
apt-get --yes install build-essential
apt-get --yes install linux-headers-$(uname -r)
apt-get --yes install g++ cmake  cmake-gui cmake-curses-gui
apt-get --yes install libncurses5-dev
apt-get --yes install libace-dev
apt-get --yes install freeglut3
apt-get --yes install freeglut3-dev
apt-get --yes install libgtk2.0-dev libgtkmm-2.4-dev
apt-get --yes install libode-dev
apt-get --yes install libsdl1.2-dev
apt-get --yes install libcv-dev libhighgui-dev libcvaux-dev
apt-get --yes install libgsl0-dev
apt-get --yes install libqt3-mt-dev
apt-get --yes install gfortran
apt-get --yes install libglademm-2.4-dev
