From: Levent Serinol <lserinol@gmail.com>
Subject: mkfs.reiser4 bus error on sparc64
Date: Mon, 24 May 2004 16:51:09 +0300
Message-ID: <2c1942a7040524065133e61534@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18828-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, Nikita Danilov <nikita@namesys.com>

morphou reiser4progs-0.5.3 # gdb /usr/local/sbin/mkfs.reiser4
GNU gdb 6.0
Copyright 2003 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "sparc-unknown-linux-gnu"...Using host
libthread_db library "/lib/libthread_db.so.1".

(gdb) set args /dev/hda5
(gdb) r
Starting program: /usr/local/sbin/mkfs.reiser4 /dev/hda5
/usr/local/sbin/mkfs.reiser4 0.5.3
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing
governed by reiser4progs/COPYING.

Block size 8192 will be used.
Linux 2.6.6-mm2 is detected.
Uuid 224dba85-fc0b-4db7-a126-5a7a6163cb0b will be used.
Reiser4 is going to be created on /dev/hda5.
(Yes/No): Yes
Creating reiser4 on /dev/hda5...
Program received signal SIGBUS, Bus error.
0x7009aa54 in cde40_insert_units (place=0xefffdb78, hint=0xefffe050)
at cde40.c:768
768                     ha_set_ordering(entry, ord, pol);
(gdb) bt full
#0  0x7009aa54 in cde40_insert_units (place=0xefffdb78,
hint=0xefffe050) at cde40.c:768
        off = 17293782402568881536
        ord = 0
        hash = (reiser4_key_t *) 0xefffe158
        objid = (void *) 0x4e5b0
        oid = 10470042052
        object = (reiser4_key_t *) 0x700e67e8
        entry = (void *) 0x4e596
        pol = 4
        i = 0
        offset = 28
        entry_hint = (entry_hint_t *) 0xefffe100
#1  0x700890cc in node40_modify (entity=0x50580, pos=0x35d00,
hint=0xefffe050, modify_func=0x7009a630 <cde40_insert_units>)
    at node40.c:631
        ih = (void *) 0x50552
        res = 0
        pol = 4
        len = 52
        write = 8074533261320020944
        place = {pos = {item = 0, unit = 0}, node = 0x50580, body =
0x4e594, len = 52, flags = 0, key = {plug = 0x70105e0c,
    body = {11529777996021891072, 0, 0, 0}, adjust = 1}, plug = 0x70106828}
#2  0x700892ec in node40_insert (entity=0x50580, pos=0x35d00,
hint=0xefffe050) at node40.c:655
        ins_func = 0x50552
(gdb)





Linux morphou 2.6.6-mm2 #6 Sat May 22 12:03:51 EEST 2004 sparc64 sun4u
TI UltraSparc IIi (Sabre) GNU/Linux

Reading specs from /usr/lib/gcc-lib/sparc-unknown-linux-gnu/3.2.3/specs
Configured with:
/var/tmp/portage/gcc-3.2.3-r2/work/gcc-3.2.3/configure --prefix=/usr
--bindir=/usr/sparc-unknown-linux-gnu/gcc-bin/3.2
--includedir=/usr/lib/gcc-lib/sparc-unknown-linux-gnu/3.2.3/include
--datadir=/usr/share/gcc-data/sparc-unknown-linux-gnu/3.2
--mandir=/usr/share/gcc-data/sparc-unknown-linux-gnu/3.2/man
--infodir=/usr/share/gcc-data/sparc-unknown-linux-gnu/3.2/info
--enable-shared --host=sparc-unknown-linux-gnu
--target=sparc-unknown-linux-gnu --with-system-zlib
--enable-languages=c,c++,f77,objc --enable-threads=posix
--enable-long-long --disable-checking --enable-cstdio=stdio
--enable-clocale=generic --enable-__cxa_atexit
--enable-version-specific-runtime-libs
--with-gxx-include-dir=/usr/lib/gcc-lib/sparc-unknown-linux-gnu/3.2.3/include/g++-v3
--with-local-prefix=/usr/local --enable-shared --enable-nls
--without-included-gettext
Thread model: posix
gcc version 3.2.3 20030422 (Gentoo Linux 1.4 3.2.3-r2, propolice)
