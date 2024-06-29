

cd $AMRIC_HOME
cd SZ3
mkdir install
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=$AMRIC_HOME/SZ3/install -DBUILD_H5Z_FILTER=ON ..
export SZ3_HOME=$AMRIC_HOME/SZ3/install
make -j 8
make install 

cd $AMRIC_HOME
cd SZ3
mkdir install
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=$AMRIC_HOME/SZ3/install-pad -DBUILD_H5Z_FILTER=ON ..
# export SZ3_HOME=$AMRIC_HOME/SZ3/install
make -j 8
make install 

# cd $AMRIC_HOME
# cd SZ3
# mkdir install
# mkdir build
# cd build
# cmake -DCMAKE_INSTALL_PREFIX:PATH=$AMRIC_HOME/SZ3/install-adp -DBUILD_H5Z_FILTER=ON ..
# # export SZ3_HOME=$AMRIC_HOME/SZ3/install
# make -j 8
# make install 

cd $AMRIC_HOME
cd orisz3
mkdir install
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX:PATH=$AMRIC_HOME/orisz3/install -DBUILD_H5Z_FILTER=ON ..
export ORI_SZ3_HOME=$AMRIC_HOME/orisz3/install 
make -j 8
make install
cd $AMRIC_HOME 

echo export SZ3_HOME=$AMRIC_HOME/SZ3/install >> ~/.bashrc
echo export ORI_SZ3_HOME=$AMRIC_HOME/orisz3/install >> ~/.bashrc
echo "# end of AMRIC env" >> ~/.bashrc
