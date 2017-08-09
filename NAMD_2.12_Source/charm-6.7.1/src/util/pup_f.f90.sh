#!/bin/sh
#
# Shell script to creat the pup_f.f90 file.
#  Used to avoid duplicate copy-and-paste codein pup_f.f90.

cat > pup_f.f90 << END_OF_HEADER
!   DO NOT EDIT THIS FILE, GENERATE IT FROM RUNNING pup_f.f90.sh
    module pupmod
      implicit none

      interface
        function fpup_issizing(p)
          INTEGER :: p
          logical fpup_issizing
        end function
        function fpup_ispacking(p)
          INTEGER :: p
          logical fpup_ispacking
        end function
        function fpup_isunpacking(p)
          INTEGER :: p
          logical fpup_isunpacking
        end function
        function fpup_isdeleting(p)
          INTEGER :: p
          logical fpup_isdeleting
        end function
        function fpup_isuserlevel(p)
          INTEGER :: p
          logical fpup_isuserlevel
        end function

        subroutine fpup_char(p, d)
          INTEGER :: p
          CHARACTER :: d
        end subroutine
        subroutine fpup_short(p, d)
          INTEGER :: p
          INTEGER (KIND=2) :: d
        end subroutine
        subroutine fpup_int(p, d)
          INTEGER :: p
          INTEGER (KIND=4) :: d
        end subroutine
        subroutine fpup_long(p, d)
          INTEGER :: p
          INTEGER (KIND=8) :: d
        end subroutine
        subroutine fpup_real(p, d)
          INTEGER :: p
          REAL (KIND=4)  :: d
        end subroutine
        subroutine fpup_double(p, d)
          INTEGER :: p
          REAL (KIND=8)  :: d
        end subroutine
        subroutine fpup_logical(p, d)
          INTEGER :: p
          LOGICAL :: d
        end subroutine

        subroutine fpup_complex(p, d)
          INTEGER :: p
          COMPLEX*8 :: d
        end subroutine

        subroutine fpup_doublecomplex(p, d)
          INTEGER :: p
          COMPLEX*16 :: d
        end subroutine

      end interface

END_OF_HEADER

for t in chars ints longs reals doubles logicals complexes doublecomplexes
do
  echo "      interface fpup_${t}" >> pup_f.f90
  if test $t = "chars" 
  then
  echo "       module procedure fpup_${t}_0" >> pup_f.f90
  fi
  for i in  1 2 3 4 5 6 7
  do
  echo "       module procedure fpup_${t}_${i}" >> pup_f.f90
  done
  echo "      end interface fpup_${t}" >> pup_f.f90
  echo >> pup_f.f90
done

