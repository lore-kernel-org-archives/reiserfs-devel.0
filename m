From: "JP Howard" <jh_lists@fastmail.fm>
Subject: Re: back up to disk
Date: Tue, 15 Oct 2002 22:42:13 UT
Message-ID: <20021015224213.4BBAA1AEC13E@server5.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11704-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Russell Coker <bofh@coker.com.au>, ReiserFS List <reiserfs-list@namesys.com>

On Tue, 15 Oct 2002 23:05:44 +0200, "Russell Coker"
<bofh@coker.com.au> said:
> Here's an interesting article I just read.  It's just a device with a
> bunch of ATA drives inside, up to 2T of storage.  Probably anyone here
> could produce something based on ReiserFS to compete with it...
>
> Storage start-up Avamar Technologies is launching an appliance this
> week that it claims backs up network data more quickly and less
> expensively than tape.
> http://www.nwfusion.com/news/2002/1014avamar.html?net
>
We've been thinking about something like that, using this extremely nifty
trick:

http://www.mikerubel.org/computers/rsync_snapshots/

Back in the old days (i.e. last week) when we were planning around Ext3,
we were thinking of combining it with this product:

http://www.shaolinmicro.com/product/cogofs/index.php

The two combined, with ATA RAID, provide fast, redundent, incremental,
compressed backups.

Does ReiserFS support transparent compression? If not, are there any
plans in this direction? Benchmarks I've seen in the past suggest that
compressed file systems generally improve performance (especially when
using something fast like LZOP) since CPUs are so fast--and of course for
backups being able to store more on fewer disks is nice...

Off-topic: anyone know of good vendors offering rackmount servers with
room for lots of IDE drives? Looking at Dell, IBM, and Compaq they all
use exclusively SCSI in there 2U rackmount servers.
