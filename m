From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [BUG][trivial] atime not set on directory reads
Date: Fri, 14 Jun 2002 00:52:49 -0600
Message-ID: <20020614065248.GU682@clusterfs.com>
References: <20020613213530.GN682@clusterfs.com> <20020614090538.A22474@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10736-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <20020614090538.A22474@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

On Jun 14, 2002  09:05 +0400, Oleg Drokin wrote:
>    Can you please state kernel version? Bugreports are very useful
>    when combined with version of kernel used.
> 
>    Anyway problem looking like exactly what you describe was fixed in
>    2.4.19-pre3 or thereabout, so can you please also test with
>    some recent 2.4.19-pre kernel?

Sorry about that.  I tested with 2.4.18, so it is probably fixed
already.  I'm not planning on a kernel upgrade right now, but I'll
let you know if it is still broken when I do upgrade.

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/