cat >> pup_f.f90 << END_OF_HEADER
      interface pup
        module procedure pi,pia1d,pia2d,pia3d,pia4d,pia5d,pia6d,pia7d
        module procedure pc,pca1d,pca2d,pca3d,pca4d,pca5d,pca6d,pca7d
        module procedure ps,psa1d,psa2d,psa3d,psa4d,psa5d,psa6d,psa7d
        module procedure pr,pra1d,pra2d,pra3d,pra4d,pra5d,pra6d,pra7d
        module procedure pd,pda1d,pda2d,pda3d,pda4d,pda5d,pda6d,pda7d
        module procedure pl,pla1d,pla2d,pla3d,pla4d,pla5d,pla6d,pla7d
        module procedure px,pxa1d,pxa2d,pxa3d,pxa4d,pxa5d,pxa6d,pxa7d
        module procedure py,pya1d,pya2d,pya3d,pya4d,pya5d,pya6d,pya7d
      end interface
      interface apup
        module procedure apia1d,apia2d,apia3d,apia4d,apia5d,apia6d,apia7d
        module procedure apca1d,apca2d,apca3d,apca4d,apca5d,apca6d,apca7d
        module procedure apsa1d,apsa2d,apsa3d,apsa4d,apsa5d,apsa6d,apsa7d
        module procedure apra1d,apra2d,apra3d,apra4d,apra5d,apra6d,apra7d
        module procedure apda1d,apda2d,apda3d,apda4d,apda5d,apda6d,apda7d
        module procedure apla1d,apla2d,apla3d,apla4d,apla5d,apla6d,apla7d
        module procedure apxa1d,apxa2d,apxa3d,apxa4d,apxa5d,apxa6d,apxa7d
        module procedure apya1d,apya2d,apya3d,apya4d,apya5d,apya6d,apya7d

      ! NOTE: for compilers with full Fortran2003 support (GNU-4.9+, IC-15.0+, etc.)
      ! ... we can provide a single apup interface for both pointers and allocatables
      ! ... by simply removing the next two lines.
      end interface
      interface apup_al
        module procedure apia1d_al,apia2d_al,apia3d_al,apia4d_al,apia5d_al,apia6d_al,apia7d_al
        module procedure apca1d_al,apca2d_al,apca3d_al,apca4d_al,apca5d_al,apca6d_al,apca7d_al
        module procedure apsa1d_al,apsa2d_al,apsa3d_al,apsa4d_al,apsa5d_al,apsa6d_al,apsa7d_al
        module procedure apra1d_al,apra2d_al,apra3d_al,apra4d_al,apra5d_al,apra6d_al,apra7d_al
        module procedure apda1d_al,apda2d_al,apda3d_al,apda4d_al,apda5d_al,apda6d_al,apda7d_al
        module procedure apla1d_al,apla2d_al,apla3d_al,apla4d_al,apla5d_al,apla6d_al,apla7d_al
        module procedure apxa1d_al,apxa2d_al,apxa3d_al,apxa4d_al,apxa5d_al,apxa6d_al,apxa7d_al
        module procedure apya1d_al,apya2d_al,apya3d_al,apya4d_al,apya5d_al,apya6d_al,apya7d_al
      end interface
      contains
      function pup_issz(p)
        INTEGER :: p
        logical pup_issz
        pup_issz = fpup_issizing(p)
      end function
      function pup_ispk(p)
        INTEGER :: p
        logical pup_ispk
        pup_ispk = fpup_ispacking(p)
      end function
      function pup_isupk(p)
        INTEGER :: p
        logical pup_isupk
        pup_isupk = fpup_isunpacking(p)
      end function
      function pup_isdel(p)
        INTEGER :: p
        logical pup_isdel
        pup_isdel = fpup_isdeleting(p)
      end function
      function pup_isul(p)
        INTEGER :: p
        logical pup_isul
        pup_isul = fpup_isuserlevel(p)
      end function

     
      subroutine fpup_chars_0(p, d, c)
        INTEGER :: p
        CHARACTER(LEN=*)     d
        INTEGER :: c
        call fpup_charsg(p, d, c)
      end subroutine
END_OF_HEADER

for data in "chars/character" "shorts/integer(kind=2)" "ints/integer(kind=4)" "longs/integer(kind=8)" "reals/real(kind=4)" "doubles/real(kind=8)" "logicals/logical"\
       "complexes/complex*8" "doublecomplexes/complex*16"
do
 pupname=`echo $data | awk -F/ '{print $1}'`
 typename=`echo $data | awk -F/ '{print $2}'`
 for i in 1 2 3 4 5 6 7
 do
  echo "       subroutine fpup_${pupname}_${i}(p, d, c)" >> pup_f.f90
  echo "        INTEGER :: p" >> pup_f.f90
  echo -n "        ${typename}, intent(inout), dimension(:" >> pup_f.f90
  n=1
  while [ $n -lt $i ]
  do
    echo -n ",:" >> pup_f.f90
    n=`expr $n + 1`
  done
  echo ") :: d" >> pup_f.f90
  echo "        INTEGER :: c" >> pup_f.f90
  echo "        call fpup_${pupname}g(p, d, c)"  >> pup_f.f90
  echo "       end subroutine" >> pup_f.f90
 done
 echo >> pup_f.f90
done

