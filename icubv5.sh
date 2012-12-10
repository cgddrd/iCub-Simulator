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


CURRENT_DIR=$(pwd)
SOURCES=/home/$(whoami)
ROBSOFT=${SOURCES}/robsoft

#export ROBSOFT="$SOURCES/robsoft"
#export ICUB_ROOT="$ROBSOFT/iCub"
#export YARP_ROOT="$ROBSOFT/yarp2"
#export ICUB_DIR="$ICUB_ROOT/main/build"
#export YARP_DIR="$YARP_ROOT/build"
#export IPOPT_DIR="$ROBSOFT/Ipopt"
#export PATH="$PATH:$ICUB_DIR/bin:$YARP_DIR/bin"

DIR="$( cd "$( dirname "$0" )" && pwd )"

echo ${SOURCES}
mkdir $ROBSOFT

echo $DIR

# Install ODE

echo " "
echo "Downloading ODE..."
echo " "

cd $ROBSOFT

wget http://downloads.sourceforge.net/project/opende/ODE/0.11.1/ode-0.11.1.zip
unzip ode-0.11.1.zip
rm -fr ode-0.11.1.zip

echo " "
echo "Installing ODE..."
echo " "

cd ode-0.11.1
./configure --enable-double-precision
make

# Install Ipopt

echo " "
echo "Downloading Ipopt..."
echo " "

cd $ROBSOFT

wget http://www.coin-or.org/download/source/Ipopt/Ipopt-3.10.1.tgz
tar -xvf Ipopt-3.10.1.tgz
rm -fr Ipopt-3.10.1.tgz

mv Ipopt-3.10.1 IPOPT_DWN_DIR

cd IPOPT_DWN_DIR/ThirdParty

#for name in Blas Lapack; do
#	cd $name 
#	./get.$name
#	cd ..
#done

cd Blas

echo " "
echo "Running script for downloading the source code for BLAS"
echo " "

rm -f blas.tgz

echo "Downloading the source code from www.netlib.org..."
#$wgetcmd ftp://www.netlib.org/blas/blas.tgz

wget www.netlib.org/blas/blas.tgz

echo "Uncompressing the tarball..."
gunzip -f blas.tgz

echo "Unpacking the source code..."
tar xf blas.tar

echo "Deleting the tar file..."
rm blas.tar

echo "Moving the source files from BLAS subdirectory"
mv BLAS/*.f .
rm -rf BLAS

echo " "
echo "Done downloading the source code for BLAS."
echo " "

cd ..

cd Lapack

lapack_ver=3.2.1

echo " "
echo "Running script for downloading the source code for LAPACK"
echo " "

rm -f lapack.tgz
echo "Downloading the source code from www.netlib.org..."
wget www.netlib.org/lapack/lapack-${lapack_ver}.tgz

echo "Uncompressing the tarball..."
gunzip -f lapack-${lapack_ver}.tgz

echo "Unpacking the source code..."
tar xf lapack-${lapack_ver}.tar lapack-${lapack_ver}/SRC lapack-${lapack_ver}/INSTALL/dlamch.f
rm -rf LAPACK
mv lapack-${lapack_ver} LAPACK

echo "Deleting the tar file..."
rm lapack-${lapack_ver}.tar

echo " "
echo "Done downloading the source code for LAPACK."
echo " "

cd ..

echo " "
echo "Downloading HSL Libraries..."
echo " "

cd HSL

wget http://dl.dropbox.com/u/46039322/ma27ad.f
wget http://dl.dropbox.com/u/46039322/mc19ad.f

mkdir $IPOPT_DIR
cd $IPOPT_DIR

echo " "
echo "Configuring Ipopt..."
echo " "
${ROBSOFT}/IPOPT_DWN_DIR/configure

echo " "
echo "Compiling Ipopt..."
echo " "

make
make test

echo " "
echo "Installing Ipopt..."
echo " "
make install

# Yarp Install...

echo " "
echo "Downloading YARP..."
echo " "

cd $ROBSOFT

svn co https://yarp0.svn.sourceforge.net/svnroot/yarp0/trunk/yarp2 yarp2

mkdir $YARP_DIR
cd $YARP_DIR

echo " "
echo "Configuring YARP..."
echo " "

cmake -C $YARP_ROOT -DCREATE_GUIS:BOOL=ON -DCREATE_LIB_MATH:BOOL=ON -DCMAKE_BUILD_TYPE:STRING=Release

echo " "
echo "Installing YARP..."
echo " "

make

echo " "
echo "Testing YARP..."
echo " "
yarp check


# iCub Install

echo " "
echo "Downloading iCub Simulator..."
echo " "

cd $ROBSOFT

svn co https://robotcub.svn.sourceforge.net/svnroot/robotcub/trunk/iCub 

mkdir $ICUB_DIR

cd $ICUB_DIR

echo " "
echo "Configuring iCub Simulator..."
echo " "

cmake -C $ICUB_ROOT/main -DCMAKE_BUILD_TYPE:STRING=Release

echo " "
echo "Installing iCub Simulator..."
echo " "

make

echo " "
echo "Installing Control Applications..."
echo " "

make install_applications
echo " "
echo "*****"
echo "Script completed - iCub Simulator successfully installed"
echo "*****"
echo " "
