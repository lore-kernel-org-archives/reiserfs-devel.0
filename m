From: sergey ivanov <sergey57@gmail.com>
Subject: Re: problem compiling reise4progs-1.0.7 on fedora-14
Date: Fri, 4 Feb 2011 14:13:29 -0500
Message-ID: <AANLkTikaErC2UB50kWFEg38p6ycyH85=CRRCC8k8jwQa@mail.gmail.com>
References: <AANLkTikKHkJqJSkiwDnbQweJynwZw-dpF6CteEJxVOrO@mail.gmail.com>
	<4D4C27E4.9010803@gmail.com>
	<AANLkTi=yhmD_rJEe7y2tVzVd=qhJhtgYNY8G6Bxzwhaz@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=QVBvxQGPKwzNOa1QBbr2f7QIt1cc8FlE0CM9A+iRcV0=;
        b=qKJKSlkq4ah3Nly2zgzqmSE3eWE6UtILCBTdssOvFHEpvrCEmGnvWm4PseeaDEMmJt
         r0mnlxYNP3Z/dwxpkgRuxrKNpFCDg0K0W3TvO+J3tr+NZ7wiQdA5Cg4n1SK4AT+n8iaf
         xDfGmziQVeALk0tw2eDQrHReWnOpgD9W+QGo4=
In-Reply-To: <AANLkTi=yhmD_rJEe7y2tVzVd=qhJhtgYNY8G6Bxzwhaz@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Looks like it's very similar to the problem discussed at
http://old.nabble.com/can't-compile-1.1.4-or-1.1.5-(or-any-version-eith=
er)-to29562710.html#a29562710
--=20
  Sergey

On Fri, Feb 4, 2011 at 12:08 PM, sergey ivanov <sergey57@gmail.com> wro=
te:
> Edward,
> I just got these sources! libaal-01.0.5 has a file libaal.spec. The
> only thing I changed in the spec to build it successfully in Fedora-1=
4
> was:
> {{{
> $ diff -u libaal-1.0.5*/libaal.spec
> --- libaal-1.0.5/libaal.spec =C2=A0 =C2=A02011-02-04 04:13:11.5517005=
19 -0500
> +++ libaal-1.0.5.orig/libaal.spec =C2=A0 =C2=A0 =C2=A0 2005-08-05 09:=
32:59.000000000 -0400
> @@ -8,7 +8,7 @@
> =C2=A0License: GPL
> =C2=A0Group: Development/Libraries
> =C2=A0URL: http://www.namesys.com/
> -Source: libaal-%{version}.tar.bz2
> +Source: libaal-%{version}.tar.gz
> =C2=A0BuildRoot: %{_tmppath}/%{name}-%{version}-%{release}-root
>
> =C2=A0%description
> }}}
> Since the sources are distributed as =C2=A0*.tar.bz2 files, it would =
be
> better to change Source line in spec file to reflect it, - but it's a
> minor problem.
>
> But for reiser4progs I'm trying ./configure, not rpmbuild! I will use
> spec file and create rpm files after successful build if I got it.
> --
> =C2=A0Regards,
> =C2=A0 Sergey Ivanov.
>
> On Fri, Feb 4, 2011 at 11:23 AM, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>> sergey ivanov wrote:
>>>
>>> Hi,
>>>
>>
>> Hello.
>>
>>> I'm trying to test reiser4 with kernel 2.6.37, - have built it from
>>> sources from kernel.org and patch from
>>>
>>> http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser=
4-for-2.6/,
>>> - thanks, it compiled, installed and booted without problems.
>>> Then I have built rpm packages for libaal using provided in the sou=
rce
>>> spec-file. Installed all binary packages of libaal. But then trying=
 to
