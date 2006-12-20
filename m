From: Quinn Harris <quinn@quinnh.org>
Subject: Re: reiser4: data recovery after mkfs.reiser4?
Date: Wed, 20 Dec 2006 15:05:33 -0700
Message-ID: <200612201505.38544.quinn@quinnh.org>
References: <20061219202059.GS10358@zeus.uziel.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30335-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20061219202059.GS10358@zeus.uziel.local>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Christian Trefzer <ctrefzer@web.de>

I really doubt there is any solution that would take less than a few hours.  I 
am sure it is possible to recover much of the data but to the best of my 
knowledge no tool exists that can recover from an abandoned root node (for 
reiser4).  Though I believe recovery in this case would just involve finding 
the root node (think that is reasonably tractable, but slow) fixing the 
superblock to point to that and let fsck do its thing.  

I don't think the root node has a magic number that advertises root, but 
internal nodes do have a recognizable signature and in principal one could 
deduce which is the root from a collection of the internal nodes.

Note that reiser4 packs lots of data in single nodes.  If you create a fresh 
fs with only a few small files they will reside entirely in the root node, 
which will be clobbered by a mkfs.  There is a very good change that mkfs 
will clobber a little bit of data, but less than 4K.

I am sure a few thousand dollars would buy you a solution.  Maybe less.

On Tuesday 19 December 2006 1:20 pm, Christian Trefzer wrote:
> Hi folks,
>
> a buggy script I wrote dared to mkfs a reiser4 partition after failing
> to properly tar up its contents - not that my life would depend on them,
> but it would save me a few hours if I could get the stuff back.
>
> Other than mkfs.reiser4, mount and unmount, nothing was done to the
> device ; ) Is there any way to recover most of what was stored on the
> now nuked fs?
>
> TIA,
> Chris
