From: Piotr Sawuk <a9702387@unet.univie.ac.at>
Subject: Reiser4 oops
Date: Thu, 02 Jul 2009 10:34:32 +0200
Message-ID: <4A4C7118.1080505@unet.univie.ac.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=unet.univie.ac.at; s=rev1; h=Message-ID:Date:From:MIME-Version:
	To:Subject:Content-Type:Content-Transfer-Encoding; bh=XtsD9QoQw1
	Jiws87BChbOg7llM1ycR9Igq/6iZX9er4=; b=IcxdSRxV5BqDQkKF/ncaNuKgK8
	D+rMJiSKepDEGg3VMTm2HJbUyjo49UdaoLzqTKFYoTHRT0GGTrCCXcq2x2EB98QP
	gK6avrlRNv7yyCZ+Vgdk5ofgoCk6aec4ktUNZKutuYMMRPwDPHnEzPqjtYSi0oyJ
	TKsfj9m/hSp79ax9g=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs devel <reiserfs-devel@vger.kernel.org>

I'm running 2.6.28.8, so it's old. and it's not reproducible.
as can be seen below, hdc5 is my reiser4 drive. it did not
show any errors in fsck on the next boot. SMP is turned on,
but I did only use a single processor at that time. does this
problem sound familiar to anyone? is it already fixed in 2.6.30?

while compiling mozilla I got the following (and I hope the
ps ax snippet will also help):

