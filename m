From: Mike Benoit <mikeb@netnation.com>
Subject: Re: Reiser4 input/output errors...
Date: Thu, 04 Sep 2003 12:52:39 -0700
Message-ID: <1062705159.4903.6.camel@mikeb.staff.netnation.com>
References: <1062453181.2791.17.camel@mikeb.staff.netnation.com>
	 <1062479004.31361.3.camel@haron.namesys.com>
	 <1062521517.1987.5.camel@mikeb.staff.netnation.com>
	 <1062567211.2107.14.camel@haron.namesys.com>
	 <1062603920.3148.125.camel@mikeb.staff.netnation.com>
	 <1062651147.16134.1.camel@haron.namesys.com>
Reply-To: mikeb@netnation.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15561-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1062651147.16134.1.camel@haron.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Yury Umanets <umka@namesys.com>
Cc: reiserfs-list@namesys.com

[root@mikeb root]# debugfs.reiser4 -t /dev/hda8
debugfs.reiser4 0.4.12
Copyright (C) 2001, 2002, 2003 by Hans Reiser, licensing governed by
reiser4progs/COPYING.

NODE (21) LEVEL=2 ITEMS=1 SPACE=4020 MKFS=0x103e447b
FLUSH=0x4001b90100000000
(0) NODEPTR PLUGIN=nodeptr40 LEN=8, KEY=[29:1:0:2a:0:SD] UNITS=1
[22]

NODE (22) LEVEL=1 ITEMS=2 SPACE=3838 MKFS=0x103e447b
FLUSH=0xbfffe57800000000
(0) STATDATA PLUGIN=stat40 LEN=48, KEY=[29:1:0:2a:0:SD] UNITS=1
exts:           2
mask:           0x3
plugin:         sdext_lw
offset:         2
len:            14
mode:           drwxr-xr-x
nlink:          3
size:           2
plugin:         sdext_unix
offset:         16
len:            32
uid:            0
gid:            0
atime:          Tue Sep  2 09:39:26 2003
mtime:          Tue Sep  2 09:39:26 2003
ctime:          Tue Sep  2 09:39:26 2003
rdev:           0
bytes:          100
(1) CDE PLUGIN=cde_large LEN=102, KEY=[2a:0:0:0:0:NAME] UNITS=2
NR  NAME              OFFSET HASH                              SDKEY
------------------------------------------------------------------------------
  0 .                     54 0000000000000000:0000000000000000
0000291:000002a
  1 ..                    78 002e2e0000000000:0000000000000000
0000291:000002a


Let me know if you need any more information. I'm also on IRC during PST
business hours, if that would be better for you to debug this issue.

On Wed, 2003-09-03 at 21:52, Yury Umanets wrote:
> On Wed, 2003-09-03 at 19:45, Mike Benoit wrote:
> 
> > > Can you run debugfs.reiser4 on /dev/hda8? What does it say?
> > > 
> 
> Can you print the tree?
> 
> debugfs.reiser4 -t /dev/hda8?
> 
-- 
Best Regards,
 
Mike Benoit
NetNation Communications Inc.
Systems Engineer
Tel: 604-684-6892 or 888-983-6600
 ---------------------------------------
 
 Disclaimer: Opinions expressed here are my own and not 
 necessarily those of my employer

