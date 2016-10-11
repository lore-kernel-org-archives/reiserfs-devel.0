From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiser4progs: Fix configure warnings
Date: Tue, 11 Oct 2016 12:15:23 +0200
Message-ID: <7f4f1fdb-aaf7-0416-1392-7cb23d873a32@gmail.com>
References: <alpine.DEB.2.20.16.1610101947020.17634@trent.utfs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=CdELVIYqq98LIBxy/mbBH1IWSdVP8sH1V+mmR6KhMxE=;
        b=AnhVq/+H1cZFvyCOg3cN+AaDqsEkwoeeAoZWhZAHgDrtwDiqpwtfFL5FIODmHk7GX9
         vafBdIyT6ocRxbvMKU8jddXa8iMxFB/7UucMuxtCw3GqVj/NISB2PEhEYcrAjBywkify
         2RPRSudC99UE8BcMk6gKITtL5SE5ANCijhl95u/4+HNSWEfMCikdVDZ4j0JbiP1N2lnw
         QGm8RqCt9E4UlOhoDsXZCITnc9kJ3AqfYxdYZeT63mXJGpXjwhrO1NWb4AeGACDS51Ob
         1w1nzm8NgTxYhTB8wd9ATDz9F2IvnoRwid4vyRiJg3cNtAXM/rWBjPm6ZWL9vhKaOByx
         U69w==
In-Reply-To: <alpine.DEB.2.20.16.1610101947020.17634@trent.utfs.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christian Kujau <lists@nerdbynature.de>
Cc: reiserfs-devel@vger.kernel.org

OK.
Thanks!
Edward.

