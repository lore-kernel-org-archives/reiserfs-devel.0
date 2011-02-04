From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: problem compiling reise4progs-1.0.7 on fedora-14
Date: Fri, 04 Feb 2011 17:23:00 +0100
Message-ID: <4D4C27E4.9010803@gmail.com>
References: <AANLkTikKHkJqJSkiwDnbQweJynwZw-dpF6CteEJxVOrO@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <AANLkTikKHkJqJSkiwDnbQweJynwZw-dpF6CteEJxVOrO@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: sergey ivanov <sergey57@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

sergey ivanov wrote:
> Hi,
>   

Hello.

> I'm trying to test reiser4 with kernel 2.6.37, - have built it from
> sources from kernel.org and patch from
> http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/,
> - thanks, it compiled, installed and booted without problems.
> Then I have built rpm packages for libaal using provided in the source
> spec-file. Installed all binary packages of libaal. But then trying to
> do the same with reiser4progs.spec

Hmm.. Where did you find that rpm?
AFAIK Fedora doesn't provide any reiser4 packages..

I would recommend to download and build manually the following stuff:

1) http://www.kernel.org/pub/linux/utils/fs/reiser4/libaal/
2) 
http://www.kernel.org/pub/linux/utils/fs/reiser4/reiser4progs/reiser4progs-1.0.7.tar.gz

Thanks,
Edward.

