From: Chris Mason <mason@suse.com>
Subject: Re: slow stat() ?
Date: Mon, 01 Dec 2003 12:30:46 -0500
Message-ID: <1070299845.12809.98.camel@tiny.suse.com>
References: <Pine.LNX.4.10.10312011155090.7555-100000@alpha.bernztech.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16193-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.10.10312011155090.7555-100000@alpha.bernztech.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: bernz@bernztech.org
Cc: reiserfs-list@namesys.com

On Mon, 2003-12-01 at 12:21, David Bernick wrote:
> Hi all,
> 
> First, what I'm running Reiser on:
> 
> Supermicro dual Xeon motherboard with 2x2.6Ghz xeons in hyperthreaded
> mode. 3ware 7500-8 (or whatever the call the 8 port ATA card) with 8x250GB
> disks attatched. 4GB RAM. 
> 
> Software: 
> RedHat 9 with latest up2date
> Kernel 2.4.22 no patches
> The journal is not on a separate set of spindles.
> 
> /proc/sys/vm/max-readahead=512
> /proc/sys/vm/min-readahead=128
> /proc/sys/vm/bdflush
> 100     5000    640     2560    150     30000   60      20      0
> 
> Okay. Now for the issue at hand. When the logical disk is being read from,
> reiser is fast and effecient. We have millions (10M?) of files (about 1M
> each) in thousands of directories. Reiser reads well (exporting the disk
> over NFS) and we're very impressed by it. It's a bit slow on the writes
> and the system load goes up marginally, but that's not a big deal. The
> thing that puzzles me is that when we perform functions like "find" or in
> perl "-e filename" or anything that uses fstat() or stat64() or any of
> those functions brings the system usage to 100% and the load climbs
> quickly. 
> 
> Are there any patches, kernel updates, tuning, etc that can help with this
> problem?

You could boot with profile=2 and send the results of a readprofile
command taken after the system load goes very high.  This will slow down
your box for general usage, so you would only want to run with profile=2
for a short time.

My guess is the stats are being done across a large directory tree and
this is generating lots of atime updates.  You could mount -o
noatime,nodiratime, which will reduce the amount of work reiserfs does
on each stat.

atimes are used by many mail programs to find out the last time you read
your mailbox file.  nodiratime probably won't affect most applications.

-chris


