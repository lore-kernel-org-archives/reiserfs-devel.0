From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: resize_reiserfs 3.6.8 doesn't shrink bitmap correctly
Date: Tue, 24 Jun 2003 13:23:25 +0400
Message-ID: <200306241323.25973.vitaly@namesys.com>
References: <3EF75EBE.9070304@ysu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14685-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EF75EBE.9070304@ysu.edu>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: John Dalbec <jpdalbec@ysu.edu>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Tuesday 24 June 2003 00:10, John Dalbec wrote:
> I ran resize_reiserfs -s -1024M on a ReiserFS partition for testing.
> The partition resized OK, mounted OK, umounted OK.  Then I tried to
> restore the original filesystem size, but resize_reiserfs reported that
> it couldn't read the on-disk bitmap.  I ran reiserfsck and it reported:
>
> Zero bit found in on-disk bitmap after the last valid bit.
>
> and said I could fix it with --fix-fixable.  I ran reiserfsck
> --fix-fixable and it fixed the problem.  I then ran resize_reiserfs on
> the same partition to restore the original size with no problems.  I
> repeated this exercise to make sure it wasn't a fluke, with the same
> results.

Thank you for the report, I see the problem and I am fixing it. 

-- 
Thanks,
Vitaly Fertman
