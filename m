From: Domenico Andreoli <cavok@tiscali.it>
Subject: Re: can't find a reiserfs file ssytem!
Date: Fri, 19 Mar 2004 13:30:08 +0100
Sender: Domenico Andreoli <cavok@libero.it>
Message-ID: <20040319123008.GA30618@raptus.homelinux.org>
References: <20040317004935.565332B2B57@ws5-7.us4.outblaze.com> <200403171948.28885.Dieter.Nuetzel@hamburg.de> <20040318115900.GA19944@raptus.homelinux.org> <200403191451.43084.vitaly@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="FL5UXtIhxfXey3p5"
Return-path: <reiserfs-list-return-17317-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200403191451.43084.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Vitaly,

On Fri, Mar 19, 2004 at 02:51:43PM +0300, Vitaly Fertman wrote:
> On Thursday 18 March 2004 14:59, Domenico Andreoli wrote:
> > On Wed, Mar 17, 2004 at 07:48:28PM +0100, Dieter N?tzel wrote:
> > > E.g. when will we see 3.6.14 (even for RAID)?
> >
> > i'm also interested in a quick release of 3.6.14, if it has any important
> > fix. debian is near to the freeze of new distribution and i'd like it
> > had the most recent and hopefully fixed releases.
> 
> As you can see already 3.6.14 has very important fix for the journal
> replay and 3.6.15-pre1 has a fix in the mount entry detection code.

i just uploaded the new package for 3.6.14, as soon as 3.6.15 is released
i'll package it as well. thanks.

BTW, some debian autobuilders have already made their binary
packages. i'm seeing that ia64 and alpha, the only 64 bit builders of
which i've the logs [0], have the following warnings:

   make[2]: Entering directory `/build/buildd/reiserfsprogs-3.6.14/lib'
   if gcc -DHAVE_CONFIG_H -I. -I. -I../include     -g -O2 -Wall -MT io.o -MD -MP -MF ".deps/io.Tpo" \
     -c -o io.o `test -f 'io.c' || echo './'`io.c; \
   then mv -f ".deps/io.Tpo" ".deps/io.Po"; \
   else rm -f ".deps/io.Tpo"; exit 1; \
   fi
   io.c: In function `do_fsck_rollback':
   io.c:743: warning: long long int format, loff_t arg (arg 4)
   io.c:743: warning: long long int format, dev_t arg (arg 5)
   ...

is everything under control here?

i've also attached patches to configure.in in order to not let
builders mess with autotool stuff. i'm using them to make debian source
packages. please consider applying them to your source trees.

thanks
domenico

[0] full logs are available at http://buildd.debian.org/build.php?pkg=reiserfsprogs

-----[ Domenico Andreoli, aka cavok
 --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="reiserfsprogs.configure.in.patch"

Index: configure.in
===================================================================
RCS file: /cvsroot/pkg-reiser/debian/reiserfsprogs/configure.in,v
retrieving revision 1.1.1.4
retrieving revision 1.2
diff -u -r1.1.1.4 -r1.2
--- configure.in	18 Mar 2004 19:36:53 -0000	1.1.1.4
+++ configure.in	19 Mar 2004 12:08:50 -0000	1.2
@@ -4,6 +4,7 @@
 AH_TEMPLATE([HAVE_LIBUUID], [Define for enable libuuid using.])
 
 AM_INIT_AUTOMAKE(reiserfsprogs, 3.6.14)
+AM_MAINTAINER_MODE
 
 dnl We install in /sbin, the utils are to be available on boot
 dnl AC_PREFIX(/)

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="libaal.configure.in.patch"

Index: configure.in
===================================================================
RCS file: /cvsroot/pkg-reiser/debian/libaal/configure.in,v
retrieving revision 1.1.1.2
retrieving revision 1.3
diff -u -r1.1.1.2 -r1.3
--- configure.in	6 Feb 2004 09:57:44 -0000	1.1.1.2
+++ configure.in	19 Mar 2004 12:06:53 -0000	1.3
@@ -38,6 +38,7 @@
 
 AM_INIT_AUTOMAKE($PACKAGE, $VERSION)
 AM_CONFIG_HEADER(config.h)
+AM_MAINTAINER_MODE
 
 AC_DEFINE_UNQUOTED(LIBAAL_MAX_INTERFACE_VERSION, $LIBAAL_BINARY_AGE)
 AC_DEFINE_UNQUOTED(LIBAAL_MIN_INTERFACE_VERSION, $LIBAAL_INTERFACE_AGE)

--FL5UXtIhxfXey3p5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="reiser4progs.configure.in.patch"

Index: configure.in
===================================================================
RCS file: /cvsroot/pkg-reiser/debian/reiser4progs/configure.in,v
retrieving revision 1.1.1.3
retrieving revision 1.4
diff -u -r1.1.1.3 -r1.4
--- configure.in	20 Feb 2004 13:45:43 -0000	1.1.1.3
+++ configure.in	19 Mar 2004 12:05:16 -0000	1.4
@@ -37,6 +37,7 @@
 
 AM_INIT_AUTOMAKE($PACKAGE, $VERSION)
 AM_CONFIG_HEADER(config.h)
+AM_MAINTAINER_MODE
 
 AC_DEFINE_UNQUOTED(LIBREISER4_MAX_INTERFACE_VERSION, $LIBREISER4_BINARY_AGE)
 AC_DEFINE_UNQUOTED(LIBREISER4_MIN_INTERFACE_VERSION, $LIBREISER4_INTERFACE_AGE)

--FL5UXtIhxfXey3p5--
