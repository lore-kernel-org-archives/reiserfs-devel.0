From: "Thomas Graham" <lkthomas@sml.dyndns.org>
Subject: Re: Compiling libaal
Date: Sat, 17 Jan 2004 17:51:09 +0800 (HKT)
Message-ID: <2085.219.78.162.51.1074333069.squirrel@sml.dyndns.org>
References: <AC582FE38EBCDC44BCAC55FE8C1C3C1131ACEF@pos.int.mindvision.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-16561-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <AC582FE38EBCDC44BCAC55FE8C1C3C1131ACEF@pos.int.mindvision.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Frank Clatterbaugh <frank@esellerate.net>
Cc: reiserfs-list@namesys.com

you forget to run ./prepare before ./configure
read README carefully please, I met same problem as you yesterday.

> Hi all,
>
>
>
> I hope it's ok to write to the group. I'm planning on installing reiser
> 4.0 and am getting the following error compiling libaal on a
>
> Redhat  Version 7.2 system.
>
>
>
> Any ideas ?
>
>
>
>
>
>
>
>
>
> #./make
>
> cd . \
>
>   && CONFIG_FILES= CONFIG_HEADERS=config.h \
>
>      /bin/sh ./config.status
>
> config.status: creating config.h
>
> make  all-recursive
>
> make[1]: Entering directory `/root/libaal-0.4.15'
>
> Making all in src
>
> make[2]: Entering directory `/root/libaal-0.4.15/src'
>
> source='device.c' object='libaal_la-device.lo' libtool=yes \
>
> depfile='.deps/libaal_la-device.Plo'
> tmpdepfile='.deps/libaal_la-device.TPlo' \
>
> depmode=none /bin/sh ../depcomp \
>
> /bin/sh ../libtool --mode=compile gcc -DHAVE_CONFIG_H -I. -I. -I..
> -I../include   -D_REENTRANT -D_FILE_OFFSET_BITS=64 -O0 -g -W -Wall
> -Wno-unused-parameter -Wredundant-decls -c -o libaal_la-device.lo `test
> -f device.c || echo './'`device.c
>
> ../depcomp: ../depcomp: No such file or directory
>
> make[2]: *** [libaal_la-device.lo] Error 127
>
> make[2]: Leaving directory `/root/libaal-0.4.15/src'
>
> make[1]: *** [all-recursive] Error 1
>
> make[1]: Leaving directory `/root/libaal-0.4.15'
>
> make: *** [all] Error 2
>
>


-- 
HK Celtic Orchestra leader and coordanator: Thomas Graham Lau
Phone number: 852-93239670    (24hours a day, 7days a week non-stop phone)
Web site: http://sml.dyndns.org
Email: lkthomas@sml.dyndns.org
