From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH 1/2] libaal: Fix configure warnings
Date: Tue, 11 Oct 2016 12:12:19 +0200
Message-ID: <d574e527-6287-ca08-c6b7-240aa64e1cca@gmail.com>
References: <alpine.DEB.2.20.16.1610101943430.17634@trent.utfs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=VQesPAqkDJEh/24laZ3sXHwhMRdGEXeLB5ntFhJfiqY=;
        b=EXQfiMPKUqkqrHmvEpyi4dLxXsd1TWVPeiOCCLsXuYsTejeYCDVVEKoBb391gWZ52t
         kP8LWt0Bica8F3zHc3YtAhV90YVw3kqH0p1T6WrMSAChe0Kef9YMAus3OL0UJUdRUAmY
         L0ZS1oV5J1dfhh6/2uq8IsCJ8GJCBtsLTQ0YtkxKO25plBBSjUglijGANr9FGgzbVDpz
         sV9MgJ4Kbz8OPJS11J77mDpRcRF6ULuQkd0hm1iiNbSIvKKZtvlF+rzHfNfpqueEi0no
         V26uedIDfyTkE0R+DBVjFDuEE+gfKttqZJCGyWtPD24C0XzsICaUDV8elIIfkLT8MMmQ
         Rilw==
In-Reply-To: <alpine.DEB.2.20.16.1610101943430.17634@trent.utfs.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christian Kujau <lists@nerdbynature.de>
Cc: reiserfs-devel@vger.kernel.org

Thanks!
Edward.

