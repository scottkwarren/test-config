#!/bin/bash

#SBATCH --job-name=namd2-tests
#SBATCH --account=commons
#SBATCH --partition=commons
#SBATCH --ntasks=4
#SBATCH --mem-per-cpu=1000m
#SBATCH --time=00:45:00
#SBATCH --mail-user=scott@rice.edu
#SBATCH --mail-type=ALL

export LD_LIBRARY_PATH=`pwd`/NAMD_2.12_Source/tcl/lib/:`pwd`/NAMD_2.12_Source/fftw/lib/
export TEMP=`pwd`NAMD_2.12_Source/fftw/lib/

# Multicore NAMD2, normal and profiled
cd NAMD_2.12_Source/Linux-x86_64-g++.multicore
./charmrun +p4 ./namd2 apoa1/apoa1.namd
/usr/bin/time -f "%e\t%S\t%U" ../../hpctoolkit-src/hpctoolkit/INSTALL/bin/hpcrun -e REALTIME@10000 ./charmrun +p4 ./namd2 apoa1/apoa1.namd
../../hpctoolkit-src/hpctoolkit/INSTALL/bin/hpcprof -S namd2.hpcstruct -I ../+ hpctoolkit-namd2-measurements-*
cd ../..

# Ethernet NAMD2, normal and profiled
cd NAMD_2.12_Source/Linux-x86_64-g++.ethernet
./charmrun +p4 ++local ./namd2 apoa1/apoa1.namd
/usr/bin/time -f "%e\t%S\t%U" ../../hpctoolkit-src/hpctoolkit/INSTALL/bin/hpcrun -e REALTIME@10000 ./charmrun ++local +p4 ./namd2 apoa1/apoa1.namd
../../hpctoolkit-src/hpctoolkit/INSTALL/bin/hpcprof -S namd2.hpcstruct -I ../+ hpctoolkit-namd2-measurements-*
cd ../..

# MPI NAMD2, normal and profiled
###  cd NAMD_2.12_Source/Linux-x86_64-g++.mpi
###  ./charmrun +p4 ./namd2 apoa1/apoa1.namd
###  /usr/bin/time -f "%e\t%S\t%U" ../../hpctoolkit-src/hpctoolkit/INSTALL/bin/hpcrun -e REALTIME@10000 ./charmrun +p4 ./namd2 apoa1/apoa1.namd
###  ../../hpctoolkit-src/hpctoolkit/INSTALL/bin/hpcprof -S namd2.hpcstruct -I ../+ hpctoolkit-namd2-measurements-*
###  cd ../..

