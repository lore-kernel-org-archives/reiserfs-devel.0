From: Domenico Andreoli <cavok@tiscali.it>
Subject: Bug#289747: reiser4progs: mkfs.reiser4 is broken on sparc64
Date: Thu, 13 Jan 2005 14:19:29 +0100
Message-ID: <20050113131929.GA15770@raptus.dandreoli.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23132-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: 289747@bugs.debian.org

hi,

  i received a bug report against reiser4progs 1.0.3-1 debian
package. i'm able to reproduce it on a UltraSparc IIi i can use to do
some testing.

tell me if i can be of help in ironing the bug.

cheers
domenico


$ dd if=/dev/zero of=/tmp/reiser4.fuckup bs=1M count=100
$ gdb /sbin/mkfs.reiser4                    
GNU gdb 6.3-debian
Copyright 2004 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "sparc-linux"...Using host libthread_db library "/lib/libthread_db.so.1".

(gdb) set args -f /tmp/reiser4.fuckup
(gdb) r
Starting program: /sbin/mkfs.reiser4 -f /tmp/reiser4.fuckup
/sbin/mkfs.reiser4 1.0.3
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by reiser4progs/COPYING. 

Block size 8192 will be used.
Linux 2.4.26-sparc64 is detected.
Uuid 51d06fc7-ea17-4ef1-ae6d-0b7f2b9d50f5 will be used.
Reiser4 is going to be created on /tmp/reiser4.fuckup.
(Yes/No): yes
Creating reiser4 on /tmp/reiser4.fuckup ...
Program received signal SIGBUS, Bus error.
0x00063d20 in cde40_insert_units (place=0xefff9798, hint=0xefffbd28) at cde40.c:761
761                     ha_set_ordering(entry, ord, pol);
(gdb) bt
#0  0x00063d20 in cde40_insert_units (place=0xefff9798, hint=0xefffbd28) at cde40.c:761
#1  0x00052d04 in node40_modify (entity=0xc6d48, pos=0xc6bd8, hint=0xefffbd28, modify_func=0x639e4 <cde40_insert_units>) at node40.c:637
#2  0x00052e24 in node40_insert (entity=0xc6d48, pos=0xc6bd8, hint=0xefffbd28) at node40.c:661
#3  0x00094b74 in cb_node_insert (node=0xc6d48, pos=0xc6bd8, hint=0xefffbd28) at node.c:440
#4  0x00094ae8 in reiser4_node_modify (node=0xc6d48, pos=0xc6bd8, hint=0xefffbd28, modify_func=0x94b40 <cb_node_insert>) at node.c:433
#5  0x0001e4a0 in reiser4_tree_modify (tree=0xc68f0, place=0xc6bd8, hint=0xefffbd28, level=1 '\001', estimate_func=0x1e100 <cb_prep_insert>, modify_func=0x94b40 <cb_node_insert>) at tree.c:2866
#6  0x0001e8d4 in reiser4_tree_insert (tree=0xc68f0, place=0xc6bd8, hint=0xefffbd28, level=1 '\001') at tree.c:2959
#7  0x00013798 in tree_insert (tree=0xc68f0, place=0xc6bd8, hint=0xefffbd28, level=1 '\001') at libreiser4.c:41
#8  0x000983f4 in obj40_insert (obj=0xc6ac8, place=0xc6bd8, hint=0xefffbd28, level=1 '\001') at obj40.c:657
#9  0x000845b8 in dir40_create (hint=0xefffbeb8) at dir40.c:527
#10 0x00020fcc in reiser4_object_create (entry=0xefffbfd8, hint=0xefffbeb8) at object.c:425
#11 0x0001165c in reiser4_root_create (fs=0xc5e18) at mkfs.c:99
#12 0x0001339c in main (argc=3, argv=0xeffff5c4) at mkfs.c:467
(gdb) 


-----[ Domenico Andreoli, aka cavok
 --[ http://people.debian.org/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
