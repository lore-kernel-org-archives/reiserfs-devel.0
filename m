From: jared@roberts.org
Subject: issues with sync/remount, loopback
Date: Sat, 09 Aug 2003 11:52:00 -0700 (PDT)
Message-ID: <20030809115202.2685.h009.c000.wm@mail.roberts.org.criticalpath.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15269-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I'm having a couple of problems with reiser4.  I got
the 2.5 kernel tree and reiser4 source from bk on the
2nd-- although it didn't compile until I applied the
patch posted by pillars.NET.  I just pulled and built
again, this time with -test3 and I'm still experiencing
the same problems.

On startup, when the initscript tries to remount from
ro to rw, reiser4 starts printing out "flushing like
mad..." and counting powers of two.  I "solved" this by
setting rootflags in the kernel to mount / rw on boot,
and took out the remount from my startup script.  This
works, but then on shutdown, the same problem happens. 
Looked like it was looping during sync.

There are also some programs that consistantly do weird
things-- apt-get always freezes in the same place, (ps
lists it in state "D", and it won't die even with kill
-9).  Once one process has hung, others start-- even a
"ps aux" will get stuck in uninterruptable sleep!

The motherboard is an asus a7v600, I belive DMA is on. 
The harddrive in question is 200 bogogigs, and reiser4
is on the last 60 bogogigs or so (ie: past the 28-bit
addressing barrier).  Let me know if you need more
details on anything.

Another issue which is probably known, but I didn't see
a bugtracker to check: loopback doesn't work at all in
reiser4.  I just get an "Invalid argument" or some such
on the loop ioctl.  I tested loopback on the same
kernel with a floppy image on my ext2 boot partition
and it worked fine.  I also tried both my system
losetup (util-linux 2.11z I believe), and a
locally-built 2.12pre from kernel.org-- same problem.

Everything above was with an 8/2 pull of
-test2+reiser4.  Just now I tried again with -test3.  I
didn't try remounting on boot, 'cus I'm afraid if it
doesn't work I won't be able to boot at all, but I did
see the same problem on shutdown.  I also saw that
loopback was still broken.  I didn't try the
reliably-failing apt-get test, but I can try that too
if you want another datapoint.

--Jared
