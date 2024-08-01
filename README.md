# A High-Quality Workflow for Multi-Resolution Scientific Data Reduction and Visualization

While preparing the artifacts, we executed them on a single node from the Chameleon Cloud, equipped with two Intel Xeon Gold 6242 CPUs and 192 GB of memory (specifically, ```compute_skylake``` configuration). We recommend that reviewers also use the Chameleon Cloud for artifact evaluation.

## Minimum system & software libraries requirements
OS: Linux (Ubuntu 20.04 is recommended)

Memory: >= 192 GB RAM

Processor: >= 64 cores

Storage: >= 128 GBs

gcc/9.4.0 (or 9.3.0)

cmake (>= 3.23)

OpenMPI/4.1.1 (install scripts provided, or spectrum-mpi)

python/3.8

hdf5/1.12.2 (install scripts provided)

### Step 1: Install Singularity
Install [Singularity](https://singularity-tutorial.github.io/01-installation/)

### Step 2: Download, build, and run the pre-built Singularity image file via GitHub (need root privilege)
```
git clone https://github.com/FabioGrosso/SC24-MRZ-image
cat SC24-MRZ-image/mrz.part.* > mrz.sif
sudo singularity build --sandbox mrz mrz.sif
sudo singularity shell --writable mrz
```

### Step 3.0: Set up environmental variables
```
export OMPI_DIR=/opt/ompi 
export OMPI_VERSION=4.1.1
export PATH=$OMPI_DIR/bin:$PATH
export LD_LIBRARY_PATH=$OMPI_DIR/lib:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/opt/zfp/build/lib:$LD_LIBRARY_PATH
export MANPATH=$OMPI_DIR/share/man:$MANPATH
export C_INCLUDE_PATH=/opt/ompi/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=/opt/ompi/include:$CPLUS_INCLUDE_PATH
export OMPI_ALLOW_RUN_AS_ROOT=1
export OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1
```

### Step 3.1: Run NYX with no compression, original SZ3 compression, AMRIC, and ours (2 iterations, 8 mins)
```
cd /home/nyx256/
. go.sh
```

### Step 3.2: Compare I/O performance between AMRIC and ours in NYX.
```
cd /home/nyx256/otfile
. io.sh
```
### Step 3.3: Evaluate NYX's data quality and compression ratio for Baseline-SZ3, AMRIC-SZ3, and ours
```
cd /home/nyx256/run
. decomp.sh 
. qualityCR.sh 
```
### Step 4.1: Run WarpX with no compression, original SZ3 compression, and ours (2 iterations, 3 mins)
```
cd /home/wpx/
. go.sh
```
### Step 4.2: Evaluate WarpX's data quality and compression ratio for Baseline-SZ3, and ours
```
cd /home/wpx/diags
. decomp.sh 
. qualityCR.sh 
```
### Step 5.1: Compress RT data using with Baseline-SZ3, AMRIC-SZ3, TAC-SZ3, and ours (pad+eb)
```
cd /home/rtamr/
. go.sh 
```
### Step 5.2: Evaluate RT data quality and CR for Baseline-SZ3, AMRIC-SZ3, TAC-SZ3, and ours (pad+eb)
```
. qualityCR.sh 
```
### Step 6.1: Compress/decompress multi-resolution dataset Hurricane using SZ2/ZFP with our post-process
```
cd /home/post-mr/
. go.sh 
```
### Step 6.2: Evaluate Hurricane data quality and CR for original SZ2, ZFP, and with our post-process
```
. qualityCR.sh 
```
### Step 7.1: Compress/decompress uniform-resolution dataset S3D using SZ2/ZFP with our post-process
```
cd /home/post-uni/
. go.sh 
```
### Step 7.2: Evauate S3D data quality and CR for original SZ2, ZFP, and with our post-process.
```
. qualityCR.sh 
```
### Step 7.3: Evaluate the run time of the original compression and post-processing on S3D using ZFP and SZ2 (Serial)
```
. time.sh
```
### Step 8: Compute the uncertainty of the decompressed hurricane data. And generate visualizations of original, decompressed, and decompressed data with uncertainty.
```
cd /home/vis
Xvfb :99 -screen 0 1024x768x24 &
export DISPLAY=:99
. go.sh
```