On 10/11/2016 04:45 AM, Christian Kujau wrote:
> Fixes the following configure warnings (seen on Debian/stable)
>
> * Makefile.am:16: warning: all-sources: non-POSIX variable name
> * aclocal: warning: autoconf input should be named 'configure.ac', not 'configure.in'
> * src/Makefile.am:27: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
> * suspicious cache-id, must contain _cv_ to be cached
> * No need for Bash in prepare, run-ldconfig
> * Fixed bashism in ./run-ldconfig
>    > possible bashism in run-ldconfig line 8 (should be >word 2>&1):
>    >   which ldconfig 2>&1>/dev/null;
>
> Signed-off-by: Christian Kujau <lists@nerdbynature.de>
> ---
>   Makefile.am     |   4 +-
>   configure.ac    | 210 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   configure.in    | 209 -------------------------------------------------------
>   prepare         |   2 +-
>   run-ldconfig    |   4 +-
>   src/Makefile.am |   2 +-
>   6 files changed, 216 insertions(+), 215 deletions(-)
>   create mode 100644 configure.ac
>   delete mode 100644 configure.in
>
> diff --git a/Makefile.am b/Makefile.am
> index 721df90..2347e41 100644
> --- a/Makefile.am
> +++ b/Makefile.am
> @@ -6,12 +6,12 @@ EXTRA_DIST	= AUTHORS COPYING TODO NEWS BUGS README CREDITS THANKS \
>   aclocaldir 	= $(datadir)/aclocal
>   aclocal_DATA	= libaal.m4
>   
> -define all-sources
> +define all_sources
>   	( find ./ -name '*.[ch]' -print | grep -v SCCS )
>   endef
>   
>   ETAGS:
> -	$(all-sources) | etags -
> +	$(all_sources) | etags -
>   
>   install-exec-hook:
>   	./run-ldconfig $(libdir)
> diff --git a/configure.ac b/configure.ac
> new file mode 100644
> index 0000000..5d7a7a2
> --- /dev/null
> +++ b/configure.ac
> @@ -0,0 +1,210 @@
> +# Process this file with autoconf to produce a configure script.
> +AC_INIT(src/libaal.c)
> +AC_CANONICAL_HOST
> +AC_PREREQ(2.50)
> +
> +AH_TEMPLATE([PACKAGE], [Define this to be the name of the package.])
> +AH_TEMPLATE([VERSION], [Define to the version of the package.])
> +
> +AH_TEMPLATE([LIBAAL_MAX_INTERFACE_VERSION], [Define to the max interface version.])
> +AH_TEMPLATE([LIBAAL_MIN_INTERFACE_VERSION], [Define to the min interface version.])
> +AH_TEMPLATE([loff_t], [Define to loff_t])
> +AH_TEMPLATE([ENABLE_DEBUG], [Define for enable debug info.])
> +AH_TEMPLATE([ENABLE_MEMORY_MANAGER], [Define for enable simple memory manager.])
> +
> +LIBAAL_MAJOR_VERSION=1
> +LIBAAL_MINOR_VERSION=0
> +LIBAAL_MICRO_VERSION=6
> +
> +LIBAAL_INTERFACE_AGE=0
> +LIBAAL_BINARY_AGE=0
> +LIBAAL_VERSION=$LIBAAL_MAJOR_VERSION.$LIBAAL_MINOR_VERSION.$LIBAAL_MICRO_VERSION
> +
> +LT_RELEASE=$LIBAAL_MAJOR_VERSION.$LIBAAL_MINOR_VERSION
> +
> +LT_CURRENT=`expr $LIBAAL_MICRO_VERSION - $LIBAAL_INTERFACE_AGE`
> +
> +LT_REVISION=$LIBAAL_INTERFACE_AGE
> +
> +LT_AGE=`expr $LIBAAL_BINARY_AGE - $LIBAAL_INTERFACE_AGE`
> +
> +AC_SUBST(LT_RELEASE)
> +AC_SUBST(LT_CURRENT)
> +AC_SUBST(LT_REVISION)
> +AC_SUBST(LT_AGE)
> +
> +PACKAGE=libaal
> +VERSION=$LIBAAL_VERSION
> +
> +AM_INIT_AUTOMAKE($PACKAGE, $VERSION)
> +
> +AM_CONFIG_HEADER(config.h)
> +AM_MAINTAINER_MODE
> +
> +AC_DEFINE_UNQUOTED(LIBAAL_MAX_INTERFACE_VERSION, $LIBAAL_BINARY_AGE)
> +AC_DEFINE_UNQUOTED(LIBAAL_MIN_INTERFACE_VERSION, $LIBAAL_INTERFACE_AGE)
> +
> +AM_ENABLE_SHARED
> +
> +AC_ARG_ENABLE(Werror,
> +    [  --enable-Werror               enable build with gcc -Werror], ,
> +	enable_Werror=no
> +)
> +
> +AC_ARG_ENABLE(debug,
> +    [  --enable-debug                enable debug information in binaries], ,
> +	enable_debug=no
> +)
> +
> +AC_ARG_ENABLE(libminimal,
> +    [  --disable-libminimal          disable building of minimal footprint library], ,
> +        enable_libminimal=yes
> +)
> +
> +AC_ARG_ENABLE(memory_manager,
> +    [  --disable-memory-manager      disable memory manager in minimal library], ,
> +	enable_memory_manager=yes
> +)
> +
> +# Checks for programs.
> +AC_PROG_CC
> +
> +# Checks for libraries.
> +
> +# Checks for header files.
> +AC_HEADER_STDC
> +AC_CHECK_HEADERS([errno.h fcntl.h stdlib.h string.h sys/ioctl.h unistd.h linux/falloc.h linux/types.h])
> +
> +AC_C_BIGENDIAN
> +
> +# Checks for typedefs, structures, and compiler characteristics.
> +AC_C_CONST
> +AC_C_INLINE
> +AC_TYPE_OFF_T
> +AC_STRUCT_TM
> +
> +# Checks for library functions.
> +AC_PROG_GCC_TRADITIONAL
> +AC_FUNC_MEMCMP
> +AC_HEADER_STDC
> +AC_CHECK_FUNCS([memmove memset strchr strerror strpbrk strrchr fallocate])
> +
> +# The options -falign-* are supported by gcc 3.0 or later.
> +# Probably it is sufficient to only check for -falign-loops.
> +AC_CACHE_CHECK([whether -falign-loops works], [falign_loop_flag_cv_], [
> +  saved_CPPFLAGS="$CPPFLAGS"
> +  CPPFLAGS="-falign-loops=1"
> +  AC_TRY_COMPILE(, , [falign_loop_flag_cv_=yes], [falign_loop_flag_cv_=no])
> +  CPPFLAGS="$saved_CPPFLAGS"
> +])
> +
> +# Checking for compiler warning options
> +AC_CACHE_CHECK([whether -Wuninitialized works], [uninitialized_cv_], [
> +  saved_CPPFLAGS="$CPPFLAGS"
> +  CPPFLAGS="-Wuninitialized"
> +  AC_TRY_COMPILE(, , [uninitialized_cv_=yes], [uninitialized_cv_=no])
> +  CPPFLAGS="$saved_CPPFLAGS"
> +])
> +
> +AC_CACHE_CHECK([whether -Wno-unused-parameter works], [no_unused_parameter_cv_], [
> +  saved_CPPFLAGS="$CPPFLAGS"
> +  CPPFLAGS="-Wno-unused-parameter"
> +  AC_TRY_COMPILE(, , [no_unused_parameter_cv_=yes], [no_unused_parameter_cv_=no])
> +  CPPFLAGS="$saved_CPPFLAGS"
> +])
> +
> +AC_CACHE_CHECK([whether -Wredundant-decls works], [redundant_decls_cv_], [
> +  saved_CPPFLAGS="$CPPFLAGS"
> +  CPPFLAGS="-Wredundant-decls"
> +  AC_TRY_COMPILE(, , [redundant_decls_cv_=yes], [redundant_decls_cv_=no])
> +  CPPFLAGS="$saved_CPPFLAGS"
> +])
> +
> +# Force no alignment to save space.
> +if test "x$falign_loop_flag" = xyes; then
> +  ALIGN_FLAGS="-falign-jumps=1 -falign-loops=1 -falign-functions=1 -falign-labels=1 -fomit-frame-pointer -fno-inline -fstrength-reduce"
> +else
> +  ALIGN_FLAGS="-malign-jumps=1 -malign-loops=1 -malign-functions=1"
> +fi
> +
> +CFLAGS=""
> +MINIMAL_CFLAGS=""
> +GENERIC_CFLAGS=""
> +
> +# make libc threadsafe (not required for us for awhile, but useful other users of
> +# libaal)
> +
> +GENERIC_CFLAGS="$GENERIC_CFLAGS -D_REENTRANT"
> +
> +AC_SYS_LARGEFILE
> +if test x${ac_cv_sys_file_offset_bits} = xno; then
> +	AC_MSG_WARN(Can't detect right _FILE_OFFSET_BITS. Will be forced to 64bit.)
> +	ac_cv_sys_file_offset_bits=64
> +fi
> +
> +GENERIC_CFLAGS="$GENERIC_CFLAGS -D_FILE_OFFSET_BITS=${ac_cv_sys_file_offset_bits}"
> +
> +AC_CHECK_SIZEOF(off_t, 64, [
> +	#include <stdio.h>
> +	#include <sys/types.h>
> +	#include <unistd.h>
> +])
> +
> +AM_PROG_LIBTOOL
> +
> +if test x$enable_libminimal = xyes; then
> +    if test x$enable_memory_manager = xyes; then
> +	MEMORY_MANAGER_CFLAGS="-DENABLE_MEMORY_MANAGER"
> +    fi
> +
> +    MINIMAL_CFLAGS="$MINIMAL_CFLAGS -DENABLE_MINIMAL $MEMORY_MANAGER_CFLAGS $ALIGN_FLAGS"
> +fi
> +
> +CFLAGS="$CFLAGS -W -Wall"
> +
> +if test x$enable_debug = xyes; then
> +    GENERIC_CFLAGS="$GENERIC_CFLAGS -O0 -g"
> +    MINIMAL_CFLAGS="$MINIMAL_CFLAGS -O0 -g"
> +else
> +    GENERIC_CFLAGS="$GENERIC_CFLAGS -O3"
> +    MINIMAL_CFLAGS="$MINIMAL_CFLAGS -Os"
> +
> +    if test "x$uninitialized" = xyes; then
> +       CFLAGS="$CFLAGS -Wuninitialized"
> +    fi
> +fi
> +
> +if test "x$no_unused_parameter" = xyes; then
> +    CFLAGS="$CFLAGS -Wno-unused-parameter"
> +else
> +    CFLAGS="$CFLAGS -Wno-unused"
> +fi
> +
> +if test "x$redundant_decls" = xyes; then
> +    CFLAGS="$CFLAGS -Wredundant-decls"
> +fi
> +
> +if test x$enable_Werror = xyes; then
> +    CFLAGS="$CFLAGS -Werror"
> +fi
> +
> +AM_CONDITIONAL(ENABLE_MINIMAL, test x$enable_libminimal = xyes)
> +AM_CONDITIONAL(ENABLE_DEBUG, test x$enable_debug = xyes)
> +
> +if test x$enable_debug = xyes; then
> +    AC_DEFINE(ENABLE_DEBUG)
> +fi
> +
> +AC_SUBST(MINIMAL_CFLAGS)
> +AC_SUBST(GENERIC_CFLAGS)
> +
> +AC_OUTPUT([
> +    Makefile
> +    include/Makefile
> +    include/aal/Makefile
> +    src/Makefile
> +    libaal.spec
> +])
> +
> +echo
> +echo Type \'make\' to compile libaal and \'make install\' to install it.
> diff --git a/configure.in b/configure.in
> deleted file mode 100644
> index 7afd0b7..0000000
> --- a/configure.in
> +++ /dev/null
> @@ -1,209 +0,0 @@
> -# Process this file with autoconf to produce a configure script.
> -AC_INIT(src/libaal.c)
> -AC_CANONICAL_HOST
> -AC_PREREQ(2.50)
> -
> -AH_TEMPLATE([PACKAGE], [Define this to be the name of the package.])
> -AH_TEMPLATE([VERSION], [Define to the version of the package.])
> -
> -AH_TEMPLATE([LIBAAL_MAX_INTERFACE_VERSION], [Define to the max interface version.])
> -AH_TEMPLATE([LIBAAL_MIN_INTERFACE_VERSION], [Define to the min interface version.])
> -AH_TEMPLATE([loff_t], [Define to loff_t])
> -AH_TEMPLATE([ENABLE_DEBUG], [Define for enable debug info.])
> -AH_TEMPLATE([ENABLE_MEMORY_MANAGER], [Define for enable simple memory manager.])
> -
> -LIBAAL_MAJOR_VERSION=1
> -LIBAAL_MINOR_VERSION=0
> -LIBAAL_MICRO_VERSION=6
> -
> -LIBAAL_INTERFACE_AGE=0
> -LIBAAL_BINARY_AGE=0
> -LIBAAL_VERSION=$LIBAAL_MAJOR_VERSION.$LIBAAL_MINOR_VERSION.$LIBAAL_MICRO_VERSION
> -
> -LT_RELEASE=$LIBAAL_MAJOR_VERSION.$LIBAAL_MINOR_VERSION
> -
> -LT_CURRENT=`expr $LIBAAL_MICRO_VERSION - $LIBAAL_INTERFACE_AGE`
> -
> -LT_REVISION=$LIBAAL_INTERFACE_AGE
> -
> -LT_AGE=`expr $LIBAAL_BINARY_AGE - $LIBAAL_INTERFACE_AGE`
> -
> -AC_SUBST(LT_RELEASE)
> -AC_SUBST(LT_CURRENT)
> -AC_SUBST(LT_REVISION)
> -AC_SUBST(LT_AGE)
> -
> -PACKAGE=libaal
> -VERSION=$LIBAAL_VERSION
> -
> -AM_INIT_AUTOMAKE($PACKAGE, $VERSION)
> -AM_CONFIG_HEADER(config.h)
> -AM_MAINTAINER_MODE
> -
> -AC_DEFINE_UNQUOTED(LIBAAL_MAX_INTERFACE_VERSION, $LIBAAL_BINARY_AGE)
> -AC_DEFINE_UNQUOTED(LIBAAL_MIN_INTERFACE_VERSION, $LIBAAL_INTERFACE_AGE)
> -
> -AM_ENABLE_SHARED
> -
> -AC_ARG_ENABLE(Werror,
> -    [  --enable-Werror               enable build with gcc -Werror], ,
> -	enable_Werror=no
> -)
> -
> -AC_ARG_ENABLE(debug,
> -    [  --enable-debug                enable debug information in binaries], ,
> -	enable_debug=no
> -)
> -
> -AC_ARG_ENABLE(libminimal,
> -    [  --disable-libminimal          disable building of minimal footprint library], ,
> -        enable_libminimal=yes
> -)
> -
> -AC_ARG_ENABLE(memory_manager,
> -    [  --disable-memory-manager      disable memory manager in minimal library], ,
> -	enable_memory_manager=yes
> -)
> -
> -# Checks for programs.
> -AC_PROG_CC
> -
> -# Checks for libraries.
> -
> -# Checks for header files.
> -AC_HEADER_STDC
> -AC_CHECK_HEADERS([errno.h fcntl.h stdlib.h string.h sys/ioctl.h unistd.h linux/falloc.h linux/types.h])
> -
> -AC_C_BIGENDIAN
> -
> -# Checks for typedefs, structures, and compiler characteristics.
> -AC_C_CONST
> -AC_C_INLINE
> -AC_TYPE_OFF_T
> -AC_STRUCT_TM
> -
> -# Checks for library functions.
> -AC_PROG_GCC_TRADITIONAL
> -AC_FUNC_MEMCMP
> -AC_HEADER_STDC
> -AC_CHECK_FUNCS([memmove memset strchr strerror strpbrk strrchr fallocate])
> -
> -# The options -falign-* are supported by gcc 3.0 or later.
> -# Probably it is sufficient to only check for -falign-loops.
> -AC_CACHE_CHECK([whether -falign-loops works], [falign_loop_flag], [
> -  saved_CPPFLAGS="$CPPFLAGS"
> -  CPPFLAGS="-falign-loops=1"
> -  AC_TRY_COMPILE(, , [falign_loop_flag=yes], [falign_loop_flag=no])
> -  CPPFLAGS="$saved_CPPFLAGS"
> -])
> -
> -# Checking for compiler warning options
> -AC_CACHE_CHECK([whether -Wuninitialized works], [uninitialized], [
> -  saved_CPPFLAGS="$CPPFLAGS"
> -  CPPFLAGS="-Wuninitialized"
> -  AC_TRY_COMPILE(, , [uninitialized=yes], [uninitialized=no])
> -  CPPFLAGS="$saved_CPPFLAGS"
> -])
> -
> -AC_CACHE_CHECK([whether -Wno-unused-parameter works], [no_unused_parameter], [
> -  saved_CPPFLAGS="$CPPFLAGS"
> -  CPPFLAGS="-Wno-unused-parameter"
> -  AC_TRY_COMPILE(, , [no_unused_parameter=yes], [no_unused_parameter=no])
> -  CPPFLAGS="$saved_CPPFLAGS"
> -])
> -
> -AC_CACHE_CHECK([whether -Wredundant-decls works], [redundant_decls], [
> -  saved_CPPFLAGS="$CPPFLAGS"
> -  CPPFLAGS="-Wredundant-decls"
> -  AC_TRY_COMPILE(, , [redundant_decls=yes], [redundant_decls=no])
> -  CPPFLAGS="$saved_CPPFLAGS"
> -])
> -
> -# Force no alignment to save space.
> -if test "x$falign_loop_flag" = xyes; then
> -  ALIGN_FLAGS="-falign-jumps=1 -falign-loops=1 -falign-functions=1 -falign-labels=1 -fomit-frame-pointer -fno-inline -fstrength-reduce"
> -else
> -  ALIGN_FLAGS="-malign-jumps=1 -malign-loops=1 -malign-functions=1"
> -fi
> -
> -CFLAGS=""
> -MINIMAL_CFLAGS=""
> -GENERIC_CFLAGS=""
> -
> -# make libc threadsafe (not required for us for awhile, but useful other users of
> -# libaal)
> -
> -GENERIC_CFLAGS="$GENERIC_CFLAGS -D_REENTRANT"
> -
> -AC_SYS_LARGEFILE
> -if test x${ac_cv_sys_file_offset_bits} = xno; then
> -	AC_MSG_WARN(Can't detect right _FILE_OFFSET_BITS. Will be forced to 64bit.)
> -	ac_cv_sys_file_offset_bits=64
> -fi
> -
> -GENERIC_CFLAGS="$GENERIC_CFLAGS -D_FILE_OFFSET_BITS=${ac_cv_sys_file_offset_bits}"
> -
> -AC_CHECK_SIZEOF(off_t, 64, [
> -	#include <stdio.h>
> -	#include <sys/types.h>
> -	#include <unistd.h>
> -])
> -
> -AM_PROG_LIBTOOL
> -
> -if test x$enable_libminimal = xyes; then
> -    if test x$enable_memory_manager = xyes; then
> -	MEMORY_MANAGER_CFLAGS="-DENABLE_MEMORY_MANAGER"
> -    fi
> -
> -    MINIMAL_CFLAGS="$MINIMAL_CFLAGS -DENABLE_MINIMAL $MEMORY_MANAGER_CFLAGS $ALIGN_FLAGS"
> -fi
> -
> -CFLAGS="$CFLAGS -W -Wall"
> -
> -if test x$enable_debug = xyes; then
> -    GENERIC_CFLAGS="$GENERIC_CFLAGS -O0 -g"
> -    MINIMAL_CFLAGS="$MINIMAL_CFLAGS -O0 -g"
> -else
> -    GENERIC_CFLAGS="$GENERIC_CFLAGS -O3"
> -    MINIMAL_CFLAGS="$MINIMAL_CFLAGS -Os"
> -
> -    if test "x$uninitialized" = xyes; then
> -       CFLAGS="$CFLAGS -Wuninitialized"
> -    fi
> -fi
> -
> -if test "x$no_unused_parameter" = xyes; then
> -    CFLAGS="$CFLAGS -Wno-unused-parameter"
> -else
> -    CFLAGS="$CFLAGS -Wno-unused"
> -fi
> -
> -if test "x$redundant_decls" = xyes; then
> -    CFLAGS="$CFLAGS -Wredundant-decls"
> -fi
> -
> -if test x$enable_Werror = xyes; then
> -    CFLAGS="$CFLAGS -Werror"
> -fi
> -
> -AM_CONDITIONAL(ENABLE_MINIMAL, test x$enable_libminimal = xyes)
> -AM_CONDITIONAL(ENABLE_DEBUG, test x$enable_debug = xyes)
> -
> -if test x$enable_debug = xyes; then
> -    AC_DEFINE(ENABLE_DEBUG)
> -fi
> -
> -AC_SUBST(MINIMAL_CFLAGS)
> -AC_SUBST(GENERIC_CFLAGS)
> -
> -AC_OUTPUT([
> -    Makefile
> -    include/Makefile
> -    include/aal/Makefile
> -    src/Makefile
> -    libaal.spec
> -])
> -
> -echo
> -echo Type \'make\' to compile libaal and \'make install\' to install it.
> diff --git a/prepare b/prepare
> index c3eaa83..1a5ffd5 100644
> --- a/prepare
> +++ b/prepare
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/bin/sh
>   
>   echo "aclocal ..."
>   aclocal && (
> diff --git a/run-ldconfig b/run-ldconfig
> index 227f126..68e3c3b 100755
> --- a/run-ldconfig
> +++ b/run-ldconfig
> @@ -1,11 +1,11 @@
> -#!/bin/bash
> +#!/bin/sh
>   
>   ldc="";
>   if [ -x /sbin/ldconfig ]; then
>   	ldc="/sbin/ldconfig";
>   fi
>   if test x$ldc = x; then
> -	which ldconfig 2>&1>/dev/null;
> +	which ldconfig > /dev/null 2>&1
>   	if test $? -eq 0; then
>   		ldc=`which ldconfig`;
>   	fi
> diff --git a/src/Makefile.am b/src/Makefile.am
> index 37ecf7e..50788c5 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -24,5 +24,5 @@ libaal_minimal_la_SOURCES  = $(libaal_sources)
>   libaal_minimal_la_CFLAGS   = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(aalincludedir)
> +AM_CPPFLAGS		= $(aalincludedir)
>   