#
# Create pup routines for each data type:
#   The "p" routines just copy the data.
#   The "ap" routines also allocate and free the buffer.
# suffix _al means input is allocatable, otherwise its pointer
#
for data in "int/ints/i/integer" "short/shorts/s/integer(kind=2)" "char/chars/c/character" "real/reals/r/real(kind=4)" "double/doubles/d/real(kind=8)" "logical/logicals/l/logical"\
      "complex/complexes/x/complex*8" "doublecomplex/doublecomplexes/y/complex*16"
do
	  pupname=`echo $data | awk -F/ '{print $1}'`
  	pupnames=`echo $data | awk -F/ '{print $2}'`
  	cname=`echo $data | awk -F/ '{print $3}'`
  	fname=`echo $data | awk -F/ '{print $4}'`
  	echo "Making pup routines for data type $pupname/$cname/$fname"
  	cat >> pup_f.f90 << END_OF_DATATYPE


      subroutine p${cname}(p, i)
        INTEGER :: p
        $fname, intent(inout) :: i
        call fpup_${pupname}(p, i)
      end subroutine
      
      subroutine p${cname}a1d(p, arr)
        INTEGER :: p
        $fname, intent(inout), dimension(:) :: arr
        call fpup_${pupnames}(p, arr, size(arr))
      end subroutine
      subroutine p${cname}a2d(p, arr)
        INTEGER :: p
        $fname, intent(inout), dimension(:,:) :: arr
        call fpup_${pupnames}(p, arr, size(arr))
      end subroutine
      subroutine p${cname}a3d(p, arr)
        INTEGER :: p
        $fname, intent(inout), dimension(:,:,:) :: arr
        call fpup_${pupnames}(p, arr, size(arr))
      end subroutine
      subroutine p${cname}a4d(p, arr)
        INTEGER :: p
        $fname, intent(inout), dimension(:,:,:,:) :: arr
        call fpup_${pupnames}(p, arr, size(arr))
      end subroutine
      subroutine p${cname}a5d(p, arr)
        INTEGER :: p
        $fname, intent(inout), dimension(:,:,:,:,:) :: arr
        call fpup_${pupnames}(p, arr, size(arr))
      end subroutine
      subroutine p${cname}a6d(p, arr)
        INTEGER :: p
        $fname, intent(inout), dimension(:,:,:,:,:,:) :: arr
        call fpup_${pupnames}(p, arr, size(arr))
      end subroutine
      subroutine p${cname}a7d(p, arr)
        INTEGER :: p
        $fname, intent(inout), dimension(:,:,:,:,:,:,:) :: arr
        call fpup_${pupnames}(p, arr, size(arr))
      end subroutine

END_OF_DATATYPE
done