klogd[1353]: segfault at 4 ip 0804afb3 sp bfa8eff4 error 4 in klogd[8048000+5000]
BUG: unable to handle kernel NULL pointer dereference at 00000028
IP: [<c01fd1f4>] search_one_bitmap_forward+0x54/0x190
*pde = 00000000
Oops: 0000 [#1] SMP
last sysfs file: /sys/power/state
Modules linked in: evdev psmouse 3c59x mii 8250 serial_core button processor 
thermal_sys w83627hf hwmon_vid hid_logitech i2c_amd756 usbhid ff_memless 
i2c_core hid joydev ohci_hcd ehci_hcd usbcore vfat fat
...
Pid: 1714, comm: ktxnmgrd:hdc5:r Not tainted (2.6.28.8-Reiser4 #3) MS-6501
EIP: 0060:[<c01fd1f4>] EFLAGS: 00010246 CPU: 0
EIP is at search_one_bitmap_forward+0x54/0x190
EAX: 00000000 EBX: 00000001 ECX: e0cfc340 EDX: e0cfc340
ESI: 00000000 EDI: df3d3cfc EBP: df3d3cfc ESP: df3d3ca4
...
Process ktxnmgrd:hdc5:r (pid: 1714, ti=df3d2000 task=df9bb2a0 task.ti=df3d2000)
Stack:
  dba1c004 df3d3cfc e0cfc340 00000000 dba1c000 0000001a 00000000 df3d3cfc
  00000001 c01fd3d0 00007fe0 00000001 00000001 df3d3d38 00007fe0 061c9e6f
  00000000 00000c3c 00000000 0000001a 00000000 000025f0 00000000 df3d3d30
Call Trace:
  [<c01fd3d0>] bitmap_alloc_forward+0xa0/0x130
  [<c01fd634>] reiser4_alloc_blocks_bitmap+0x1d4/0x360
  [<c02aa778>] ide_intr+0xd8/0x1f0
  [<c01da07e>] plugin_by_unsafe_id+0x1e/0xf0
  [<c01fc060>] item_body_by_coord_hard+0x10/0x20
  [<c01f3286>] internal_at+0x16/0x20
  [<c01c697e>] reiser4_grab+0xbe/0x100
  [<c01c70ae>] reiser4_alloc_blocks+0x7e/0x240
  [<c01cc44d>] allocate_znode_update+0x8d/0x250
  [<c01c6688>] grabbed2free+0x28/0x50
  [<c01bd6f7>] jload_gfp+0x77/0x140
  [<c01cc667>] allocate_znode+0x57/0x210
  [<c01cdd11>] flush_current_atom+0x931/0xa70
  [<c01c92b0>] reiser4_txn_end+0x190/0x510
  [<c01c9638>] reiser4_txn_restart+0x8/0x20
  [<c01c9a7e>] commit_some_atoms+0xfe/0x130
  [<c01d35ac>] ktxnmgrd+0x14c/0x190
  [<c01d3460>] ktxnmgrd+0x0/0x190
  [<c01375e2>] kthread+0x42/0x70
  [<c01375a0>] kthread+0x0/0x70
  [<c0104977>] kernel_thread_helper+0x7/0x10
Code: 24 08 8b 11 01 d0 89 44 24 08 e8 38 f8 ff ff 85 c0 89 44 24 0c 0f 85 d9 00 
00 00 8b 4c 24 08 8b 6c 24 04 bb 01 00 00 00 8b 41 10 <8b> 40 28 89 44 24 10 8b 
45 00 8b 49 18 39 c8 0f 87 1c 01 00 00
EIP: [<c01fd1f4>] search_one_bitmap_forward+0x54/0x190 SS:ESP 0068:df3d3ca4
---[ end trace 02e256bdb2bc00ba ]---


   PID TTY      STAT   TIME COMMAND
     1 ?        Ss     0:00 init [3]
     2 ?        S<     0:00 [kthreadd]
     3 ?        S<     0:00 [migration/0]
     4 ?        S<     0:00 [ksoftirqd/0]
     5 ?        S<     0:00 [events/0]
     6 ?        S<     0:00 [khelper]
     9 ?        S<     0:00 [kstop/0]
    53 ?        S<     0:00 [kintegrityd/0]
    54 ?        S<     0:00 [kblockd/0]
    56 ?        S<     0:00 [kacpid]
    57 ?        S<     0:00 [kacpi_notify]
   112 ?        S<     0:00 [kseriod]
   163 ?        S      0:00 [pdflush]
   164 ?        S      0:00 [pdflush]
   165 ?        S<     0:01 [kswapd0]
   208 ?        S<     0:00 [aio/0]
   932 ?        S<     0:00 [ksuspend_usbd]
   947 ?        S<     0:00 [khubd]
  1057 ?        S<     0:00 [hid_compat]
[...]
  1411 ?        S<     0:00 [kpsmoused]
[...]
  1675 tty3     Ss+    0:00 /sbin/agetty 38400 tty3 linux
  1676 tty4     Ss+    0:00 /sbin/agetty 38400 tty4 linux
  1677 tty5     Ss+    0:00 /sbin/agetty 38400 tty5 linux
  1678 tty6     Ss+    0:00 /sbin/agetty 38400 tty6 linux
  1715 ?        S<     0:00 [ent:hdc5.]
22056 tty1     S+     0:00 make
22768 tty1     S+     0:00 /usr/bin/make tier_9
22771 tty1     S+     0:00 /bin/sh -c set -e;   for d in [...]  accessible; do 
  if test ! -f $d/Makefile; then  /usr/bin/perl ./build/autoconf/make-makefile 
-t . -d .  $d/Makefile;  fi;  /usr/bin/make -C $d export;  done ;  for d in 
[...]  accessible; do   /usr/bin/make -C $d libs;  done
26765 tty1     S+     0:00 /usr/bin/make -C editor libs
26767 tty1     S+     0:00 /bin/sh -c set -e;  for d in public idl txtsvc 
libeditor txmgr composer; do  /usr/bin/make -C $d libs; done
26849 tty1     S+     0:00 /usr/bin/make -C libeditor libs
26851 tty1     S+     0:00 /bin/sh -c set -e;  for d in base text html build; do 
  /usr/bin/make -C $d libs; done
26852 tty1     S+     0:00 /usr/bin/make -C base libs
26855 tty1     S+     0:00 c++ -o nsEditor.o -c [...] -O9 -mtune=athlon-mp 
-march=athlon -fshort-wchar -pthread -pipe -DDEBUG -D_DEBUG -DDEBUG_root 
-DTRACING -g -fno-inline -O -I/usr/X11R6/include -DMOZILLA_CLIENT -include 
../../../mozilla-config.h -Wp,-MD,.deps/nsEditor.pp nsEditor.cpp
26856 tty1     D+     0:10 /usr/lib/gcc/i686-pc-linux-gnu/4.1.2/cc1plus -quiet 
[...] nsEditor.cpp -mtune=athlon-mp -march=athlon -auxbase-strip nsEditor.o -g 
-O9 -O [...] -o -
26857 tty1     D+     0:00 
/usr/lib/gcc/i686-pc-linux-gnu/4.1.2/../../../../i686-pc-linux-gnu/bin/as -Qy -o 
nsEditor.o -

P
