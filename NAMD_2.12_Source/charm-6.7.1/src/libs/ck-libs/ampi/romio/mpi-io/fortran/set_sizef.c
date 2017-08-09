/* -*- Mode: C; c-basic-offset:4 ; -*- */
/* 
 *   $Id$    
 *
 *   Copyright (C) 1997 University of Chicago. 
 *   See COPYRIGHT notice in top-level directory.
 */

#include "adio.h"
#include "mpio.h"


#if defined(MPIO_BUILD_PROFILING) || defined(HAVE_WEAK_SYMBOLS)

#if defined(HAVE_WEAK_SYMBOLS)
#if defined(HAVE_PRAGMA_WEAK)
#if defined(FORTRANCAPS)
#pragma weak MPI_FILE_SET_SIZE = PMPI_FILE_SET_SIZE
#elif defined(FORTRANDOUBLEUNDERSCORE)
#pragma weak mpi_file_set_size__ = pmpi_file_set_size__
#elif !defined(FORTRANUNDERSCORE)
#pragma weak mpi_file_set_size = pmpi_file_set_size
#else
#pragma weak mpi_file_set_size_ = pmpi_file_set_size_
#endif

#elif defined(HAVE_PRAGMA_HP_SEC_DEF)
#if defined(FORTRANCAPS)
#pragma _HP_SECONDARY_DEF PMPI_FILE_SET_SIZE MPI_FILE_SET_SIZE
#elif defined(FORTRANDOUBLEUNDERSCORE)
#pragma _HP_SECONDARY_DEF pmpi_file_set_size__ mpi_file_set_size__
#elif !defined(FORTRANUNDERSCORE)
#pragma _HP_SECONDARY_DEF pmpi_file_set_size mpi_file_set_size
#else
#pragma _HP_SECONDARY_DEF pmpi_file_set_size_ mpi_file_set_size_
#endif

#elif defined(HAVE_PRAGMA_CRI_DUP)
#if defined(FORTRANCAPS)
#pragma _CRI duplicate MPI_FILE_SET_SIZE as PMPI_FILE_SET_SIZE
#elif defined(FORTRANDOUBLEUNDERSCORE)
#pragma _CRI duplicate mpi_file_set_size__ as pmpi_file_set_size__
#elif !defined(FORTRANUNDERSCORE)
#pragma _CRI duplicate mpi_file_set_size as pmpi_file_set_size
#else
#pragma _CRI duplicate mpi_file_set_size_ as pmpi_file_set_size_
#endif

/* end of weak pragmas */
#endif
/* Include mapping from MPI->PMPI */
#include "mpioprof.h"
#endif

#ifdef FORTRANCAPS
#define mpi_file_set_size_ PMPI_FILE_SET_SIZE
#elif defined(FORTRANDOUBLEUNDERSCORE)
#define mpi_file_set_size_ pmpi_file_set_size__
#elif !defined(FORTRANUNDERSCORE)
#if defined(HPUX) || defined(SPPUX)
#pragma _HP_SECONDARY_DEF pmpi_file_set_size pmpi_file_set_size_
#endif
#define mpi_file_set_size_ pmpi_file_set_size
#else
#if defined(HPUX) || defined(SPPUX)
#pragma _HP_SECONDARY_DEF pmpi_file_set_size_ pmpi_file_set_size
#endif
#define mpi_file_set_size_ pmpi_file_set_size_
#endif

#else

#ifdef FORTRANCAPS
#define mpi_file_set_size_ MPI_FILE_SET_SIZE
#elif defined(FORTRANDOUBLEUNDERSCORE)
#define mpi_file_set_size_ mpi_file_set_size__
#elif !defined(FORTRANUNDERSCORE)
#if defined(HPUX) || defined(SPPUX)
#pragma _HP_SECONDARY_DEF mpi_file_set_size mpi_file_set_size_
#endif
#define mpi_file_set_size_ mpi_file_set_size
#else
#if defined(HPUX) || defined(SPPUX)
#pragma _HP_SECONDARY_DEF mpi_file_set_size_ mpi_file_set_size
#endif
#endif
#endif

/* Prototype to keep compiler happy */
FORTRAN_API void FORT_CALL mpi_file_set_size_(MPI_Fint *fh,MPI_Offset *size, int *ierr );

FORTRAN_API void FORT_CALL mpi_file_set_size_(MPI_Fint *fh,MPI_Offset *size, int *ierr )
{
    MPI_File fh_c;
    
    fh_c = MPI_File_f2c(*fh);
    *ierr = MPI_File_set_size(fh_c,*size);
}

