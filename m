From: David Bernick <bernz@alpha.bernztech.org>
Subject: slow stat() ?
Date: Mon, 1 Dec 2003 12:21:47 -0500 (EST)
Message-ID: <Pine.LNX.4.10.10312011155090.7555-100000@alpha.bernztech.org>
References: <3FCB6597.8010604@gmx.net>
Reply-To: bernz@bernztech.org
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16192-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3FCB6597.8010604@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com


Hi all,

First, what I'm running Reiser on:

Supermicro dual Xeon motherboard with 2x2.6Ghz xeons in hyperthreaded
mode. 3ware 7500-8 (or whatever the call the 8 port ATA card) with 8x250GB
disks attatched. 4GB RAM. 

Software: 
RedHat 9 with latest up2date
Kernel 2.4.22 no patches
The journal is not on a separate set of spindles.

/proc/sys/vm/max-readahead=512
/proc/sys/vm/min-readahead=128
/proc/sys/vm/bdflush
100     5000    640     2560    150     30000   60      20      0

Okay. Now for the issue at hand. When the logical disk is being read from,
reiser is fast and effecient. We have millions (10M?) of files (about 1M
each) in thousands of directories. Reiser reads well (exporting the disk
over NFS) and we're very impressed by it. It's a bit slow on the writes
and the system load goes up marginally, but that's not a big deal. The
thing that puzzles me is that when we perform functions like "find" or in
perl "-e filename" or anything that uses fstat() or stat64() or any of
those functions brings the system usage to 100% and the load climbs
quickly. 

Are there any patches, kernel updates, tuning, etc that can help with this
problem?

thanks for any help you can give me.

dave

