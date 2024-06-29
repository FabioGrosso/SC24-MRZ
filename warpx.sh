cd warpx_directory
git clone https://github.com/ECP-WarpX/picsar.git
git clone https://github.com/ECP-WarpX/warpx-data.git

make clean
cp $AMRIC_HOME/amrex/Src/Extern/HDF5/AMReX_PlotFileUtilHDF5.stack $AMRIC_HOME/amrex/Src/Extern/HDF5/AMReX_PlotFileUtilHDF5.cpp
make -j 16 USE_HDF5_SZ3=TRUE SZ3_HOME=$SZ3_HOME
mv main3d* sz3

make clean
cp $AMRIC_HOME/amrex/Src/Extern/HDF5/AMReX_PlotFileUtilHDF5.ori $AMRIC_HOME/amrex/Src/Extern/HDF5/AMReX_PlotFileUtilHDF5.cpp
make -j 16 USE_HDF5_SZ3=FALSE 
mv main3d* nocomp

mv temp-chk001000 diags/chk001000 
mkdir meta
cd $AMRIC_HOME