>  I getting the error at configure
> time:
> {{{
>  [seriv@localhost reiser4progs-1.0.7]$ CFLAGS="-I/usr/include/aal"
> LDFLAGS="-L/usr/lib64" ./configure 2>&1 | tail
> checking whether -Wuninitialized works... yes
> checking whether -Wno-unused-parameter works... yes
> checking whether -Wredundant-decls works... yes
> checking whether -Wredundant-decls works with readline.h... yes
> checking for special C compiler options needed for large files... no
> checking for _FILE_OFFSET_BITS value needed for large files... no
> configure: WARNING: Can't detect right _FILE_OFFSET_BITS. Will be
> forced to 64bit.
> checking for off_t... yes
> checking size of off_t... configure: error: cannot compute sizeof (off_t)
> See `config.log' for more details.
> }}}
> and config.log contains the following:
> {{{
> configure:23477: checking for off_t
> configure:23512: gcc -c -I/usr/include/aal  conftest.c >&5
> configure:23518: $? = 0
> configure:23533: result: yes
> configure:23540: checking size of off_t
> configure:23872: gcc -o conftest -I/usr/include/aal  -L/usr/lib64
> conftest.c  >&5
> In file included from /usr/include/stdlib.h:43:0,
>                  from conftest.c:57:
> /usr/include/bits/waitstatus.h:80:15: error: duplicate member '__w_retcode'
> /usr/include/bits/waitstatus.h:80:15: error: duplicate member '({anonymous})'
> /usr/include/bits/waitstatus.h:80:15: error: duplicate member '({anonymous})'
> /usr/include/bits/waitstatus.h:81:15: error: duplicate member '__w_coredump'
> /usr/include/bits/waitstatus.h:81:15: error: duplicate member '({anonymous})'
> /usr/include/bits/waitstatus.h:81:15: error: duplicate member '({anonymous})'
> /usr/include/bits/waitstatus.h:81:15: error: duplicate member '({anonymous})'
> /usr/include/bits/waitstatus.h:82:15: error: duplicate member '__w_termsig'
> /usr/include/bits/waitstatus.h:82:15: error: duplicate member '({anonymous})'
> /usr/include/bits/waitstatus.h:82:15: error: duplicate member '({anonymous})'
> /usr/include/bits/waitstatus.h:82:15: error: duplicate member '({anonymous})'
> /usr/include/bits/waitstatus.h:82:15: error: duplicate member '({anonymous})'
> /usr/include/bits/waitstatus.h:94:15: error: duplicate member '__w_stopsig'
> /usr/include/bits/waitstatus.h:94:15: error: duplicate member '({anonymous})'
> /usr/include/bits/waitstatus.h:94:15: error: duplicate member '({anonymous})'
> /usr/include/bits/waitstatus.h:95:15: error: duplicate member '__w_stopval'
> /usr/include/bits/waitstatus.h:95:15: error: duplicate member '({anonymous})'
> /usr/include/bits/waitstatus.h:95:15: error: duplicate member '({anonymous})'
> /usr/include/bits/waitstatus.h:95:15: error: duplicate member '({anonymous})'
> configure:23875: $? = 1
> configure: program exited with status 1
> configure: failed program was:
> | /* confdefs.h.  */
> | #define PACKAGE_NAME ""
> | #define PACKAGE_TARNAME ""
> | #define PACKAGE_VERSION ""
> | #define PACKAGE_STRING ""
>
> | #define PACKAGE_BUGREPORT ""
> | #define PACKAGE "reiser4progs"
> | #define VERSION "1.0.7"
> | #define LIBREISER4_MAX_INTERFACE_VERSION 0
> | #define LIBREISER4_MIN_INTERFACE_VERSION 0
> | #define HAVE_LIBUUID 1
> | #define HAVE_LIBREADLINE 1
> | #define HAVE_SYS_TYPES_H 1
> | #define HAVE_SYS_STAT_H 1
> | #define HAVE_STRING_H 1
> | #define HAVE_MEMORY_H 1
> | #define HAVE_STRINGS_H 1
> | #define HAVE_UNISTD_H 1
> | #define HAVE_DLFCN_H 1
> | #define HAVE_UUID_UUID_H 1
> | #define HAVE_READLINE_READLINE_H 1
> | #define HAVE_READLINE_HISTORY_H 1
> | #define HAVE_DIRENT_H 1
> | #define HAVE_PRINTF_H 1
> | #define HAVE_ERRNO_H 1
> | #define HAVE_FCNTL_H 1
> | #define HAVE_MNTENT_H 1
> | #define HAVE_STRING_H 1
> | #define HAVE_SYS_IOCTL_H 1
> | #define HAVE_SYS_MOUNT_H 1
> | #define HAVE_SYS_VFS_H 1
> | #define HAVE_UNISTD_H 1
> | #define HAVE_RL_COMPLETION_MATCHES 1
> | #define HAVE_STRUCT_STAT_ST_RDEV 1
> | #define LSTAT_FOLLOWS_SLASHED_SYMLINK 1
> | #define HAVE_REGISTER_PRINTF_FUNCTION 1
> | #define HAVE_STATFS 1
> | #define HAVE_GETMNTENT 1
> | #define HAVE_HASMNTOPT 1
> | #define HAVE_MEMSET 1
> | #define HAVE_STRERROR 1
> | #define HAVE_STRTOL 1
> | #define HAVE_TIME 1
> | #define HAVE_UNAME 1
> | #define HAVE_SYSCONF 1
> | /* end confdefs.h.  */
> |
> |       #include <stdio.h>
>
> |       #include <sys/types.h>
> |       #include <unistd.h>
> |
> |
> |    typedef off_t ac__type_sizeof_;
> | static long int longval () { return (long int) (sizeof (ac__type_sizeof_)); }
> | static unsigned long int ulongval () { return (long int) (sizeof
> (ac__type_sizeof_)); }
> | #include <stdio.h>
> | #include <stdlib.h>
> | int
> | main ()
> | {
> |
> |   FILE *f = fopen ("conftest.val", "w");
> |   if (! f)
> |     return 1;
> |   if (((long int) (sizeof (ac__type_sizeof_))) < 0)
> |     {
> |       long int i = longval ();
> |       if (i != ((long int) (sizeof (ac__type_sizeof_))))
> |       return 1;
> |       fprintf (f, "%ld\n", i);
> |     }
> |   else
> |     {
> |       unsigned long int i = ulongval ();
> |       if (i != ((long int) (sizeof (ac__type_sizeof_))))
> |       return 1;
> |       fprintf (f, "%lu\n", i);
> |     }
> |   return ferror (f) || fclose (f) != 0;
> |
> |   ;
> |   return 0;
> | }
> configure:23895: error: cannot compute sizeof (off_t)
> See `config.log' for more details.
> }}}
>
> Please, help.
>   