for arrkind in "pointer/associated/NULLIFY(arr)/" "allocatable/allocated/ /_al"
do
  pointer=`echo $arrkind | awk -F/ '{print $1}'`
  associated=`echo $arrkind | awk -F/ '{print $2}'`
  NULLIFY=`echo $arrkind | awk -F/ '{print $3}'`
  suffix=`echo $arrkind | awk -F/ '{print $4}'`
  for data in "int/ints/i/integer" "short/shorts/s/integer(kind=2)" "char/chars/c/character" "real/reals/r/real(kind=4)" "double/doubles/d/real(kind=8)" "logical/logicals/l/logical"\
    "complex/complexes/x/complex*8" "doublecomplex/doublecomplexes/y/complex*16"
  do
	  pupname=`echo $data | awk -F/ '{print $1}'`
  	pupnames=`echo $data | awk -F/ '{print $2}'`
  	cname=`echo $data | awk -F/ '{print $3}'`
  	fname=`echo $data | awk -F/ '{print $4}'`
  	echo "Making pup routines for data type $pupname/$cname/$fname"
  	cat >> pup_f.f90 << END_OF_DATATYPE

      subroutine ap${cname}a1d$suffix(p, arr)
        INTEGER :: p
        $fname, $pointer, dimension(:) :: arr
        integer :: n(1)
        IF (fpup_isunpacking(p)) THEN
          CALL fpup_ints(p,n,1)
          If (n(1) >= 0) THEN
            ALLOCATE(arr(n(1)))
            call fpup_${pupnames}(p, arr, n(1))
          ELSE
            $NULLIFY
          END If
        ELSE ! packing
          If ($associated(arr)) THEN
            n(1)=SIZE(arr,DIM=1)
            CALL fpup_ints(p,n,1)
            call fpup_${pupnames}(p, arr, n(1))
          ELSE
            n(1) = -1
            CALL fpup_ints(p,n,1)
          End If
        END IF
        IF (fpup_isdeleting(p) .and. $associated(arr)) THEN
          deallocate(arr)
        END IF
      end subroutine

      subroutine ap${cname}a2d$suffix(p, arr)
        INTEGER :: p
        $fname, $pointer, dimension(:,:) :: arr
        integer :: n(2)
        IF (fpup_isunpacking(p)) THEN
          CALL fpup_ints(p,n,2)
          If (n(1) >= 0) THEN
            ALLOCATE(arr(n(1),n(2)))
            call fpup_${pupnames}(p, arr, size(arr))
          ELSE
            $NULLIFY
          END If
        ELSE ! packing
          If ($associated(arr)) THEN
            n(1)=SIZE(arr,DIM=1)
            n(2)=SIZE(arr,DIM=2)
            CALL fpup_ints(p,n,2)
            call fpup_${pupnames}(p, arr, size(arr))
          ELSE
            n(1) = -1
            n(2) = -1
            CALL fpup_ints(p,n,2)
          End If
        END IF
        IF (fpup_isdeleting(p) .and. $associated(arr)) THEN
          deallocate(arr)
        END IF
      end subroutine

      subroutine ap${cname}a3d$suffix(p, arr)
        INTEGER :: p
        $fname, $pointer, dimension(:,:,:) :: arr
        integer :: n(3)
        IF (fpup_isunpacking(p)) THEN
          CALL fpup_ints(p,n,3)
          If (n(1) >= 0) THEN
            ALLOCATE(arr(n(1),n(2),n(3)))
            call fpup_${pupnames}(p, arr, size(arr))
          ELSE
            $NULLIFY
          END If
        ELSE ! packing
          If ($associated(arr)) THEN
            n(1)=SIZE(arr,DIM=1)
            n(2)=SIZE(arr,DIM=2)
            n(3)=SIZE(arr,DIM=3)
            CALL fpup_ints(p,n,3)
            call fpup_${pupnames}(p, arr, size(arr))
          ELSE
            n(1) = -1
            n(2) = -1
            n(3) = -1
            CALL fpup_ints(p,n,3)
          End If
        END IF
        IF (fpup_isdeleting(p) .and. $associated(arr)) THEN
          deallocate(arr)
        END IF
      end subroutine

      subroutine ap${cname}a4d$suffix(p, arr)
        INTEGER :: p
        $fname, $pointer, dimension(:,:,:,:) :: arr
        integer :: n(4)
        IF (fpup_isunpacking(p)) THEN
          CALL fpup_ints(p,n,4)
          If (n(1) >= 0) THEN
            ALLOCATE(arr(n(1),n(2),n(3),n(4)))
            call fpup_${pupnames}(p, arr, size(arr))
          ELSE
            $NULLIFY
          END If
        ELSE ! packing
          If ($associated(arr)) THEN
            n(1)=SIZE(arr,DIM=1)
            n(2)=SIZE(arr,DIM=2)
            n(3)=SIZE(arr,DIM=3)
            n(4)=SIZE(arr,DIM=4)
            CALL fpup_ints(p,n,4)
            call fpup_${pupnames}(p, arr, size(arr))
          ELSE
            n(1) = -1
            n(2) = -1
            n(3) = -1
            n(4) = -1
            CALL fpup_ints(p,n,4)
          End If
        END IF
        IF (fpup_isdeleting(p) .and. $associated(arr)) THEN
          deallocate(arr)
        END IF
      end subroutine

      subroutine ap${cname}a5d$suffix(p, arr)
        INTEGER :: p
        $fname, $pointer, dimension(:,:,:,:,:) :: arr
        integer :: n(5)
        IF (fpup_isunpacking(p)) THEN
          CALL fpup_ints(p,n,5)
          If (n(1) >= 0) THEN
            ALLOCATE(arr(n(1),n(2),n(3),n(4),n(5)))
            call fpup_${pupnames}(p, arr, size(arr))
          ELSE
            $NULLIFY
          END If
        ELSE ! packing
          If ($associated(arr)) THEN
            n(1)=SIZE(arr,DIM=1)
            n(2)=SIZE(arr,DIM=2)
            n(3)=SIZE(arr,DIM=3)
            n(4)=SIZE(arr,DIM=4)
            n(5)=SIZE(arr,DIM=5)
            CALL fpup_ints(p,n,5)
            call fpup_${pupnames}(p, arr, size(arr))
          ELSE
            n(1) = -1
            n(2) = -1
            n(3) = -1
            n(4) = -1
            n(5) = -1
            CALL fpup_ints(p,n,5)
          End If
        END IF
        IF (fpup_isdeleting(p) .and. $associated(arr)) THEN
          deallocate(arr)
        END IF
      end subroutine

      subroutine ap${cname}a6d$suffix(p, arr)
        INTEGER :: p
        $fname, $pointer, dimension(:,:,:,:,:,:) :: arr
        integer :: n(6)
        IF (fpup_isunpacking(p)) THEN
          CALL fpup_ints(p,n,6)
          If (n(1) >= 0) THEN
            ALLOCATE(arr(n(1),n(2),n(3),n(4),n(5),n(6)))
            call fpup_${pupnames}(p, arr, size(arr))
          ELSE
            $NULLIFY
          END If
        ELSE ! packing
          If ($associated(arr)) THEN
            n(1)=SIZE(arr,DIM=1)
            n(2)=SIZE(arr,DIM=2)
            n(3)=SIZE(arr,DIM=3)
            n(4)=SIZE(arr,DIM=4)
            n(5)=SIZE(arr,DIM=5)
            n(6)=SIZE(arr,DIM=6)
            CALL fpup_ints(p,n,6)
            call fpup_${pupnames}(p, arr, size(arr))
          ELSE
            n(1) = -1
            n(2) = -1
            n(3) = -1
            n(4) = -1
            n(5) = -1
            n(6) = -1
            CALL fpup_ints(p,n,6)
          End If
        END IF
        IF (fpup_isdeleting(p) .and. $associated(arr)) THEN
          deallocate(arr)
        END IF
      end subroutine

      subroutine ap${cname}a7d$suffix(p, arr)
        INTEGER :: p
        $fname, $pointer, dimension(:,:,:,:,:,:,:) :: arr
        integer :: n(7)
        IF (fpup_isunpacking(p)) THEN
          CALL fpup_ints(p,n,7)
          If (n(1) >= 0) THEN
            ALLOCATE(arr(n(1),n(2),n(3),n(4),n(5),n(6),n(7)))
            call fpup_${pupnames}(p, arr, size(arr))
          ELSE
            $NULLIFY
          END If
        ELSE ! packing
          If ($associated(arr)) THEN
            n(1)=SIZE(arr,DIM=1)
            n(2)=SIZE(arr,DIM=2)
            n(3)=SIZE(arr,DIM=3)
            n(4)=SIZE(arr,DIM=4)
            n(5)=SIZE(arr,DIM=5)
            n(6)=SIZE(arr,DIM=6)
            n(7)=SIZE(arr,DIM=7)
            CALL fpup_ints(p,n,7)
            call fpup_${pupnames}(p, arr, size(arr))
          ELSE
            n(1) = -1
            n(2) = -1
            n(3) = -1
            n(4) = -1
            n(5) = -1
            n(6) = -1
            n(7) = -1
            CALL fpup_ints(p,n,7)
          End If
        END IF
        IF (fpup_isdeleting(p) .and. $associated(arr)) THEN
          deallocate(arr)
        END IF
        end subroutine

END_OF_DATATYPE

  done
done

echo "    end module" >> pup_f.f90
