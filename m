From: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Subject: Re: Calling stat with millions of files
Date: Tue, 8 Jun 2004 22:29:36 +0200
Message-ID: <200406082229.36625.henning-04@die.informatik.uni-siegen.de>
References: <Pine.LNX.4.58.0406071735290.30177@localhost.localdomain> <1086721127.20554.24.camel@ipso.snappymail.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19102-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1086721127.20554.24.camel@ipso.snappymail.ca>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Am Dienstag, 8. Juni 2004 20:58 schrieb Mike Benoit:
> I'm currently using the "Rsync Snapshot"
>
> http://www.mikerubel.org/computers/rsync_snapshots/
>
> backup method with a 340Gb RAID5 array on a PIII-800 with 256mb RAM.
> Currently used is about 200gb in 68 million files. I would guess over
> 75% are hard links.
>
> My mount options are: notail,noatime,nodiratime
> Kernel: 2.6.3-7mdk
>
> The Performance I'm seeing is pretty good, I don't have any complaints.

I'm using the same backup method like Mike. The machine is a 2.5 GHz P4 with 
Suse kernel 2.4.20, and a Raid5 array filled with ~100 GB data. 

A "ls -lR" on the oldest snapshot (150000 files) needs 2m40s, probably because 
i use no special mount options, and the data in this directory is from four 
different machines. 
But otherwise i'm satisfied with the performance of reiserfs. So i think there 
must been a other problem with your system.

Best regards,

Henning