>>> do the same with reiser4progs.spec
>>
>> Hmm.. Where did you find that rpm?
>> AFAIK Fedora doesn't provide any reiser4 packages..
>>
>> I would recommend to download and build manually the following stuff=
:
>>
>> 1) http://www.kernel.org/pub/linux/utils/fs/reiser4/libaal/
>> 2)
>> http://www.kernel.org/pub/linux/utils/fs/reiser4/reiser4progs/reiser=
4progs-1.0.7.tar.gz
>>
>> Thanks,
>> Edward.
>>
>>> =C2=A0I getting the error at configure
>>> time:
>>> {{{
>>> =C2=A0[seriv@localhost reiser4progs-1.0.7]$ CFLAGS=3D"-I/usr/includ=
e/aal"
>>> LDFLAGS=3D"-L/usr/lib64" ./configure 2>&1 | tail
>>> checking whether -Wuninitialized works... yes
>>> checking whether -Wno-unused-parameter works... yes
>>> checking whether -Wredundant-decls works... yes
>>> checking whether -Wredundant-decls works with readline.h... yes
>>> checking for special C compiler options needed for large files... n=
o
>>> checking for _FILE_OFFSET_BITS value needed for large files... no
>>> configure: WARNING: Can't detect right _FILE_OFFSET_BITS. Will be
>>> forced to 64bit.
>>> checking for off_t... yes
>>> checking size of off_t... configure: error: cannot compute sizeof (=
off_t)
>>> See `config.log' for more details.
>>> }}}
>>> and config.log contains the following:
>>> {{{
>>> configure:23477: checking for off_t
>>> configure:23512: gcc -c -I/usr/include/aal =C2=A0conftest.c >&5
>>> configure:23518: $? =3D 0
>>> configure:23533: result: yes
>>> configure:23540: checking size of off_t
>>> configure:23872: gcc -o conftest -I/usr/include/aal =C2=A0-L/usr/li=
b64
>>> conftest.c =C2=A0>&5
>>> In file included from /usr/include/stdlib.h:43:0,
>>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from confte=
st.c:57:
>>> /usr/include/bits/waitstatus.h:80:15: error: duplicate member
>>> '__w_retcode'
>>> /usr/include/bits/waitstatus.h:80:15: error: duplicate member
>>> '({anonymous})'
>>> /usr/include/bits/waitstatus.h:80:15: error: duplicate member
>>> '({anonymous})'
>>> /usr/include/bits/waitstatus.h:81:15: error: duplicate member
>>> '__w_coredump'
>>> /usr/include/bits/waitstatus.h:81:15: error: duplicate member
>>> '({anonymous})'
>>> /usr/include/bits/waitstatus.h:81:15: error: duplicate member
>>> '({anonymous})'
>>> /usr/include/bits/waitstatus.h:81:15: error: duplicate member
>>> '({anonymous})'
>>> /usr/include/bits/waitstatus.h:82:15: error: duplicate member
>>> '__w_termsig'
>>> /usr/include/bits/waitstatus.h:82:15: error: duplicate member
>>> '({anonymous})'
>>> /usr/include/bits/waitstatus.h:82:15: error: duplicate member
>>> '({anonymous})'
>>> /usr/include/bits/waitstatus.h:82:15: error: duplicate member
>>> '({anonymous})'
>>> /usr/include/bits/waitstatus.h:82:15: error: duplicate member
>>> '({anonymous})'
>>> /usr/include/bits/waitstatus.h:94:15: error: duplicate member
>>> '__w_stopsig'
>>> /usr/include/bits/waitstatus.h:94:15: error: duplicate member
>>> '({anonymous})'
>>> /usr/include/bits/waitstatus.h:94:15: error: duplicate member
>>> '({anonymous})'
>>> /usr/include/bits/waitstatus.h:95:15: error: duplicate member
>>> '__w_stopval'
>>> /usr/include/bits/waitstatus.h:95:15: error: duplicate member
>>> '({anonymous})'
>>> /usr/include/bits/waitstatus.h:95:15: error: duplicate member
>>> '({anonymous})'
>>> /usr/include/bits/waitstatus.h:95:15: error: duplicate member
>>> '({anonymous})'
>>> configure:23875: $? =3D 1
>>> configure: program exited with status 1
>>> configure: failed program was:
>>> | /* confdefs.h. =C2=A0*/
>>> | #define PACKAGE_NAME ""
>>> | #define PACKAGE_TARNAME ""
>>> | #define PACKAGE_VERSION ""
>>> | #define PACKAGE_STRING ""
>>>
>>> | #define PACKAGE_BUGREPORT ""
>>> | #define PACKAGE "reiser4progs"
>>> | #define VERSION "1.0.7"
>>> | #define LIBREISER4_MAX_INTERFACE_VERSION 0
>>> | #define LIBREISER4_MIN_INTERFACE_VERSION 0
>>> | #define HAVE_LIBUUID 1
>>> | #define HAVE_LIBREADLINE 1
>>> | #define HAVE_SYS_TYPES_H 1
>>> | #define HAVE_SYS_STAT_H 1
>>> | #define HAVE_STRING_H 1
>>> | #define HAVE_MEMORY_H 1
>>> | #define HAVE_STRINGS_H 1
>>> | #define HAVE_UNISTD_H 1
>>> | #define HAVE_DLFCN_H 1
>>> | #define HAVE_UUID_UUID_H 1
>>> | #define HAVE_READLINE_READLINE_H 1
>>> | #define HAVE_READLINE_HISTORY_H 1
>>> | #define HAVE_DIRENT_H 1
>>> | #define HAVE_PRINTF_H 1
>>> | #define HAVE_ERRNO_H 1
>>> | #define HAVE_FCNTL_H 1
>>> | #define HAVE_MNTENT_H 1
>>> | #define HAVE_STRING_H 1
>>> | #define HAVE_SYS_IOCTL_H 1
>>> | #define HAVE_SYS_MOUNT_H 1
>>> | #define HAVE_SYS_VFS_H 1
>>> | #define HAVE_UNISTD_H 1
>>> | #define HAVE_RL_COMPLETION_MATCHES 1
>>> | #define HAVE_STRUCT_STAT_ST_RDEV 1
>>> | #define LSTAT_FOLLOWS_SLASHED_SYMLINK 1
>>> | #define HAVE_REGISTER_PRINTF_FUNCTION 1
>>> | #define HAVE_STATFS 1
>>> | #define HAVE_GETMNTENT 1
>>> | #define HAVE_HASMNTOPT 1
>>> | #define HAVE_MEMSET 1
>>> | #define HAVE_STRERROR 1
>>> | #define HAVE_STRTOL 1
>>> | #define HAVE_TIME 1
>>> | #define HAVE_UNAME 1
>>> | #define HAVE_SYSCONF 1
>>> | /* end confdefs.h. =C2=A0*/
>>> |
>>> | =C2=A0 =C2=A0 =C2=A0 #include <stdio.h>
>>>
>>> | =C2=A0 =C2=A0 =C2=A0 #include <sys/types.h>
>>> | =C2=A0 =C2=A0 =C2=A0 #include <unistd.h>
>>> |
>>> |
>>> | =C2=A0 =C2=A0typedef off_t ac__type_sizeof_;
>>> | static long int longval () { return (long int) (sizeof
>>> (ac__type_sizeof_)); }
>>> | static unsigned long int ulongval () { return (long int) (sizeof
>>> (ac__type_sizeof_)); }
>>> | #include <stdio.h>
>>> | #include <stdlib.h>
>>> | int
>>> | main ()
>>> | {
>>> |
>>> | =C2=A0 FILE *f =3D fopen ("conftest.val", "w");
>>> | =C2=A0 if (! f)
>>> | =C2=A0 =C2=A0 return 1;
>>> | =C2=A0 if (((long int) (sizeof (ac__type_sizeof_))) < 0)
>>> | =C2=A0 =C2=A0 {
>>> | =C2=A0 =C2=A0 =C2=A0 long int i =3D longval ();
>>> | =C2=A0 =C2=A0 =C2=A0 if (i !=3D ((long int) (sizeof (ac__type_siz=
eof_))))
>>> | =C2=A0 =C2=A0 =C2=A0 return 1;
>>> | =C2=A0 =C2=A0 =C2=A0 fprintf (f, "%ld\n", i);
>>> | =C2=A0 =C2=A0 }
>>> | =C2=A0 else
>>> | =C2=A0 =C2=A0 {
>>> | =C2=A0 =C2=A0 =C2=A0 unsigned long int i =3D ulongval ();
>>> | =C2=A0 =C2=A0 =C2=A0 if (i !=3D ((long int) (sizeof (ac__type_siz=
eof_))))
>>> | =C2=A0 =C2=A0 =C2=A0 return 1;
>>> | =C2=A0 =C2=A0 =C2=A0 fprintf (f, "%lu\n", i);
>>> | =C2=A0 =C2=A0 }
>>> | =C2=A0 return ferror (f) || fclose (f) !=3D 0;
>>> |
>>> | =C2=A0 ;
>>> | =C2=A0 return 0;
>>> | }
>>> configure:23895: error: cannot compute sizeof (off_t)
>>> See `config.log' for more details.
>>> }}}
>>>
>>> Please, help.
>>>
>>
>>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
