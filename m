From: Hans Reiser <reiser@namesys.com>
Subject: Re: back up to disk
Date: Wed, 16 Oct 2002 05:15:33 +0400
Message-ID: <3DACBDB5.9020303@namesys.com>
References: <20021015224213.4BBAA1AEC13E@server5.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11705-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: JP Howard <jh_lists@fastmail.fm>
Cc: Russell Coker <bofh@coker.com.au>, ReiserFS List <reiserfs-list@namesys.com>

JP Howard wrote:

>We've been thinking about something like that, using this extremely nifty
>trick:
>
>http://www.mikerubel.org/computers/rsync_snapshots/
>
This is brilliantly simple.

>
>Back in the old days (i.e. last week) when we were planning around Ext3,
>we were thinking of combining it with this product:
>
>http://www.shaolinmicro.com/product/cogofs/index.php
>
This looks reasonable as a product, and not unreasonably expensive for 
servers.   There are some advantages to tight integration though, in 
that you can compress at flush time.

>
>The two combined, with ATA RAID, provide fast, redundent, incremental,
>compressed backups.
>
>Does ReiserFS support transparent compression?
>
This is one of the features that won't make the Halloween deadline, but 
might be slipped in later.

> If not, are there any
>plans in this direction? Benchmarks I've seen in the past suggest that
>compressed file systems generally improve performance (especially when
>using something fast like LZOP) since CPUs are so fast--and of course for
>backups being able to store more on fewer disks is nice...
>
What I had heard was that they generally slowed peformance, but maybe my 
info is old.

CPUs are faster now, and maybe compression algorithms are faster.

Can you give more details?



