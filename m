From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: can't find a reiserfs file ssytem!
Date: Fri, 19 Mar 2004 22:07:43 +0300
Message-ID: <200403192207.43724.vitaly@namesys.com>
References: <20040317004935.565332B2B57@ws5-7.us4.outblaze.com> <200403191451.43084.vitaly@namesys.com> <20040319123008.GA30618@raptus.homelinux.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17333-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040319123008.GA30618@raptus.homelinux.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Domenico Andreoli <cavok@tiscali.it>, reiserfs-list@namesys.com

On Friday 19 March 2004 15:30, Domenico Andreoli wrote:
> Hello Vitaly,
>
> On Fri, Mar 19, 2004 at 02:51:43PM +0300, Vitaly Fertman wrote:
> > On Thursday 18 March 2004 14:59, Domenico Andreoli wrote:
> > > On Wed, Mar 17, 2004 at 07:48:28PM +0100, Dieter N?tzel wrote:
> > > > E.g. when will we see 3.6.14 (even for RAID)?
> > >
> > > i'm also interested in a quick release of 3.6.14, if it has any
> > > important fix. debian is near to the freeze of new distribution and i'd
> > > like it had the most recent and hopefully fixed releases.
> >
> > As you can see already 3.6.14 has very important fix for the journal
> > replay and 3.6.15-pre1 has a fix in the mount entry detection code.
>
> i just uploaded the new package for 3.6.14, as soon as 3.6.15 is released
> i'll package it as well. thanks.
>
> BTW, some debian autobuilders have already made their binary
> packages. i'm seeing that ia64 and alpha, the only 64 bit builders of
> which i've the logs [0], have the following warnings:
>
>    make[2]: Entering directory `/build/buildd/reiserfsprogs-3.6.14/lib'
>    if gcc -DHAVE_CONFIG_H -I. -I. -I../include     -g -O2 -Wall -MT io.o
> -MD -MP -MF ".deps/io.Tpo" \ -c -o io.o `test -f 'io.c' || echo './'`io.c;
> \
>    then mv -f ".deps/io.Tpo" ".deps/io.Po"; \
>    else rm -f ".deps/io.Tpo"; exit 1; \
>    fi
>    io.c: In function `do_fsck_rollback':
>    io.c:743: warning: long long int format, loff_t arg (arg 4)
>    io.c:743: warning: long long int format, dev_t arg (arg 5)
>    ...

I am checking it now. anyway do_fsck_rollback is for internal
fsck testing, you do not use it, so nothing improtant here.

> is everything under control here?
>
> i've also attached patches to configure.in in order to not let
> builders mess with autotool stuff. i'm using them to make debian source
> packages. please consider applying them to your source trees.

ok, thank you.

> thanks
> domenico
>
> [0] full logs are available at
> http://buildd.debian.org/build.php?pkg=reiserfsprogs
>
> -----[ Domenico Andreoli, aka cavok
>  --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
>    ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50

-- 
Thanks,
Vitaly Fertman
