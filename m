From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: when will it end?
Date: Wed, 27 Oct 2004 07:34:43 +0400
Message-ID: <20041027033443.GE25932@backtop.namesys.com>
References: <417EF280.10003@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22190-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <417EF280.10003@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

On Tue, Oct 26, 2004 at 07:57:36PM -0500, David Masover wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> I have 512 megs of RAM and one 200 gig hard drive (effectively 177 gig
> filesystem) that is 86% full.  I started the reiser4 repacker two days
> ago, with very minimal system use since then (an hour or two a day of
> playing music and reading email).  See below for my df and top.
> 
> Thankfully, the kernel seems intelligent enough about memory management
> that once things other than Doom 3 start, they run reasonably smoothly,
> even video (must be that anticipatory IO scheduler).
> 
> Three questions:   When will it end?  How can I kill it if I get sick of
> waiting?  

try this:
echo 0 > /sys/fs/riser4/hda5/repacker/start

> Is it conceivable that the repacker could be optimized to run
> faster?

current repacker code state is 'unsupported', it is even removed from the
latest -mm kernels.   Namesys plans are to make the repacker proprietary.

-- 
Alex.
