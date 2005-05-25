From: Andrew James Wade <ajwade@cpe00095b3131a0-cm0011ae8cd564.cpe.net.cable.rogers.com>
Subject: Re: Unexpected reset corrupted Reiser4 filesystem
Date: Wed, 25 May 2005 16:39:55 -0400
Message-ID: <200505251639.56159.ajwade@cpe00095b3131a0-cm0011ae8cd564.cpe.net.cable.rogers.com>
References: <200505242338.32420.ajwade@cpe00095b3131a0-cm0011ae8cd564.cpe.net.cable.rogers.com> <429403EF.4030803@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24147-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <429403EF.4030803@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

John Dong wrote:
> If thse were IDE drives, the IDE writeback cache is probably the bad boy -- 
> on FreeBSD 5.x, Soft Updates is virtually broken on IDE drives because they 
> simply haven't written all the data they promised the kernel that they had.
I do indeed have an IDE drive (Seagate Barracuda) with a writeback cache.
But I thought that write barriers were now working (by flushing the writeback
cache if the drive doesn't support anything fancier). However, I couldn't find
any updates on the write barrier work since March of last year.
(<http://lwn.net/Articles/77074/>). So the writeback cache may indeed be the
bad boy.

On May 25, 2005 12:49 am, David Masover wrote:
> That's what it all comes down to -- make backups.  The fact that you
> have journalling/transactions/fsck/batteries/RAID is all just to make it
> a little less catostrophic when stuff does fail.
Yup, time for me to make backups. Thanks for the nudge. Especially as I'm
running a bleeding-edge kernel. (I did have one eat some of my data).

Andrew

P.S. My internet connection's been flaky lately, so apologies for any
bounces. I check the mailing list archives for missed messages.
