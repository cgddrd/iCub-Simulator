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


SOURCES=/home/$(whoami)
USERHOME=/home/$(whoami)

ICUB_ROOT="~/robsoft/iCub"
YARP_ROOT="~/robsoft/yarp2"
ICUB_DIR="$ICUB_ROOT/main/build"
YARP_DIR="$YARP_ROOT/build"
IPOPT_DIR="~/robsoft/Ipopt"
PATH="$PATH:$ICUB_DIR/bin:$YARP_DIR/bin"

echo "#### iCub Simulator Variables ##################################" >>  ${USERHOME}/.bashrc
echo "export ICUB_ROOT=${ICUB_ROOT}                            " >>  ${USERHOME}/.bashrc
echo "export YARP_ROOT=${YARP_ROOT}        " >>  ${USERHOME}/.bashrc
echo "export ICUB_DIR=${ICUB_DIR}                         " >>  ${USERHOME}/.bashrc
echo "export YARP_DIR=${YARP_DIR}              " >>  ${USERHOME}/.bashrc
echo "export IPOPT_DIR=${IPOPT_DIR}                                   " >>  ${USERHOME}/.bashrc
echo "export PATH=\$PATH:\$ICUB_DIR/bin:\$YARP_DIR/bin        " >>  ${USERHOME}/.bashrc
echo "#### iCub Simulator Variables ##################################" >>  ${USERHOME}/.bashrc