On 10/11/2016 04:48 AM, Christian Kujau wrote:
> Fixes the following configure warnings:
>
> * automake: warning: autoconf input should be named 'configure.ac', not 'configure.in'
> * Makefile.am:22: warning: 'INCLUDES' is the old name for 'AM_CPPFLAGS' (or '*_CPPFLAGS')
> * Makefile.am:16: warning: all-sources: non-POSIX variable name
> * No need for Bash in prepare, run-ldconfig, one_touch_install, demos/detect
> * Fixed bashism in ./run-ldconfig
>    > possible bashism in run-ldconfig line 8 (should be >word 2>&1):
>    >   which ldconfig 2>&1>/dev/null;
> * configure.ac: suspicious cache-id, must contain _cv_ to be cached
>
> Signed-off-by: Christian Kujau <lists@nerdbynature.de>
> ---
>   Makefile.am                            |   6 +-
>   configure.ac                           | 642 +++++++++++++++++++++++++++++++++
>   configure.in                           | 642 ---------------------------------
>   demos/Makefile.am                      |   2 +-
>   demos/detect                           |   4 +-
>   libaux/Makefile.am                     |   2 +-
>   libmisc/Makefile.am                    |   2 +-
>   libreiser4/Makefile.am                 |   2 +-
>   librepair/Makefile.am                  |   2 +-
>   one_touch_install                      |   2 +-
>   plugin/alloc/alloc40/Makefile.am       |   2 +-
>   plugin/compress/Makefile.am            |   2 +-
>   plugin/fibre/dot_o_fibre/Makefile.am   |   2 +-
>   plugin/fibre/ext_1_fibre/Makefile.am   |   2 +-
>   plugin/fibre/ext_3_fibre/Makefile.am   |   2 +-
>   plugin/fibre/lexic_fibre/Makefile.am   |   2 +-
>   plugin/format/format40/Makefile.am     |   2 +-
>   plugin/hash/deg_hash/Makefile.am       |   2 +-
>   plugin/hash/fnv1_hash/Makefile.am      |   2 +-
>   plugin/hash/r5_hash/Makefile.am        |   2 +-
>   plugin/hash/rupasov_hash/Makefile.am   |   2 +-
>   plugin/hash/tea_hash/Makefile.am       |   2 +-
>   plugin/item/bbox40/Makefile.am         |   2 +-
>   plugin/item/body40/Makefile.am         |   2 +-
>   plugin/item/cde40/Makefile.am          |   2 +-
>   plugin/item/ctail40/Makefile.am        |   2 +-
>   plugin/item/extent40/Makefile.am       |   2 +-
>   plugin/item/nodeptr40/Makefile.am      |   2 +-
>   plugin/item/plain40/Makefile.am        |   2 +-
>   plugin/item/stat40/Makefile.am         |   2 +-
>   plugin/item/tail40/Makefile.am         |   2 +-
>   plugin/journal/journal40/Makefile.am   |   2 +-
>   plugin/key/key_common/Makefile.am      |   2 +-
>   plugin/key/key_large/Makefile.am       |   2 +-
>   plugin/key/key_short/Makefile.am       |   2 +-
>   plugin/node/node40/Makefile.am         |   2 +-
>   plugin/node/node41/Makefile.am         |   2 +-
>   plugin/object/ccreg40/Makefile.am      |   2 +-
>   plugin/object/dir40/Makefile.am        |   2 +-
>   plugin/object/obj40/Makefile.am        |   2 +-
>   plugin/object/reg40/Makefile.am        |   2 +-
>   plugin/object/spl40/Makefile.am        |   2 +-
>   plugin/object/sym40/Makefile.am        |   2 +-
>   plugin/oid/oid40/Makefile.am           |   2 +-
>   plugin/policy/extents/Makefile.am      |   2 +-
>   plugin/policy/smart/Makefile.am        |   2 +-
>   plugin/policy/tails/Makefile.am        |   2 +-
>   plugin/sdext/sdext_crypto/Makefile.am  |   2 +-
>   plugin/sdext/sdext_flags/Makefile.am   |   2 +-
>   plugin/sdext/sdext_lt/Makefile.am      |   2 +-
>   plugin/sdext/sdext_lw/Makefile.am      |   2 +-
>   plugin/sdext/sdext_plug/Makefile.am    |   2 +-
>   plugin/sdext/sdext_symlink/Makefile.am |   2 +-
>   plugin/sdext/sdext_unix/Makefile.am    |   2 +-
>   prepare                                |   2 +-
>   progs/debugfs/Makefile.am              |   2 +-
>   progs/fsck/Makefile.am                 |   2 +-
>   progs/measurefs/Makefile.am            |   2 +-
>   progs/mkfs/Makefile.am                 |   2 +-
>   run-ldconfig                           |   4 +-
>   60 files changed, 704 insertions(+), 704 deletions(-)
>   create mode 100644 configure.ac
>   delete mode 100644 configure.in
>
> diff --git a/Makefile.am b/Makefile.am
> index 93550ba..4d11259 100644
> --- a/Makefile.am
> +++ b/Makefile.am
> @@ -8,15 +8,15 @@ EXTRA_DIST	= AUTHORS COPYING TODO NEWS BUGS README CREDITS THANKS \
>   aclocaldir 	= $(datadir)/aclocal
>   aclocal_DATA	= libreiser4.m4
>   
> -define all-sources
> +define all_sources
>   	( find ./ -name '*.[ch]' | grep -v SCCS | grep -v "Attic" | grep -v "reiser4progs" )
>   endef
>   
>   TAGS:
> -	$(all-sources) | etags -
> +	$(all_sources) | etags -
>   
>   tags:
> -	$(all-sources) | xargs -- ctags -w -o TAGS
> +	$(all_sources) | xargs -- ctags -w -o TAGS
>   
>   install-exec-hook:
>   	./run-ldconfig $(libdir)
> diff --git a/configure.ac b/configure.ac
> new file mode 100644
> index 0000000..d77b76b
> --- /dev/null
> +++ b/configure.ac
> @@ -0,0 +1,642 @@
> +# Process this file with autoconf to produce a configure script.
> +AC_INIT(libreiser4/libreiser4.c)
> +AC_CANONICAL_HOST
> +AC_PREREQ(2.50)
> +
> +AH_TEMPLATE([PACKAGE], [Define this to be the name of the package.])
> +AH_TEMPLATE([VERSION], [Define to the version of the package.])
> +
> +AH_TEMPLATE([ENABLE_DEBUG], [Define for enable debug info.])
> +AH_TEMPLATE([HAVE_LIBUUID], [Define for enable libuuid using.])
> +AH_TEMPLATE([HAVE_LIBREADLINE], [Define for enable libreadline using.])
> +
> +AH_TEMPLATE([LIBREISER4_MAX_INTERFACE_VERSION], [Define to the max interface version.])
> +AH_TEMPLATE([LIBREISER4_MIN_INTERFACE_VERSION], [Define to the min interface version.])
> +
> +LIBREISER4_MAJOR_VERSION=1
> +LIBREISER4_MINOR_VERSION=1
> +LIBREISER4_MICRO_VERSION=0
> +
> +LIBREISER4_INTERFACE_AGE=0
> +LIBREISER4_BINARY_AGE=0
> +LIBREISER4_VERSION=$LIBREISER4_MAJOR_VERSION.$LIBREISER4_MINOR_VERSION.$LIBREISER4_MICRO_VERSION
> +
> +LT_RELEASE=$LIBREISER4_MAJOR_VERSION.$LIBREISER4_MINOR_VERSION
> +
> +LT_CURRENT=`expr $LIBREISER4_MICRO_VERSION - $LIBREISER4_INTERFACE_AGE`
> +LT_REVISION=$LIBREISER4_INTERFACE_AGE
> +LT_AGE=`expr $LIBREISER4_BINARY_AGE - $LIBREISER4_INTERFACE_AGE`
> +
> +AC_SUBST(LT_RELEASE)
> +AC_SUBST(LT_CURRENT)
> +AC_SUBST(LT_REVISION)
> +AC_SUBST(LT_AGE)
> +
> +PACKAGE=reiser4progs
> +VERSION=$LIBREISER4_VERSION
> +
> +AM_INIT_AUTOMAKE($PACKAGE, $VERSION)
> +AM_CONFIG_HEADER(config.h)
> +AM_MAINTAINER_MODE
> +
> +AC_DEFINE_UNQUOTED(LIBREISER4_MAX_INTERFACE_VERSION, $LIBREISER4_BINARY_AGE)
> +AC_DEFINE_UNQUOTED(LIBREISER4_MIN_INTERFACE_VERSION, $LIBREISER4_INTERFACE_AGE)
> +
> +# Macro for checking libaal
> +AC_DEFUN([AC_CHECK_LIBAAL],
> +[
> +
> +AC_CHECK_LIB($1, aal_device_open, ,
> +	[AC_MSG_ERROR([lib$1 not found; install libaal available at \
> +http://www.namesys.com/snapshots])]
> +$4)
> +
> +# Check for headers and library
> +AC_CHECK_HEADER(aal/libaal.h, ,
> +    	[AC_MSG_ERROR([<aal/libaal.h> not found])]
> +$4)
> +
> +AC_MSG_CHECKING(for lib$1 version = $2)
> +
> +AC_TRY_LINK_FUNC(libaal_version,,
> +    	AC_MSG_RESULT(failed)
> +    	AC_MSG_ERROR([lib$1 can't execute test]))
> +
> +# Get major, minor, and micro version from arg MINIMUM-VERSION
> +libaal_config_major_version=`echo $2 | \
> +    sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
> +libaal_config_minor_version=`echo $2 | \
> +    sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
> +libaal_config_micro_version=`echo $2 | \
> +    sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
> +
> +OLD_CFLAGS=$CFLAGS
> +CFLAGS="$CFLAGS -static"
> +
> +# Compare MINIMUM-VERSION with libaal version
> +AC_TRY_RUN([
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <aal/libaal.h>
> +
> +int main() {
> +    	const char *version;
> +    	int major, minor, micro;
> +	
> +    	if (!(version = libaal_version()))
> +		exit(1);
> +		
> +    	if (sscanf(version, "%d.%d.%d", &major, &minor, &micro) != 3) {
> +		printf("%s, bad version string\n", version);
> +		exit(1);
> +    	}
> +	
> +    	if ((major >= $libaal_config_major_version) &&
> +		((major == $libaal_config_major_version) &&
> +		(minor >= $libaal_config_minor_version)) &&
> +		((major == $libaal_config_major_version) &&
> +		(minor == $libaal_config_minor_version) &&
> +		(micro >= $libaal_config_micro_version)))
> +    	{
> +		return 0;
> +    	}
> +
> +    	printf("\nAn old version of libaal (%s) was found.\n",
> +		version);
> +
> +    	printf("You need a libaal of the version %d.%d.%d or newer.\n",
> +		$libaal_config_major_version, $libaal_config_minor_version,
> +		$libaal_config_micro_version);
> +
> +    	printf("You can get it at http://www.namesys.com/snapshots\n");
> +    	return 1;
> +}
> +],
> +    	AC_MSG_RESULT(yes),
> +    	AC_MSG_RESULT(no) ; $4,
> +    	[echo $ac_n "cross compiling; assumed OK... $ac_c"])
> +
> +CFLAGS=$OLD_CFLAGS
> +
> +# Execute ACTION-IF-FOUND
> +$3])
> +
> +AC_ARG_WITH(libaal,
> +	[  --with-libaal            prefix of where libaal was installed], ,
> +)
> +
> +LIBS=""
> +CFLAGS="$CFLAGS"
> +
> +if test x$with_libaal != x; then
> +    	LIBS="-L$with_libaal/lib"
> +	LDFLAGS="$LDFLAGS -L$with_libaal/lib"
> +    	CFLAGS="$CFLAGS -I$with_libaal/include"
> +    	CPPFLAGS="-I$with_libaal/include"
> +fi
> +
> +AC_ARG_WITH(uuid,
> +    	[  --with-uuid              support uuid generating and checking], ,
> +        	with_uuid=yes
> +)
> +
> +# Check for libuuid
> +if test "$with_uuid" = yes; then
> +    	OLD_LIBS="$LIBS"
> +    	LIBS=""
> +    	AC_CHECK_LIB(uuid, uuid_generate, ,
> +		AC_MSG_WARN(libuuid could not be found which is required \
> +for the --with-uuid
> +		)
> +		with_uuid=no
> +    	)
> +
> +    	UUID_LIBS="$LIBS"
> +    	LIBS="$OLD_LIBS"
> +fi
> +
> +AC_SUBST(UUID_LIBS)
> +
> +AC_ARG_WITH(readline,
> +    	[  --with-readline          support fancy command line editing], ,
> +        	with_readline=yes
> +)
> +
> +PROGS_LIBS=""
> +
> +# Check for readline
> +if test "x$with_readline" = xyes; then
> +    	OLD_LIBS="$LIBS"
> +    	LIBS=""
> +    	AC_CHECK_LIB(readline, readline, ,
> +	    	AC_MSG_WARN(GNU Readline could not be found which is required \
> +for the --with-readline
> +	    	)
> +	    	with_readline=no,
> +	    	-lncurses
> +    	)
> +    	PROGS_LIBS="$PROGS_LIBS $LIBS"
> +    	LIBS="$OLD_LIBS"
> +fi
> +
> +# Check for ncurses
> +if test "x$with_readline" = xyes; then
> +	OLD_LIBS="$LIBS"
> +	LIBS=""
> +	AC_SEARCH_LIBS(tgetent, ncurses,
> +		PROGS_LIBS="$PROGS_LIBS $LIBS",
> +		AC_MSG_WARN(ncurses could not be found which is required for the \
> +--with-readline option (which is enabled by default).
> +		)
> +		with_readline=no
> +	)
> +	LIBS="$OLD_LIBS"
> +fi
> +
> +AM_ENABLE_SHARED
> +
> +PROGS_LDFLAGS=""
> +
> +AC_ARG_ENABLE(full-static,
> +    	[  --enable-full-static     build all static], ,
> +		enable_full_static=no
> +)
> +if test x$enable_full_static = xyes; then
> +	PROGS_LDFLAGS=-all-static
> +fi
> +
> +AC_ARG_ENABLE(part-static,
> +    	[  --enable-part-static     build all static but libc ], ,
> +		enable_part_static=no
> +)
> +if test x$enable_part_static = xyes; then
> +	PROGS_LDFLAGS="-Wl,-lc,-static -static"
> +fi
> +
> +AC_ARG_ENABLE(Werror,
> +    	[  --enable-Werror          enable build with gcc -Werror ], ,
> +		enable_Werror=no
> +)
> +
> +AC_ARG_ENABLE(debug,
> +    	[  --enable-debug           enable asserts and debug information ], ,
> +		enable_debug=no
> +)
> +
> +AC_ARG_ENABLE(libminimal,
> +    	[  --disable-libminimal     disable minimal footprint library ], ,
> +        	enable_libminimal=yes
> +)
> +
> +AC_ARG_ENABLE(symlinks,
> +    	[  --disable-symlinks       disable symlinks support in minimal library ], ,
> +        	enable_symlinks=yes
> +)
> +
> +AC_ARG_ENABLE(special,
> +    	[  --disable-special        disable special files support in minimal library ], ,
> +        	enable_special=yes
> +)
> +
> +AC_ARG_ENABLE(r5_hash,
> +    	[  --disable-r5-hash        disable r5 hash plugin in minimal library ], ,
> +        	enable_r5_hash=yes
> +)
> +
> +AC_ARG_ENABLE(fnv1_hash,
> +    	[  --disable-fnv1-hash      disable fnv1 hash plugin in minimal library ], ,
> +        	enable_fnv1_hash=yes
> +)
> +
> +AC_ARG_ENABLE(rupasov_hash,
> +    	[  --disable-rupasov-hash   disable rupasov hash plugin in minimal library ], ,
> +        	enable_rupasov_hash=yes
> +)
> +
> +AC_ARG_ENABLE(tea_hash,
> +    	[  --disable-tea-hash       disable tea hash plugin in minimal library ], ,
> +        	enable_tea_hash=yes
> +)
> +
> +AC_ARG_ENABLE(deg_hash,
> +    	[  --enable-deg-hash        enable degenerate hash plugin in minimal library ], ,
> +        	enable_deg_hash=no
> +)
> +
> +AC_ARG_ENABLE(short_keys,
> +    	[  --disable-short-keys     disable short keys in minimal library ], ,
> +        	enable_short_keys=yes
> +)
> +
> +AC_ARG_ENABLE(large_keys,
> +    	[  --disable-large-keys     disable large keys in minimal library ], ,
> +        	enable_large_keys=yes
> +)
> +
> +AC_ARG_ENABLE(dot_o_fibre,
> +	      [  --disable-dot_o_fibre     disable dot_o_fibre plugin in minimal library ], ,
> +        	enable_dot_o_fibre=yes
> +)
> +
> +AC_ARG_ENABLE(ext_1_fibre,
> +	      [  --disable-ext_1_fibre     disable ext_1_fibre plugin in minimal library ], ,
> +        	enable_ext_1_fibre=yes
> +)
> +
> +AC_ARG_ENABLE(ext_3_fibre,
> +	      [  --disable-ext_3_fibre     disable ext_3_fibre plugin in minimal library ], ,
> +        	enable_ext_3_fibre=yes
> +)
> +
> +AC_ARG_ENABLE(lexic_fibre,
> +	      [  --disable-lexic_fibre     disable lexic_fibre plugin in minimal library ], ,
> +        	enable_lexic_fibre=yes
> +)
> +
> +
> +# Checks for programs.
> +AC_PROG_CC
> +AC_PROG_CPP
> +AC_PROG_INSTALL
> +AC_PROG_LN_S
> +AC_PROG_MAKE_SET
> +AC_PROG_RANLIB
> +AC_PROG_AWK
> +
> +MINIMAL_CFLAGS=""
> +GENERIC_CFLAGS=""
> +
> +# make libc threadsafe (not required for us for awhile, but useful other users of
> +# libreiser4)
> +GENERIC_CFLAGS="$GENERIC_CFLAGS -D_REENTRANT"
> +
> +AM_PROG_LIBTOOL
> +
> +if test "$with_uuid" = yes; then
> +    	AC_CHECK_HEADERS(uuid/uuid.h, ,
> +		AC_MSG_WARN(The headers for libuuid could not be found which \
> +are required for the --with-uuid option.
> +		)
> +    	)
> +fi
> +
> +if test "x$with_readline" = xyes; then
> +    	AC_CHECK_HEADERS(readline/readline.h readline/history.h, ,
> +		AC_MSG_WARN(The headers for GNU Readline could not be found which \
> +are required for the --with-readline option.
> +		)
> +    	)
> +fi
> +
> +# Checks for header files.
> +AC_HEADER_DIRENT
> +AC_HEADER_STDC
> +AC_CHECK_HEADERS([printf.h errno.h fcntl.h mntent.h stdint.h stdlib.h \
> +string.h sys/ioctl.h sys/mount.h sys/vfs.h unistd.h])
> +
> +# Checks for typedefs, structures and compiler characteristics.
> +AC_C_BIGENDIAN
> +
> +# Checks for library functions.
> +if test "x$with_readline" = xyes; then
> +    	OLD_LIBS="$LIBS"
> +    	LIBS="$LIBS $PROGS_LIBS"
> +    	AC_CHECK_FUNCS(rl_completion_matches)
> +    	LIBS="$OLD_LIBS"
> +fi
> +
> +# Checks for typedefs, structures, and compiler characteristics.
> +AC_C_CONST
> +AC_C_INLINE
> +AC_TYPE_SIZE_T
> +AC_CHECK_MEMBERS([struct stat.st_rdev])
> +
> +# Checks for library functions.
> +AC_PROG_GCC_TRADITIONAL
> +AC_FUNC_STAT
> +AC_CHECK_FUNCS([register_printf_function statfs getmntent hasmntopt memset strerror \
> +strtol time uname sysconf])
> +
> +# The options -falign-* are supported by gcc 3.0 or later.
> +# Probably it is sufficient to only check for -falign-loops.
> +AC_CACHE_CHECK([whether -falign-loops works], [falign_loop_flag_cv_], [
> +  	saved_CPPFLAGS="$CPPFLAGS"
> +  	CPPFLAGS="-falign-loops=1"
> +  	AC_TRY_COMPILE(, , [falign_loop_flag_cv_=yes], [falign_loop_flag_cv_=no])
> +  	CPPFLAGS="$saved_CPPFLAGS"
> +])
> +
> +# Checking for compiler warning options
> +AC_CACHE_CHECK([whether -Wuninitialized works], [uninitialized_cv_], [
> +  	saved_CPPFLAGS="$CPPFLAGS"
> +  	CPPFLAGS="-O1 -Wuninitialized"
> +  	AC_TRY_COMPILE(, , [uninitialized_cv_=yes], [uninitialized_cv_=no])
> +  	CPPFLAGS="$saved_CPPFLAGS"
> +])
> +
> +AC_CACHE_CHECK([whether -Wno-unused-parameter works], [no_unused_parameter_cv_], [
> +  	saved_CPPFLAGS="$CPPFLAGS"
> +  	CPPFLAGS="-Wno-unused-parameter"
> +  	AC_TRY_COMPILE(, , [no_unused_parameter_cv_=yes], [no_unused_parameter_cv_=no])
> +  	CPPFLAGS="$saved_CPPFLAGS"
> +])
> +
> +AC_CACHE_CHECK([whether -Wredundant-decls works], [redundant_decls_cv_], [
> +  	saved_CPPFLAGS="$CPPFLAGS"
> +  	CPPFLAGS="-Wredundant-decls"
> +  	AC_TRY_COMPILE(, , [redundant_decls_cv_=yes], [redundant_decls_cv_=no])
> +  	CPPFLAGS="$saved_CPPFLAGS"
> +])
> +
> +if test "x$with_readline" = xyes && test "x$redundant_decls" == xyes; then
> +  	saved_CPPFLAGS="$CPPFLAGS"
> +  	CPPFLAGS="-Werror -Wredundant-decls"
> +
> + 	AC_MSG_CHECKING(whether -Wredundant-decls works with readline.h)
> +
> +  	AC_TRY_COMPILE([
> +#include <stdio.h>
> +#include <readline/readline.h>
> +	], ,[
> +		redundant_decls=yes;
> +		AC_MSG_RESULT(yes)
> +	], [
> +		redundant_decls=no;
> +		AC_MSG_RESULT(no)
> +	])
> +  	CPPFLAGS="$saved_CPPFLAGS"
> +fi
> +
> +# Force no alignment to save space.
> +if test "x$falign_loop_flag" = xyes; then
> +  	ALIGN_FLAGS="-falign-jumps=1 -falign-loops=1 -falign-functions=1 \
> +-falign-labels=1 -fno-inline -fstrength-reduce"
> +else
> +  	ALIGN_FLAGS="-malign-jumps=1 -malign-loops=1 -malign-functions=1"
> +fi
> +
> +# Check for large file
> +AC_SYS_LARGEFILE
> +
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
> +OLD_LIBS="$LIBS"
> +AC_CHECK_LIBAAL(aal, 1.0.6, ,exit)
> +AAL_LIBS="$LIBS"
> +LIBS="$OLD_LIBS"
> +
> +AC_SUBST(AAL_LIBS)
> +
> +if test x$enable_libminimal = xyes; then
> +    	OLD_LIBS="$LIBS"
> +    	AC_CHECK_LIBAAL(aal-minimal, 1.0.6, ,exit)
> +    	AAL_MINIMAL_LIBS="$LIBS"
> +    	LIBS="$OLD_LIBS"
> +
> +    	AC_SUBST(AAL_MINIMAL_LIBS)
> +
> +    	if test x$enable_symlinks = xyes; then
> +		SYMLINKS_CFLAGS="-DENABLE_SYMLINKS"
> +    	fi
> +
> +    	if test x$enable_special = xyes; then
> +		SPECIAL_CFLAGS="-DENABLE_SPECIAL"
> +    	fi
> +
> +    	if test x$enable_r5_hash = xyes; then
> +		R5_HASH_CFLAGS="-DENABLE_R5_HASH"
> +    	fi
> +
> +    	if test x$enable_fnv1_hash = xyes; then
> +		FNV1_HASH_CFLAGS="-DENABLE_FNV1_HASH"
> +    	fi
> +
> +    	if test x$enable_rupasov_hash = xyes; then
> +		RUPASOV_HASH_CFLAGS="-DENABLE_RUPASOV_HASH"
> +    	fi
> +
> +    	if test x$enable_tea_hash = xyes; then
> +		TEA_HASH_CFLAGS="-DENABLE_TEA_HASH"
> +    	fi
> +
> +    	if test x$enable_deg_hash = xyes; then
> +		DEG_HASH_CFLAGS="-DENABLE_DEG_HASH"
> +    	fi
> +
> +    	if test x$enable_short_keys = xyes; then
> +		SHORT_KEYS_CFLAGS="-DENABLE_SHORT_KEYS"
> +    	fi
> +
> +    	if test x$enable_large_keys = xyes; then
> +		LARGE_KEYS_CFLAGS="-DENABLE_LARGE_KEYS"
> +   	fi
> +
> +	if test x$enable_large_keys != xyes -a x$enable_short_keys != xyes; then
> +		echo
> +		echo Both LARGE and SHORT keys cannot be disabled at the same time.
> +		exit 1;
> +	fi
> +	
> +	if test x$enable_dot_o_fibre = xyes; then
> +		FIBRE_FLAGS="$FIBRE_FLAGS -DENABLE_DOT_O_FIBRE"
> +   	fi
> +	
> +	if test x$enable_ext_1_fibre = xyes; then
> +		FIBRE_FLAGS="$FIBRE_FLAGS -DENABLE_EXT_1_FIBRE"
> +   	fi
> +	
> +	if test x$enable_ext_3_fibre = xyes; then
> +		FIBRE_FLAGS="$FIBRE_FLAGS -DENABLE_EXT_3_FIBRE"
> +   	fi
> +	
> +	if test x$enable_lexic_fibre = xyes; then
> +		FIBRE_FLAGS="$FIBRE_FLAGS -DENABLE_LEXIC_FIBRE"
> +   	fi
> +
> +#	if test x$enable_dot_o_fibre != xyes -a x$enable_ext_1_fibre != xyes -a \
> +#		x$enable_ext_3_fibre != xyes -a x$enable_lexic_fibre; then
> +#		echo
> +#		echo All fibre plugins cannot be disabled at the same time.
> +#		exit 1;
> +#	fi
> +
> +    	MINIMAL_CFLAGS="$MINIMAL_CFLAGS -DENABLE_MINIMAL $SYMLINKS_CFLAGS $SPECIAL_CFLAGS \
> +$R5_HASH_CFLAGS $FNV1_HASH_CFLAGS $RUPASOV_HASH_CFLAGS $TEA_HASH_CFLAGS $DEG_HASH_CFLAGS \
> +$ALIGN_FLAGS $LARGE_KEYS_CFLAGS $SHORT_KEYS_CFLAGS $FIBRE_FLAGS"
> +fi
> +
> +GENERIC_CFLAGS="$GENERIC_CFLAGS -DENABLE_SYMLINKS -DENABLE_SPECIAL -DENABLE_R5_HASH \
> +-DENABLE_FNV1_HASH -DENABLE_RUPASOV_HASH -DENABLE_TEA_HASH -DENABLE_DEG_HASH \
> +-DENABLE_LARGE_KEYS -DENABLE_SHORT_KEYS -DENABLE_DOT_O_FIBRE -DENABLE_EXT_1_FIBRE \
> +-DENABLE_EXT_3_FIBRE -DENABLE_LEXIC_FIBRE"
> +
> +CFLAGS="$CFLAGS -W -Wall"
> +
> +if test x$enable_debug = xyes; then
> +    	GENERIC_CFLAGS="$GENERIC_CFLAGS -O1 -g"
> +    	MINIMAL_CFLAGS="$MINIMAL_CFLAGS -O1 -g"
> +else
> +    	GENERIC_CFLAGS="$GENERIC_CFLAGS -O3"
> +    	MINIMAL_CFLAGS="$MINIMAL_CFLAGS -Os"
> +
> +    	if test x$uninitialized = xyes; then
> +       		CFLAGS="$CFLAGS -Wuninitialized"
> +    	fi
> +fi
> +
> +if test x$no_unused_parameter = xyes; then
> +    	CFLAGS="$CFLAGS -Wno-unused-parameter"
> +else
> +    	CFLAGS="$CFLAGS -Wno-unused"
> +fi
> +
> +if test x$redundant_decls = xyes; then
> +    	CFLAGS="$CFLAGS -Wredundant-decls"
> +fi
> +
> +if test x$enable_Werror = xyes; then
> +    	CFLAGS="$CFLAGS -Werror"
> +fi
> +
> +AM_CONDITIONAL(ENABLE_MINIMAL, test x$enable_libminimal = xyes)
> +
> +if test x$enable_debug = xyes; then
> +    	AC_DEFINE(ENABLE_DEBUG)
> +fi
> +
> +AC_SUBST(PROGS_LIBS)
> +AC_SUBST(MINIMAL_CFLAGS)
> +AC_SUBST(GENERIC_CFLAGS)
> +AC_SUBST(PROGS_LDFLAGS)
> +
> +AC_OUTPUT([
> +    	Makefile
> +    	include/Makefile
> +    	include/aux/Makefile
> +    	include/misc/Makefile
> +    	include/reiser4/Makefile
> +    	include/repair/Makefile
> +    	libmisc/Makefile
> +    	libaux/Makefile
> +    	libreiser4/Makefile
> +    	librepair/Makefile
> +    	plugin/Makefile
> +    	plugin/format/Makefile
> +    	plugin/format/format40/Makefile
> +    	plugin/alloc/Makefile
> +    	plugin/alloc/alloc40/Makefile
> +    	plugin/journal/Makefile
> +    	plugin/journal/journal40/Makefile
> +    	plugin/oid/Makefile
> +    	plugin/oid/oid40/Makefile
> +    	plugin/node/Makefile
> +    	plugin/node/node40/Makefile
> +	plugin/node/node41/Makefile
> +   	plugin/key/Makefile
> +    	plugin/key/key_common/Makefile
> +    	plugin/key/key_short/Makefile
> +    	plugin/key/key_large/Makefile
> +    	plugin/item/Makefile
> +    	plugin/item/body40/Makefile
> +    	plugin/item/nodeptr40/Makefile
> +    	plugin/item/stat40/Makefile
> +    	plugin/item/cde40/Makefile
> +    	plugin/item/tail40/Makefile
> +    	plugin/item/plain40/Makefile
> +    	plugin/item/ctail40/Makefile
> +    	plugin/item/extent40/Makefile
> +    	plugin/item/bbox40/Makefile
> +    	plugin/object/Makefile
> +    	plugin/object/obj40/Makefile
> +    	plugin/object/dir40/Makefile
> +    	plugin/object/reg40/Makefile
> +    	plugin/object/sym40/Makefile
> +    	plugin/object/spl40/Makefile
> +    	plugin/object/ccreg40/Makefile
> +    	plugin/policy/Makefile
> +    	plugin/policy/tails/Makefile
> +    	plugin/policy/extents/Makefile
> +    	plugin/policy/smart/Makefile
> +    	plugin/hash/Makefile
> +    	plugin/hash/r5_hash/Makefile
> +    	plugin/hash/tea_hash/Makefile
> +    	plugin/hash/deg_hash/Makefile
> +    	plugin/hash/rupasov_hash/Makefile
> +    	plugin/hash/fnv1_hash/Makefile
> +	plugin/fibre/Makefile
> +	plugin/fibre/lexic_fibre/Makefile
> +	plugin/fibre/dot_o_fibre/Makefile
> +	plugin/fibre/ext_1_fibre/Makefile
> +	plugin/fibre/ext_3_fibre/Makefile
> +    	plugin/sdext/Makefile
> +    	plugin/sdext/sdext_unix/Makefile
> +    	plugin/sdext/sdext_lw/Makefile
> +    	plugin/sdext/sdext_lt/Makefile
> +    	plugin/sdext/sdext_symlink/Makefile
> +    	plugin/sdext/sdext_flags/Makefile
> +	plugin/sdext/sdext_plug/Makefile
> +	plugin/sdext/sdext_crypto/Makefile
> +	plugin/compress/Makefile
> +    	progs/Makefile
> +    	progs/mkfs/Makefile
> +    	progs/fsck/Makefile
> +    	progs/debugfs/Makefile
> +    	progs/measurefs/Makefile
> +    	demos/Makefile
> +    	doc/Makefile
> +    	reiser4progs.spec
> +])
> +
> +echo
> +echo Type \'make\' to compile reiser4progs and \'make install\' to install it.
> diff --git a/configure.in b/configure.in
> deleted file mode 100644
> index de39004..0000000
> --- a/configure.in
> +++ /dev/null
> @@ -1,642 +0,0 @@
> -# Process this file with autoconf to produce a configure script.
> -AC_INIT(libreiser4/libreiser4.c)
> -AC_CANONICAL_HOST
> -AC_PREREQ(2.50)
> -
> -AH_TEMPLATE([PACKAGE], [Define this to be the name of the package.])
> -AH_TEMPLATE([VERSION], [Define to the version of the package.])
> -
> -AH_TEMPLATE([ENABLE_DEBUG], [Define for enable debug info.])
> -AH_TEMPLATE([HAVE_LIBUUID], [Define for enable libuuid using.])
> -AH_TEMPLATE([HAVE_LIBREADLINE], [Define for enable libreadline using.])
> -
> -AH_TEMPLATE([LIBREISER4_MAX_INTERFACE_VERSION], [Define to the max interface version.])
> -AH_TEMPLATE([LIBREISER4_MIN_INTERFACE_VERSION], [Define to the min interface version.])
> -
> -LIBREISER4_MAJOR_VERSION=1
> -LIBREISER4_MINOR_VERSION=1
> -LIBREISER4_MICRO_VERSION=0
> -
> -LIBREISER4_INTERFACE_AGE=0
> -LIBREISER4_BINARY_AGE=0
> -LIBREISER4_VERSION=$LIBREISER4_MAJOR_VERSION.$LIBREISER4_MINOR_VERSION.$LIBREISER4_MICRO_VERSION
> -
> -LT_RELEASE=$LIBREISER4_MAJOR_VERSION.$LIBREISER4_MINOR_VERSION
> -
> -LT_CURRENT=`expr $LIBREISER4_MICRO_VERSION - $LIBREISER4_INTERFACE_AGE`
> -LT_REVISION=$LIBREISER4_INTERFACE_AGE
> -LT_AGE=`expr $LIBREISER4_BINARY_AGE - $LIBREISER4_INTERFACE_AGE`
> -
> -AC_SUBST(LT_RELEASE)
> -AC_SUBST(LT_CURRENT)
> -AC_SUBST(LT_REVISION)
> -AC_SUBST(LT_AGE)
> -
> -PACKAGE=reiser4progs
> -VERSION=$LIBREISER4_VERSION
> -
> -AM_INIT_AUTOMAKE($PACKAGE, $VERSION)
> -AM_CONFIG_HEADER(config.h)
> -AM_MAINTAINER_MODE
> -
> -AC_DEFINE_UNQUOTED(LIBREISER4_MAX_INTERFACE_VERSION, $LIBREISER4_BINARY_AGE)
> -AC_DEFINE_UNQUOTED(LIBREISER4_MIN_INTERFACE_VERSION, $LIBREISER4_INTERFACE_AGE)
> -
> -# Macro for checking libaal
> -AC_DEFUN([AC_CHECK_LIBAAL],
> -[
> -
> -AC_CHECK_LIB($1, aal_device_open, ,
> -	[AC_MSG_ERROR([lib$1 not found; install libaal available at \
> -http://www.namesys.com/snapshots])]
> -$4)
> -
> -# Check for headers and library
> -AC_CHECK_HEADER(aal/libaal.h, ,
> -    	[AC_MSG_ERROR([<aal/libaal.h> not found])]
> -$4)
> -
> -AC_MSG_CHECKING(for lib$1 version = $2)
> -
> -AC_TRY_LINK_FUNC(libaal_version,,
> -    	AC_MSG_RESULT(failed)
> -    	AC_MSG_ERROR([lib$1 can't execute test]))
> -
> -# Get major, minor, and micro version from arg MINIMUM-VERSION
> -libaal_config_major_version=`echo $2 | \
> -    sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
> -libaal_config_minor_version=`echo $2 | \
> -    sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
> -libaal_config_micro_version=`echo $2 | \
> -    sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
> -
> -OLD_CFLAGS=$CFLAGS
> -CFLAGS="$CFLAGS -static"
> -
> -# Compare MINIMUM-VERSION with libaal version
> -AC_TRY_RUN([
> -#include <stdio.h>
> -#include <stdlib.h>
> -#include <aal/libaal.h>
> -
> -int main() {
> -    	const char *version;
> -    	int major, minor, micro;
> -	
> -    	if (!(version = libaal_version()))
> -		exit(1);
> -		
> -    	if (sscanf(version, "%d.%d.%d", &major, &minor, &micro) != 3) {
> -		printf("%s, bad version string\n", version);
> -		exit(1);
> -    	}
> -	
> -    	if ((major >= $libaal_config_major_version) &&
> -		((major == $libaal_config_major_version) &&
> -		(minor >= $libaal_config_minor_version)) &&
> -		((major == $libaal_config_major_version) &&
> -		(minor == $libaal_config_minor_version) &&
> -		(micro >= $libaal_config_micro_version)))
> -    	{
> -		return 0;
> -    	}
> -
> -    	printf("\nAn old version of libaal (%s) was found.\n",
> -		version);
> -
> -    	printf("You need a libaal of the version %d.%d.%d or newer.\n",
> -		$libaal_config_major_version, $libaal_config_minor_version,
> -		$libaal_config_micro_version);
> -
> -    	printf("You can get it at http://www.namesys.com/snapshots\n");
> -    	return 1;
> -}
> -],
> -    	AC_MSG_RESULT(yes),
> -    	AC_MSG_RESULT(no) ; $4,
> -    	[echo $ac_n "cross compiling; assumed OK... $ac_c"])
> -
> -CFLAGS=$OLD_CFLAGS
> -
> -# Execute ACTION-IF-FOUND
> -$3])
> -
> -AC_ARG_WITH(libaal,
> -	[  --with-libaal            prefix of where libaal was installed], ,
> -)
> -
> -LIBS=""
> -CFLAGS="$CFLAGS"
> -
> -if test x$with_libaal != x; then
> -    	LIBS="-L$with_libaal/lib"
> -	LDFLAGS="$LDFLAGS -L$with_libaal/lib"
> -    	CFLAGS="$CFLAGS -I$with_libaal/include"
> -    	CPPFLAGS="-I$with_libaal/include"
> -fi
> -
> -AC_ARG_WITH(uuid,
> -    	[  --with-uuid              support uuid generating and checking], ,
> -        	with_uuid=yes
> -)
> -
> -# Check for libuuid
> -if test "$with_uuid" = yes; then
> -    	OLD_LIBS="$LIBS"
> -    	LIBS=""
> -    	AC_CHECK_LIB(uuid, uuid_generate, ,
> -		AC_MSG_WARN(libuuid could not be found which is required \
> -for the --with-uuid
> -		)
> -		with_uuid=no
> -    	)
> -
> -    	UUID_LIBS="$LIBS"
> -    	LIBS="$OLD_LIBS"
> -fi
> -
> -AC_SUBST(UUID_LIBS)
> -
> -AC_ARG_WITH(readline,
> -    	[  --with-readline          support fancy command line editing], ,
> -        	with_readline=yes
> -)
> -
> -PROGS_LIBS=""
> -
> -# Check for readline
> -if test "x$with_readline" = xyes; then
> -    	OLD_LIBS="$LIBS"
> -    	LIBS=""
> -    	AC_CHECK_LIB(readline, readline, ,
> -	    	AC_MSG_WARN(GNU Readline could not be found which is required \
> -for the --with-readline
> -	    	)
> -	    	with_readline=no,
> -	    	-lncurses
> -    	)
> -    	PROGS_LIBS="$PROGS_LIBS $LIBS"
> -    	LIBS="$OLD_LIBS"
> -fi
> -
> -# Check for ncurses
> -if test "x$with_readline" = xyes; then
> -	OLD_LIBS="$LIBS"
> -	LIBS=""
> -	AC_SEARCH_LIBS(tgetent, ncurses,
> -		PROGS_LIBS="$PROGS_LIBS $LIBS",
> -		AC_MSG_WARN(ncurses could not be found which is required for the \
> ---with-readline option (which is enabled by default).
> -		)
> -		with_readline=no
> -	)
> -	LIBS="$OLD_LIBS"
> -fi
> -
> -AM_ENABLE_SHARED
> -
> -PROGS_LDFLAGS=""
> -
> -AC_ARG_ENABLE(full-static,
> -    	[  --enable-full-static     build all static], ,
> -		enable_full_static=no
> -)
> -if test x$enable_full_static = xyes; then
> -	PROGS_LDFLAGS=-all-static
> -fi
> -
> -AC_ARG_ENABLE(part-static,
> -    	[  --enable-part-static     build all static but libc ], ,
> -		enable_part_static=no
> -)
> -if test x$enable_part_static = xyes; then
> -	PROGS_LDFLAGS="-Wl,-lc,-static -static"
> -fi
> -
> -AC_ARG_ENABLE(Werror,
> -    	[  --enable-Werror          enable build with gcc -Werror ], ,
> -		enable_Werror=no
> -)
> -
> -AC_ARG_ENABLE(debug,
> -    	[  --enable-debug           enable asserts and debug information ], ,
> -		enable_debug=no
> -)
> -
> -AC_ARG_ENABLE(libminimal,
> -    	[  --disable-libminimal     disable minimal footprint library ], ,
> -        	enable_libminimal=yes
> -)
> -
> -AC_ARG_ENABLE(symlinks,
> -    	[  --disable-symlinks       disable symlinks support in minimal library ], ,
> -        	enable_symlinks=yes
> -)
> -
> -AC_ARG_ENABLE(special,
> -    	[  --disable-special        disable special files support in minimal library ], ,
> -        	enable_special=yes
> -)
> -
> -AC_ARG_ENABLE(r5_hash,
> -    	[  --disable-r5-hash        disable r5 hash plugin in minimal library ], ,
> -        	enable_r5_hash=yes
> -)
> -
> -AC_ARG_ENABLE(fnv1_hash,
> -    	[  --disable-fnv1-hash      disable fnv1 hash plugin in minimal library ], ,
> -        	enable_fnv1_hash=yes
> -)
> -
> -AC_ARG_ENABLE(rupasov_hash,
> -    	[  --disable-rupasov-hash   disable rupasov hash plugin in minimal library ], ,
> -        	enable_rupasov_hash=yes
> -)
> -
> -AC_ARG_ENABLE(tea_hash,
> -    	[  --disable-tea-hash       disable tea hash plugin in minimal library ], ,
> -        	enable_tea_hash=yes
> -)
> -
> -AC_ARG_ENABLE(deg_hash,
> -    	[  --enable-deg-hash        enable degenerate hash plugin in minimal library ], ,
> -        	enable_deg_hash=no
> -)
> -
> -AC_ARG_ENABLE(short_keys,
> -    	[  --disable-short-keys     disable short keys in minimal library ], ,
> -        	enable_short_keys=yes
> -)
> -
> -AC_ARG_ENABLE(large_keys,
> -    	[  --disable-large-keys     disable large keys in minimal library ], ,
> -        	enable_large_keys=yes
> -)
> -
> -AC_ARG_ENABLE(dot_o_fibre,
> -	      [  --disable-dot_o_fibre     disable dot_o_fibre plugin in minimal library ], ,
> -        	enable_dot_o_fibre=yes
> -)
> -
> -AC_ARG_ENABLE(ext_1_fibre,
> -	      [  --disable-ext_1_fibre     disable ext_1_fibre plugin in minimal library ], ,
> -        	enable_ext_1_fibre=yes
> -)
> -
> -AC_ARG_ENABLE(ext_3_fibre,
> -	      [  --disable-ext_3_fibre     disable ext_3_fibre plugin in minimal library ], ,
> -        	enable_ext_3_fibre=yes
> -)
> -
> -AC_ARG_ENABLE(lexic_fibre,
> -	      [  --disable-lexic_fibre     disable lexic_fibre plugin in minimal library ], ,
> -        	enable_lexic_fibre=yes
> -)
> -
> -
> -# Checks for programs.
> -AC_PROG_CC
> -AC_PROG_CPP
> -AC_PROG_INSTALL
> -AC_PROG_LN_S
> -AC_PROG_MAKE_SET
> -AC_PROG_RANLIB
> -AC_PROG_AWK
> -
> -MINIMAL_CFLAGS=""
> -GENERIC_CFLAGS=""
> -
> -# make libc threadsafe (not required for us for awhile, but useful other users of
> -# libreiser4)
> -GENERIC_CFLAGS="$GENERIC_CFLAGS -D_REENTRANT"
> -
> -AM_PROG_LIBTOOL
> -
> -if test "$with_uuid" = yes; then
> -    	AC_CHECK_HEADERS(uuid/uuid.h, ,
> -		AC_MSG_WARN(The headers for libuuid could not be found which \
> -are required for the --with-uuid option.
> -		)
> -    	)
> -fi
> -
> -if test "x$with_readline" = xyes; then
> -    	AC_CHECK_HEADERS(readline/readline.h readline/history.h, ,
> -		AC_MSG_WARN(The headers for GNU Readline could not be found which \
> -are required for the --with-readline option.
> -		)
> -    	)
> -fi
> -
> -# Checks for header files.
> -AC_HEADER_DIRENT
> -AC_HEADER_STDC
> -AC_CHECK_HEADERS([printf.h errno.h fcntl.h mntent.h stdint.h stdlib.h \
> -string.h sys/ioctl.h sys/mount.h sys/vfs.h unistd.h])
> -
> -# Checks for typedefs, structures and compiler characteristics.
> -AC_C_BIGENDIAN
> -
> -# Checks for library functions.
> -if test "x$with_readline" = xyes; then
> -    	OLD_LIBS="$LIBS"
> -    	LIBS="$LIBS $PROGS_LIBS"
> -    	AC_CHECK_FUNCS(rl_completion_matches)
> -    	LIBS="$OLD_LIBS"
> -fi
> -
> -# Checks for typedefs, structures, and compiler characteristics.
> -AC_C_CONST
> -AC_C_INLINE
> -AC_TYPE_SIZE_T
> -AC_CHECK_MEMBERS([struct stat.st_rdev])
> -
> -# Checks for library functions.
> -AC_PROG_GCC_TRADITIONAL
> -AC_FUNC_STAT
> -AC_CHECK_FUNCS([register_printf_function statfs getmntent hasmntopt memset strerror \
> -strtol time uname sysconf])
> -
> -# The options -falign-* are supported by gcc 3.0 or later.
> -# Probably it is sufficient to only check for -falign-loops.
> -AC_CACHE_CHECK([whether -falign-loops works], [falign_loop_flag], [
> -  	saved_CPPFLAGS="$CPPFLAGS"
> -  	CPPFLAGS="-falign-loops=1"
> -  	AC_TRY_COMPILE(, , [falign_loop_flag=yes], [falign_loop_flag=no])
> -  	CPPFLAGS="$saved_CPPFLAGS"
> -])
> -
> -# Checking for compiler warning options
> -AC_CACHE_CHECK([whether -Wuninitialized works], [uninitialized], [
> -  	saved_CPPFLAGS="$CPPFLAGS"
> -  	CPPFLAGS="-O1 -Wuninitialized"
> -  	AC_TRY_COMPILE(, , [uninitialized=yes], [uninitialized=no])
> -  	CPPFLAGS="$saved_CPPFLAGS"
> -])
> -
> -AC_CACHE_CHECK([whether -Wno-unused-parameter works], [no_unused_parameter], [
> -  	saved_CPPFLAGS="$CPPFLAGS"
> -  	CPPFLAGS="-Wno-unused-parameter"
> -  	AC_TRY_COMPILE(, , [no_unused_parameter=yes], [no_unused_parameter=no])
> -  	CPPFLAGS="$saved_CPPFLAGS"
> -])
> -
> -AC_CACHE_CHECK([whether -Wredundant-decls works], [redundant_decls], [
> -  	saved_CPPFLAGS="$CPPFLAGS"
> -  	CPPFLAGS="-Wredundant-decls"
> -  	AC_TRY_COMPILE(, , [redundant_decls=yes], [redundant_decls=no])
> -  	CPPFLAGS="$saved_CPPFLAGS"
> -])
> -
> -if test "x$with_readline" = xyes && test "x$redundant_decls" == xyes; then
> -  	saved_CPPFLAGS="$CPPFLAGS"
> -  	CPPFLAGS="-Werror -Wredundant-decls"
> -
> - 	AC_MSG_CHECKING(whether -Wredundant-decls works with readline.h)
> -
> -  	AC_TRY_COMPILE([
> -#include <stdio.h>
> -#include <readline/readline.h>
> -	], ,[
> -		redundant_decls=yes;
> -		AC_MSG_RESULT(yes)
> -	], [
> -		redundant_decls=no;
> -		AC_MSG_RESULT(no)
> -	])
> -  	CPPFLAGS="$saved_CPPFLAGS"
> -fi
> -
> -# Force no alignment to save space.
> -if test "x$falign_loop_flag" = xyes; then
> -  	ALIGN_FLAGS="-falign-jumps=1 -falign-loops=1 -falign-functions=1 \
> --falign-labels=1 -fno-inline -fstrength-reduce"
> -else
> -  	ALIGN_FLAGS="-malign-jumps=1 -malign-loops=1 -malign-functions=1"
> -fi
> -
> -# Check for large file
> -AC_SYS_LARGEFILE
> -
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
> -OLD_LIBS="$LIBS"
> -AC_CHECK_LIBAAL(aal, 1.0.6, ,exit)
> -AAL_LIBS="$LIBS"
> -LIBS="$OLD_LIBS"
> -
> -AC_SUBST(AAL_LIBS)
> -
> -if test x$enable_libminimal = xyes; then
> -    	OLD_LIBS="$LIBS"
> -    	AC_CHECK_LIBAAL(aal-minimal, 1.0.6, ,exit)
> -    	AAL_MINIMAL_LIBS="$LIBS"
> -    	LIBS="$OLD_LIBS"
> -
> -    	AC_SUBST(AAL_MINIMAL_LIBS)
> -
> -    	if test x$enable_symlinks = xyes; then
> -		SYMLINKS_CFLAGS="-DENABLE_SYMLINKS"
> -    	fi
> -
> -    	if test x$enable_special = xyes; then
> -		SPECIAL_CFLAGS="-DENABLE_SPECIAL"
> -    	fi
> -
> -    	if test x$enable_r5_hash = xyes; then
> -		R5_HASH_CFLAGS="-DENABLE_R5_HASH"
> -    	fi
> -
> -    	if test x$enable_fnv1_hash = xyes; then
> -		FNV1_HASH_CFLAGS="-DENABLE_FNV1_HASH"
> -    	fi
> -
> -    	if test x$enable_rupasov_hash = xyes; then
> -		RUPASOV_HASH_CFLAGS="-DENABLE_RUPASOV_HASH"
> -    	fi
> -
> -    	if test x$enable_tea_hash = xyes; then
> -		TEA_HASH_CFLAGS="-DENABLE_TEA_HASH"
> -    	fi
> -
> -    	if test x$enable_deg_hash = xyes; then
> -		DEG_HASH_CFLAGS="-DENABLE_DEG_HASH"
> -    	fi
> -
> -    	if test x$enable_short_keys = xyes; then
> -		SHORT_KEYS_CFLAGS="-DENABLE_SHORT_KEYS"
> -    	fi
> -
> -    	if test x$enable_large_keys = xyes; then
> -		LARGE_KEYS_CFLAGS="-DENABLE_LARGE_KEYS"
> -   	fi
> -
> -	if test x$enable_large_keys != xyes -a x$enable_short_keys != xyes; then
> -		echo
> -		echo Both LARGE and SHORT keys cannot be disabled at the same time.
> -		exit 1;
> -	fi
> -	
> -	if test x$enable_dot_o_fibre = xyes; then
> -		FIBRE_FLAGS="$FIBRE_FLAGS -DENABLE_DOT_O_FIBRE"
> -   	fi
> -	
> -	if test x$enable_ext_1_fibre = xyes; then
> -		FIBRE_FLAGS="$FIBRE_FLAGS -DENABLE_EXT_1_FIBRE"
> -   	fi
> -	
> -	if test x$enable_ext_3_fibre = xyes; then
> -		FIBRE_FLAGS="$FIBRE_FLAGS -DENABLE_EXT_3_FIBRE"
> -   	fi
> -	
> -	if test x$enable_lexic_fibre = xyes; then
> -		FIBRE_FLAGS="$FIBRE_FLAGS -DENABLE_LEXIC_FIBRE"
> -   	fi
> -
> -#	if test x$enable_dot_o_fibre != xyes -a x$enable_ext_1_fibre != xyes -a \
> -#		x$enable_ext_3_fibre != xyes -a x$enable_lexic_fibre; then
> -#		echo
> -#		echo All fibre plugins cannot be disabled at the same time.
> -#		exit 1;
> -#	fi
> -
> -    	MINIMAL_CFLAGS="$MINIMAL_CFLAGS -DENABLE_MINIMAL $SYMLINKS_CFLAGS $SPECIAL_CFLAGS \
> -$R5_HASH_CFLAGS $FNV1_HASH_CFLAGS $RUPASOV_HASH_CFLAGS $TEA_HASH_CFLAGS $DEG_HASH_CFLAGS \
> -$ALIGN_FLAGS $LARGE_KEYS_CFLAGS $SHORT_KEYS_CFLAGS $FIBRE_FLAGS"
> -fi
> -
> -GENERIC_CFLAGS="$GENERIC_CFLAGS -DENABLE_SYMLINKS -DENABLE_SPECIAL -DENABLE_R5_HASH \
> --DENABLE_FNV1_HASH -DENABLE_RUPASOV_HASH -DENABLE_TEA_HASH -DENABLE_DEG_HASH \
> --DENABLE_LARGE_KEYS -DENABLE_SHORT_KEYS -DENABLE_DOT_O_FIBRE -DENABLE_EXT_1_FIBRE \
> --DENABLE_EXT_3_FIBRE -DENABLE_LEXIC_FIBRE"
> -
> -CFLAGS="$CFLAGS -W -Wall"
> -
> -if test x$enable_debug = xyes; then
> -    	GENERIC_CFLAGS="$GENERIC_CFLAGS -O1 -g"
> -    	MINIMAL_CFLAGS="$MINIMAL_CFLAGS -O1 -g"
> -else
> -    	GENERIC_CFLAGS="$GENERIC_CFLAGS -O3"
> -    	MINIMAL_CFLAGS="$MINIMAL_CFLAGS -Os"
> -
> -    	if test x$uninitialized = xyes; then
> -       		CFLAGS="$CFLAGS -Wuninitialized"
> -    	fi
> -fi
> -
> -if test x$no_unused_parameter = xyes; then
> -    	CFLAGS="$CFLAGS -Wno-unused-parameter"
> -else
> -    	CFLAGS="$CFLAGS -Wno-unused"
> -fi
> -
> -if test x$redundant_decls = xyes; then
> -    	CFLAGS="$CFLAGS -Wredundant-decls"
> -fi
> -
> -if test x$enable_Werror = xyes; then
> -    	CFLAGS="$CFLAGS -Werror"
> -fi
> -
> -AM_CONDITIONAL(ENABLE_MINIMAL, test x$enable_libminimal = xyes)
> -
> -if test x$enable_debug = xyes; then
> -    	AC_DEFINE(ENABLE_DEBUG)
> -fi
> -
> -AC_SUBST(PROGS_LIBS)
> -AC_SUBST(MINIMAL_CFLAGS)
> -AC_SUBST(GENERIC_CFLAGS)
> -AC_SUBST(PROGS_LDFLAGS)
> -
> -AC_OUTPUT([
> -    	Makefile
> -    	include/Makefile
> -    	include/aux/Makefile
> -    	include/misc/Makefile
> -    	include/reiser4/Makefile
> -    	include/repair/Makefile
> -    	libmisc/Makefile
> -    	libaux/Makefile
> -    	libreiser4/Makefile
> -    	librepair/Makefile
> -    	plugin/Makefile
> -    	plugin/format/Makefile
> -    	plugin/format/format40/Makefile
> -    	plugin/alloc/Makefile
> -    	plugin/alloc/alloc40/Makefile
> -    	plugin/journal/Makefile
> -    	plugin/journal/journal40/Makefile
> -    	plugin/oid/Makefile
> -    	plugin/oid/oid40/Makefile
> -    	plugin/node/Makefile
> -    	plugin/node/node40/Makefile
> -	plugin/node/node41/Makefile
> -   	plugin/key/Makefile
> -    	plugin/key/key_common/Makefile
> -    	plugin/key/key_short/Makefile
> -    	plugin/key/key_large/Makefile
> -    	plugin/item/Makefile
> -    	plugin/item/body40/Makefile
> -    	plugin/item/nodeptr40/Makefile
> -    	plugin/item/stat40/Makefile
> -    	plugin/item/cde40/Makefile
> -    	plugin/item/tail40/Makefile
> -    	plugin/item/plain40/Makefile
> -    	plugin/item/ctail40/Makefile
> -    	plugin/item/extent40/Makefile
> -    	plugin/item/bbox40/Makefile
> -    	plugin/object/Makefile
> -    	plugin/object/obj40/Makefile
> -    	plugin/object/dir40/Makefile
> -    	plugin/object/reg40/Makefile
> -    	plugin/object/sym40/Makefile
> -    	plugin/object/spl40/Makefile
> -    	plugin/object/ccreg40/Makefile
> -    	plugin/policy/Makefile
> -    	plugin/policy/tails/Makefile
> -    	plugin/policy/extents/Makefile
> -    	plugin/policy/smart/Makefile
> -    	plugin/hash/Makefile
> -    	plugin/hash/r5_hash/Makefile
> -    	plugin/hash/tea_hash/Makefile
> -    	plugin/hash/deg_hash/Makefile
> -    	plugin/hash/rupasov_hash/Makefile
> -    	plugin/hash/fnv1_hash/Makefile
> -	plugin/fibre/Makefile
> -	plugin/fibre/lexic_fibre/Makefile
> -	plugin/fibre/dot_o_fibre/Makefile
> -	plugin/fibre/ext_1_fibre/Makefile
> -	plugin/fibre/ext_3_fibre/Makefile
> -    	plugin/sdext/Makefile
> -    	plugin/sdext/sdext_unix/Makefile
> -    	plugin/sdext/sdext_lw/Makefile
> -    	plugin/sdext/sdext_lt/Makefile
> -    	plugin/sdext/sdext_symlink/Makefile
> -    	plugin/sdext/sdext_flags/Makefile
> -	plugin/sdext/sdext_plug/Makefile
> -	plugin/sdext/sdext_crypto/Makefile
> -	plugin/compress/Makefile
> -    	progs/Makefile
> -    	progs/mkfs/Makefile
> -    	progs/fsck/Makefile
> -    	progs/debugfs/Makefile
> -    	progs/measurefs/Makefile
> -    	demos/Makefile
> -    	doc/Makefile
> -    	reiser4progs.spec
> -])
> -
> -echo
> -echo Type \'make\' to compile reiser4progs and \'make install\' to install it.
> diff --git a/demos/Makefile.am b/demos/Makefile.am
> index 5bfa09f..63cb37d 100644
> --- a/demos/Makefile.am
> +++ b/demos/Makefile.am
> @@ -2,7 +2,7 @@ noinst_SCRIPTS  = detect
>   
>   noinst_PROGRAMS = busy
>   
> -INCLUDES	= -I$(top_srcdir)/include
> +AM_CPPFLAGS	= -I$(top_srcdir)/include
>   
>   busy_SOURCES	= misc.c ls.c stat.c create.c ln.c rm.c cp.c trunc.c busy.c busy.h
>   
> diff --git a/demos/detect b/demos/detect
> index db390d9..40808c3 100644
> --- a/demos/detect
> +++ b/demos/detect
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/bin/sh
>   #
>   #  reiserfs probing script
>   
> @@ -58,7 +58,7 @@ reiserx_probe() {
>   	exit 1
>   }
>   
> -if [ ! -b $1 -a ! -r $1 ]; then
> +if [ ! -b $1 ] && [ ! -r $1 ]; then
>   	echo "Specified device isn't a block device and not a file"
>   	exit 1
>   fi
> diff --git a/libaux/Makefile.am b/libaux/Makefile.am
> index e3593ae..d094025 100644
> --- a/libaux/Makefile.am
> +++ b/libaux/Makefile.am
> @@ -16,4 +16,4 @@ libaux_minimal_la_SOURCES	= aux.c gauge.c crc32c.c
>   libaux_minimal_la_CFLAGS	= @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(auxincludedir)
> +AM_CPPFLAGS = $(auxincludedir)
> diff --git a/libmisc/Makefile.am b/libmisc/Makefile.am
> index e8d0e5a..79a0f69 100644
> --- a/libmisc/Makefile.am
> +++ b/libmisc/Makefile.am
> @@ -8,4 +8,4 @@ libmisc_la_LIBADD 	= @AAL_LIBS@ $(UUID_LIBS) @PROGS_LIBS@ \
>   
>   libmisc_la_CFLAGS       = @GENERIC_CFLAGS@
>   
> -INCLUDES                = -I$(top_srcdir)/include
> +AM_CPPFLAGS                = -I$(top_srcdir)/include
> diff --git a/libreiser4/Makefile.am b/libreiser4/Makefile.am
> index 9726397..7ada21d 100644
> --- a/libreiser4/Makefile.am
> +++ b/libreiser4/Makefile.am
> @@ -44,4 +44,4 @@ libreiser4_minimal_la_LDFLAGS  = -version-info $(LT_CURRENT):$(LT_REVISION):$(LT
>   			       -release $(LT_RELEASE)
>   endif
>   
> -INCLUDES                     = $(includedir)
> +AM_CPPFLAGS                     = $(includedir)
> diff --git a/librepair/Makefile.am b/librepair/Makefile.am
> index c4e9499..839120b 100644
> --- a/librepair/Makefile.am
> +++ b/librepair/Makefile.am
> @@ -18,5 +18,5 @@ librepair_static_la_LIBADD   = $(top_builddir)/libreiser4/libreiser4-static.la
>   librepair_static_la_SOURCES  = $(librepair_sources)
>   librepair_static_la_CFLAGS   = @GENERIC_CFLAGS@
>   
> -INCLUDES = -I$(top_srcdir)/include
> +AM_CPPFLAGS = -I$(top_srcdir)/include
>   
> diff --git a/one_touch_install b/one_touch_install
> index 22c599c..1b48201 100644
> --- a/one_touch_install
> +++ b/one_touch_install
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/bin/sh
>   
>   if [ ! -f ./configure.in ]; then
>   	echo "Error: You should run this from the package directory."
> diff --git a/plugin/alloc/alloc40/Makefile.am b/plugin/alloc/alloc40/Makefile.am
> index 4034f95..fc3d7ae 100644
> --- a/plugin/alloc/alloc40/Makefile.am
> +++ b/plugin/alloc/alloc40/Makefile.am
> @@ -19,4 +19,4 @@ liballoc40_minimal_la_SOURCES  = $(alloc40_sources)
>   liballoc40_minimal_la_CFLAGS   = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/compress/Makefile.am b/plugin/compress/Makefile.am
> index 03b976d..c2e99e5 100644
> --- a/plugin/compress/Makefile.am
> +++ b/plugin/compress/Makefile.am
> @@ -19,4 +19,4 @@ libcompress_minimal_la_SOURCES = $(compress_sources)
>   libcompress_minimal_la_CFLAGS  = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/fibre/dot_o_fibre/Makefile.am b/plugin/fibre/dot_o_fibre/Makefile.am
> index 441434e..07a8f43 100644
> --- a/plugin/fibre/dot_o_fibre/Makefile.am
> +++ b/plugin/fibre/dot_o_fibre/Makefile.am
> @@ -19,4 +19,4 @@ libdot_o_fibre_minimal_la_SOURCES = $(dot_o_fibre_sources)
>   libdot_o_fibre_minimal_la_CFLAGS  = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/fibre/ext_1_fibre/Makefile.am b/plugin/fibre/ext_1_fibre/Makefile.am
> index fdeae8b..44a83d0 100644
> --- a/plugin/fibre/ext_1_fibre/Makefile.am
> +++ b/plugin/fibre/ext_1_fibre/Makefile.am
> @@ -19,4 +19,4 @@ libext_1_fibre_minimal_la_SOURCES = $(ext_1_fibre_sources)
>   libext_1_fibre_minimal_la_CFLAGS  = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/fibre/ext_3_fibre/Makefile.am b/plugin/fibre/ext_3_fibre/Makefile.am
> index 2783ce5..4b54f0a 100644
> --- a/plugin/fibre/ext_3_fibre/Makefile.am
> +++ b/plugin/fibre/ext_3_fibre/Makefile.am
> @@ -19,4 +19,4 @@ libext_3_fibre_minimal_la_SOURCES = $(ext_3_fibre_sources)
>   libext_3_fibre_minimal_la_CFLAGS  = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/fibre/lexic_fibre/Makefile.am b/plugin/fibre/lexic_fibre/Makefile.am
> index 14a2ca1..8d21930 100644
> --- a/plugin/fibre/lexic_fibre/Makefile.am
> +++ b/plugin/fibre/lexic_fibre/Makefile.am
> @@ -19,4 +19,4 @@ liblexic_fibre_minimal_la_SOURCES = $(lexic_fibre_sources)
>   liblexic_fibre_minimal_la_CFLAGS  = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/format/format40/Makefile.am b/plugin/format/format40/Makefile.am
> index 7ffeccf..a134d05 100644
> --- a/plugin/format/format40/Makefile.am
> +++ b/plugin/format/format40/Makefile.am
> @@ -19,5 +19,5 @@ libformat40_minimal_la_SOURCES    = $(format40_sources)
>   libformat40_minimal_la_CFLAGS     = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/hash/deg_hash/Makefile.am b/plugin/hash/deg_hash/Makefile.am
> index 3dcf0c8..d8c14ef 100644
> --- a/plugin/hash/deg_hash/Makefile.am
> +++ b/plugin/hash/deg_hash/Makefile.am
> @@ -19,5 +19,5 @@ libdeg_hash_minimal_la_SOURCES  = $(deg_hash_sources)
>   libdeg_hash_minimal_la_CFLAGS   = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/hash/fnv1_hash/Makefile.am b/plugin/hash/fnv1_hash/Makefile.am
> index 6afadb8..9b3e846 100644
> --- a/plugin/hash/fnv1_hash/Makefile.am
> +++ b/plugin/hash/fnv1_hash/Makefile.am
> @@ -19,4 +19,4 @@ libfnv1_hash_minimal_la_SOURCES   = $(fnv1_hash_sources)
>   libfnv1_hash_minimal_la_CFLAGS    = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/hash/r5_hash/Makefile.am b/plugin/hash/r5_hash/Makefile.am
> index fce703b..5a90409 100644
> --- a/plugin/hash/r5_hash/Makefile.am
> +++ b/plugin/hash/r5_hash/Makefile.am
> @@ -19,5 +19,5 @@ libr5_hash_minimal_la_SOURCES  = $(r5_hash_sources)
>   libr5_hash_minimal_la_CFLAGS   = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/hash/rupasov_hash/Makefile.am b/plugin/hash/rupasov_hash/Makefile.am
> index 68d8328..d549ec1 100644
> --- a/plugin/hash/rupasov_hash/Makefile.am
> +++ b/plugin/hash/rupasov_hash/Makefile.am
> @@ -19,5 +19,5 @@ librupasov_hash_minimal_la_SOURCES   = $(rupasov_hash_sources)
>   librupasov_hash_minimal_la_CFLAGS    = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/hash/tea_hash/Makefile.am b/plugin/hash/tea_hash/Makefile.am
> index aba415f..81f0516 100644
> --- a/plugin/hash/tea_hash/Makefile.am
> +++ b/plugin/hash/tea_hash/Makefile.am
> @@ -19,5 +19,5 @@ libtea_hash_minimal_la_SOURCES  = $(tea_hash_sources)
>   libtea_hash_minimal_la_CFLAGS   = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/item/bbox40/Makefile.am b/plugin/item/bbox40/Makefile.am
> index e370d58..56513a0 100644
> --- a/plugin/item/bbox40/Makefile.am
> +++ b/plugin/item/bbox40/Makefile.am
> @@ -19,5 +19,5 @@ libbbox40_minimal_la_SOURCES	= $(bbox40_sources)
>   libbbox40_minimal_la_CFLAGS	= @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/item/body40/Makefile.am b/plugin/item/body40/Makefile.am
> index 9b8c092..1d553d2 100644
> --- a/plugin/item/body40/Makefile.am
> +++ b/plugin/item/body40/Makefile.am
> @@ -18,4 +18,4 @@ libbody40_minimal_la_SOURCES     = $(body40_sources)
>   libbody40_minimal_la_CFLAGS      = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/item/cde40/Makefile.am b/plugin/item/cde40/Makefile.am
> index a8445c5..1076d12 100644
> --- a/plugin/item/cde40/Makefile.am
> +++ b/plugin/item/cde40/Makefile.am
> @@ -19,4 +19,4 @@ libcde40_minimal_la_SOURCES  = $(cde40_sources)
>   libcde40_minimal_la_CFLAGS   = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/item/ctail40/Makefile.am b/plugin/item/ctail40/Makefile.am
> index a4de87d..99e2932 100644
> --- a/plugin/item/ctail40/Makefile.am
> +++ b/plugin/item/ctail40/Makefile.am
> @@ -19,5 +19,5 @@ libctail40_minimal_la_SOURCES = $(ctail40_sources)
>   libctail40_minimal_la_CFLAGS  = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/item/extent40/Makefile.am b/plugin/item/extent40/Makefile.am
> index 9ae6ea2..bc086cf 100644
> --- a/plugin/item/extent40/Makefile.am
> +++ b/plugin/item/extent40/Makefile.am
> @@ -19,5 +19,5 @@ libextent40_minimal_la_SOURCES  = $(extent40_sources)
>   libextent40_minimal_la_CFLAGS   = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/item/nodeptr40/Makefile.am b/plugin/item/nodeptr40/Makefile.am
> index 48acd7f..31e41c6 100644
> --- a/plugin/item/nodeptr40/Makefile.am
> +++ b/plugin/item/nodeptr40/Makefile.am
> @@ -19,5 +19,5 @@ libnodeptr40_minimal_la_SOURCES   = $(nodeptr40_sources)
>   libnodeptr40_minimal_la_CFLAGS    = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/item/plain40/Makefile.am b/plugin/item/plain40/Makefile.am
> index dd833e2..662a961 100644
> --- a/plugin/item/plain40/Makefile.am
> +++ b/plugin/item/plain40/Makefile.am
> @@ -19,5 +19,5 @@ libplain40_minimal_la_SOURCES = $(plain40_sources)
>   libplain40_minimal_la_CFLAGS  = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/item/stat40/Makefile.am b/plugin/item/stat40/Makefile.am
> index 184a201..634eb65 100644
> --- a/plugin/item/stat40/Makefile.am
> +++ b/plugin/item/stat40/Makefile.am
> @@ -19,5 +19,5 @@ libstat40_minimal_la_SOURCES  = $(stat40_sources)
>   libstat40_minimal_la_CFLAGS   = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/item/tail40/Makefile.am b/plugin/item/tail40/Makefile.am
> index 87a8e23..db64ddd 100644
> --- a/plugin/item/tail40/Makefile.am
> +++ b/plugin/item/tail40/Makefile.am
> @@ -19,5 +19,5 @@ libtail40_minimal_la_SOURCES  = $(tail40_sources)
>   libtail40_minimal_la_CFLAGS   = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/journal/journal40/Makefile.am b/plugin/journal/journal40/Makefile.am
> index 37d86f6..ede320c 100644
> --- a/plugin/journal/journal40/Makefile.am
> +++ b/plugin/journal/journal40/Makefile.am
> @@ -20,4 +20,4 @@ libjournal40_minimal_la_SOURCES  	= $(journal40_sources)
>   libjournal40_minimal_la_CFLAGS   	= @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/key/key_common/Makefile.am b/plugin/key/key_common/Makefile.am
> index 7960df4..35e7b76 100644
> --- a/plugin/key/key_common/Makefile.am
> +++ b/plugin/key/key_common/Makefile.am
> @@ -18,4 +18,4 @@ libkey_common_minimal_la_SOURCES   = $(key_common_sources)
>   libkey_common_minimal_la_CFLAGS    = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/key/key_large/Makefile.am b/plugin/key/key_large/Makefile.am
> index 6517a27..437e6c5 100644
> --- a/plugin/key/key_large/Makefile.am
> +++ b/plugin/key/key_large/Makefile.am
> @@ -19,4 +19,4 @@ libkey_large_minimal_la_SOURCES  	= $(key_large_sources)
>   libkey_large_minimal_la_CFLAGS   	= @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/key/key_short/Makefile.am b/plugin/key/key_short/Makefile.am
> index f72eec1..71bf03c 100644
> --- a/plugin/key/key_short/Makefile.am
> +++ b/plugin/key/key_short/Makefile.am
> @@ -19,4 +19,4 @@ libkey_short_minimal_la_SOURCES  	= $(key_short_sources)
>   libkey_short_minimal_la_CFLAGS   	= @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/node/node40/Makefile.am b/plugin/node/node40/Makefile.am
> index ee8c4c5..86e6914 100644
> --- a/plugin/node/node40/Makefile.am
> +++ b/plugin/node/node40/Makefile.am
> @@ -19,4 +19,4 @@ libnode40_minimal_la_SOURCES  = $(node40_sources)
>   libnode40_minimal_la_CFLAGS   = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/node/node41/Makefile.am b/plugin/node/node41/Makefile.am
> index dfe9ed8..e5bf939 100644
> --- a/plugin/node/node41/Makefile.am
> +++ b/plugin/node/node41/Makefile.am
> @@ -19,4 +19,4 @@ libnode41_minimal_la_SOURCES  = $(node41_sources)
>   libnode41_minimal_la_CFLAGS   = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/object/ccreg40/Makefile.am b/plugin/object/ccreg40/Makefile.am
> index 4c29478..961606f 100644
> --- a/plugin/object/ccreg40/Makefile.am
> +++ b/plugin/object/ccreg40/Makefile.am
> @@ -19,4 +19,4 @@ libccreg40_minimal_la_SOURCES    = $(ccreg40_sources)
>   libccreg40_minimal_la_CFLAGS     = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/object/dir40/Makefile.am b/plugin/object/dir40/Makefile.am
> index 1f0723e..4cd8995 100644
> --- a/plugin/object/dir40/Makefile.am
> +++ b/plugin/object/dir40/Makefile.am
> @@ -19,4 +19,4 @@ libdir40_minimal_la_SOURCES    = $(dir40_sources)
>   libdir40_minimal_la_CFLAGS     = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/object/obj40/Makefile.am b/plugin/object/obj40/Makefile.am
> index 9e9c3d2..c2db47a 100644
> --- a/plugin/object/obj40/Makefile.am
> +++ b/plugin/object/obj40/Makefile.am
> @@ -18,5 +18,5 @@ libobj40_minimal_la_SOURCES     = $(obj40_sources)
>   libobj40_minimal_la_CFLAGS      = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/object/reg40/Makefile.am b/plugin/object/reg40/Makefile.am
> index 767fc46..d99b919 100644
> --- a/plugin/object/reg40/Makefile.am
> +++ b/plugin/object/reg40/Makefile.am
> @@ -19,4 +19,4 @@ libreg40_minimal_la_SOURCES    = $(reg40_sources)
>   libreg40_minimal_la_CFLAGS     = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/object/spl40/Makefile.am b/plugin/object/spl40/Makefile.am
> index b65c409..d35543c 100644
> --- a/plugin/object/spl40/Makefile.am
> +++ b/plugin/object/spl40/Makefile.am
> @@ -19,4 +19,4 @@ libspl40_minimal_la_SOURCES   = $(spl40_sources)
>   libspl40_minimal_la_CFLAGS    = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/object/sym40/Makefile.am b/plugin/object/sym40/Makefile.am
> index ef141b6..531456e 100644
> --- a/plugin/object/sym40/Makefile.am
> +++ b/plugin/object/sym40/Makefile.am
> @@ -19,4 +19,4 @@ libsym40_minimal_la_SOURCES   = $(sym40_sources)
>   libsym40_minimal_la_CFLAGS    = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/oid/oid40/Makefile.am b/plugin/oid/oid40/Makefile.am
> index 5bb25a1..a98bc86 100644
> --- a/plugin/oid/oid40/Makefile.am
> +++ b/plugin/oid/oid40/Makefile.am
> @@ -19,5 +19,5 @@ liboid40_minimal_la_SOURCES   = $(oid40_sources)
>   liboid40_minimal_la_CFLAGS    = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/policy/extents/Makefile.am b/plugin/policy/extents/Makefile.am
> index c954a14..a88f12c 100644
> --- a/plugin/policy/extents/Makefile.am
> +++ b/plugin/policy/extents/Makefile.am
> @@ -19,4 +19,4 @@ libextents_minimal_la_SOURCES     = $(extents_sources)
>   libextents_minimal_la_CFLAGS      = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/policy/smart/Makefile.am b/plugin/policy/smart/Makefile.am
> index c2c5917..129761e 100644
> --- a/plugin/policy/smart/Makefile.am
> +++ b/plugin/policy/smart/Makefile.am
> @@ -19,5 +19,5 @@ libsmart_minimal_la_SOURCES       = $(smart_sources)
>   libsmart_minimal_la_CFLAGS        = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/policy/tails/Makefile.am b/plugin/policy/tails/Makefile.am
> index 9dd6acb..55d9ce7 100644
> --- a/plugin/policy/tails/Makefile.am
> +++ b/plugin/policy/tails/Makefile.am
> @@ -19,5 +19,5 @@ libtails_minimal_la_SOURCES       = $(tails_sources)
>   libtails_minimal_la_CFLAGS        = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/sdext/sdext_crypto/Makefile.am b/plugin/sdext/sdext_crypto/Makefile.am
> index d0ecc23..280533a 100644
> --- a/plugin/sdext/sdext_crypto/Makefile.am
> +++ b/plugin/sdext/sdext_crypto/Makefile.am
> @@ -19,4 +19,4 @@ libsdext_crypro_minimal_la_SOURCES = $(sdext_crypro_sources)
>   libsdext_crypro_minimal_la_CFLAGS  = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
> diff --git a/plugin/sdext/sdext_flags/Makefile.am b/plugin/sdext/sdext_flags/Makefile.am
> index 3b90c45..19abefa 100644
> --- a/plugin/sdext/sdext_flags/Makefile.am
> +++ b/plugin/sdext/sdext_flags/Makefile.am
> @@ -19,5 +19,5 @@ libsdext_flags_minimal_la_SOURCES = $(sdext_flags_sources)
>   libsdext_flags_minimal_la_CFLAGS  = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/sdext/sdext_lt/Makefile.am b/plugin/sdext/sdext_lt/Makefile.am
> index 73830c2..356c426 100644
> --- a/plugin/sdext/sdext_lt/Makefile.am
> +++ b/plugin/sdext/sdext_lt/Makefile.am
> @@ -19,5 +19,5 @@ libsdext_lt_minimal_la_SOURCES    = $(sdext_lt_sources)
>   libsdext_lt_minimal_la_CFLAGS     = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/sdext/sdext_lw/Makefile.am b/plugin/sdext/sdext_lw/Makefile.am
> index d68ad57..a00b851 100644
> --- a/plugin/sdext/sdext_lw/Makefile.am
> +++ b/plugin/sdext/sdext_lw/Makefile.am
> @@ -19,5 +19,5 @@ libsdext_lw_minimal_la_SOURCES    = $(sdext_lw_sources)
>   libsdext_lw_minimal_la_CFLAGS     = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/sdext/sdext_plug/Makefile.am b/plugin/sdext/sdext_plug/Makefile.am
> index c1826a4..1f555d8 100644
> --- a/plugin/sdext/sdext_plug/Makefile.am
> +++ b/plugin/sdext/sdext_plug/Makefile.am
> @@ -19,5 +19,5 @@ libsdext_plug_minimal_la_SOURCES = $(sdext_plug_sources)
>   libsdext_plug_minimal_la_CFLAGS  = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/sdext/sdext_symlink/Makefile.am b/plugin/sdext/sdext_symlink/Makefile.am
> index 5a7c622..8472e23 100644
> --- a/plugin/sdext/sdext_symlink/Makefile.am
> +++ b/plugin/sdext/sdext_symlink/Makefile.am
> @@ -19,5 +19,5 @@ libsdext_symlink_minimal_la_SOURCES  = $(sdext_symlink_sources)
>   libsdext_symlink_minimal_la_CFLAGS   = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/plugin/sdext/sdext_unix/Makefile.am b/plugin/sdext/sdext_unix/Makefile.am
> index 5c65b99..d597ff5 100644
> --- a/plugin/sdext/sdext_unix/Makefile.am
> +++ b/plugin/sdext/sdext_unix/Makefile.am
> @@ -19,5 +19,5 @@ libsdext_unix_minimal_la_SOURCES  = $(sdext_unix_sources)
>   libsdext_unix_minimal_la_CFLAGS   = @MINIMAL_CFLAGS@
>   endif
>   
> -INCLUDES = $(includedir)
> +AM_CPPFLAGS = $(includedir)
>   
> diff --git a/prepare b/prepare
> index c3eaa83..1a5ffd5 100755
> --- a/prepare
> +++ b/prepare
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/bin/sh
>   
>   echo "aclocal ..."
>   aclocal && (
> diff --git a/progs/debugfs/Makefile.am b/progs/debugfs/Makefile.am
> index 0414abb..a5c496e 100644
> --- a/progs/debugfs/Makefile.am
> +++ b/progs/debugfs/Makefile.am
> @@ -10,4 +10,4 @@ debugfs_reiser4_LDADD 	 = $(top_builddir)/libreiser4/libreiser4.la \
>   debugfs_reiser4_LDFLAGS  = @PROGS_LDFLAGS@
>   debugfs_reiser4_CFLAGS   = @GENERIC_CFLAGS@
>   
> -INCLUDES		 = -I$(top_srcdir)/include
> +AM_CPPFLAGS		 = -I$(top_srcdir)/include
> diff --git a/progs/fsck/Makefile.am b/progs/fsck/Makefile.am
> index fda8695..b597108 100644
> --- a/progs/fsck/Makefile.am
> +++ b/progs/fsck/Makefile.am
> @@ -9,4 +9,4 @@ fsck_reiser4_LDADD 	= $(top_builddir)/libreiser4/libreiser4.la \
>   fsck_reiser4_LDFLAGS    = @PROGS_LDFLAGS@
>   fsck_reiser4_CFLAGS     = @GENERIC_CFLAGS@
>   
> -INCLUDES		= -I$(top_srcdir)/include
> +AM_CPPFLAGS		= -I$(top_srcdir)/include
> diff --git a/progs/measurefs/Makefile.am b/progs/measurefs/Makefile.am
> index d62a342..4cf8e8e 100644
> --- a/progs/measurefs/Makefile.am
> +++ b/progs/measurefs/Makefile.am
> @@ -8,4 +8,4 @@ measurefs_reiser4_LDADD    = $(top_builddir)/libreiser4/libreiser4.la \
>   measurefs_reiser4_LDFLAGS  = @PROGS_LDFLAGS@
>   measurefs_reiser4_CFLAGS   = @GENERIC_CFLAGS@
>   
> -INCLUDES		   = -I$(top_srcdir)/include
> +AM_CPPFLAGS		   = -I$(top_srcdir)/include
> diff --git a/progs/mkfs/Makefile.am b/progs/mkfs/Makefile.am
> index 2be0f37..950eff6 100644
> --- a/progs/mkfs/Makefile.am
> +++ b/progs/mkfs/Makefile.am
> @@ -8,7 +8,7 @@ mkfs_reiser4_LDADD 	= $(top_builddir)/libreiser4/libreiser4.la \
>   mkfs_reiser4_LDFLAGS    = @PROGS_LDFLAGS@
>   mkfs_reiser4_CFLAGS 	= @GENERIC_CFLAGS@
>   
> -INCLUDES		= -I$(top_srcdir)/include
> +AM_CPPFLAGS		= -I$(top_srcdir)/include
>   
>   uninstall-make_reiser4:
>   	if test -f $(DESTDIR)$(sbindir)/make_reiser4; then \
> diff --git a/run-ldconfig b/run-ldconfig
> index 227f126..c5a00e3 100755
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
> +	which ldconfig > /dev/null 2>&1;
>   	if test $? -eq 0; then
>   		ldc=`which ldconfig`;
>   	fi

