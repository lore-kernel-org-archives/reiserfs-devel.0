From: Paul Slootman <paul@debian.org>
Subject: mkreiser4: "Fatal: The partition size is too big."
Date: Fri, 15 Jul 2005 17:18:22 +0200
Message-ID: <20050715151822.GA30521@wurtel.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-25137-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

(Please CC: me on responses, I'm not on the list.)

I wanten to try out reiser4 on our new AMD64 system (with plenty of
SATA disks connected via 3ware controllers), however it failed with the 
following output:

satazilla:~# mkreiser4 /dev/md11
mkreiser4 1.0.4
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by reiser4progs/COPYING. 

Block size 4096 will be used.
Linux 2.6.12.2.raid0fixreiser4 is detected.
Uuid 443fabae-72ca-4d83-901f-37b8b9d30518 will be used.
Fatal: The partition size is too big.


From /proc/mdstat :

md11 : active raid5 sdc[0] sdm[10] sdl[9] sdk[8] sdj[7] sdi[6] sdh[5] sdg[4] sdf[3] sde[2] sdd[1]
      3906139520 blocks level 5, 64k chunk, algorithm 2 [11/11] [UUUUUUUUUUU]

OK, so it's almost 4TB...

Version 1.04 is used for libaal and reiser4progs.


I tried the patch from
http://marc.theaimsgroup.com/?l=reiserfs&m=111763015001953&w=2
and it worked; this is just a message to confirm that the patch is
indeed necessary :) It deed seem to take longer to complete (and to
flush to disk) than v3. However, that's not very relevant...


Paul Slootman
