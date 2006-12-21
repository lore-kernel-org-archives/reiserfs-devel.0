From: Christian Trefzer <ctrefzer@web.de>
Subject: Re: reiser4: data recovery after mkfs.reiser4?
Date: Thu, 21 Dec 2006 11:21:07 +0100
Message-ID: <20061221102107.GB20749@zeus.uziel.local>
References: <20061219202059.GS10358@zeus.uziel.local> <200612201505.38544.quinn@quinnh.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30336-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200612201505.38544.quinn@quinnh.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Quinn Harris <quinn@quinnh.org>
Cc: reiserfs-list@namesys.com

Hi,

On Wed, Dec 20, 2006 at 03:05:33PM -0700, Quinn Harris wrote:
> I really doubt there is any solution that would take less than a few
> hours.  I am sure it is possible to recover much of the data but to
> the best of my knowledge no tool exists that can recover from an
> abandoned root node (for reiser4).  Though I believe recovery in this
> case would just involve finding the root node (think that is
> reasonably tractable, but slow) fixing the superblock to point to that
> and let fsck do its thing.  
> 
> I don't think the root node has a magic number that advertises root,
> but internal nodes do have a recognizable signature and in principal
> one could deduce which is the root from a collection of the internal
> nodes.
> 
> Note that reiser4 packs lots of data in single nodes.  If you create a
> fresh fs with only a few small files they will reside entirely in the
> root node, which will be clobbered by a mkfs.  There is a very good
> change that mkfs will clobber a little bit of data, but less than 4K.
> 
> I am sure a few thousand dollars would buy you a solution.  Maybe
> less.

Thanks for your concern!  However, with the additional flags Vladimir
mentioned, I managed to recover all but two shared library files which
could be easily copied from a working system.

I already answered Vladimir's posting twice - one "thanks, I'll try
that" and one success report.  It just so happens that a LOT of mails I
send to the list never gets through, no idea why.

Regards,
Chris

