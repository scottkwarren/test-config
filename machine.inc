#################################################
#                                               #
#  SKW TESTS for hpctoolkit 7/15/17             #
#  Computation of machine-specific options      #
#                                               #
#################################################


# les
if [ "$machine" == "les" ]; then

	if [ "$compiler" = "gnu" ]; then

		# general
		NAMD_ARCH=Linux-x86_64

		# mpi
		PATH=/projects/pkgs/mpich/bin:$PATH

		# cuda
		CUDADIR=/usr/local/encap/cuda-6.5
		CUBDIR=.rootdir/cub
		CUDAINCL=-I$(CUDADIR)/include

	elif [ $compiler = "intel" ]; then

		# general
		NAMD_ARCH=Linux-x86_64-icc

		# mpi
		# ...

		# cuda
		# ...

	endif

endif



