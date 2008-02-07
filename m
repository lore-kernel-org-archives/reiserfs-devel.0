From: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] reiserfs: use open_bdev_excl
Date: Thu, 7 Feb 2008 06:19:56 +0100
Message-ID: <20080207051956.GA5229@lst.de>
References: <20071226153101.GA2428@lst.de> <20080207044513.GA4088@lst.de> <20080206211627.9683a9e2.akpm@linux-foundation.org>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20080206211627.9683a9e2.akpm@linux-foundation.org>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Christoph Hellwig <hch@lst.de>, chris.mason@oracle.com, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Wed, Feb 06, 2008 at 09:16:27PM -0800, Andrew Morton wrote:
> On Thu, 7 Feb 2008 05:45:13 +0100 Christoph Hellwig <hch@lst.de> wrote:
> 
> > On Wed, Dec 26, 2007 at 04:31:01PM +0100, Christoph Hellwig wrote:
> > > Use the proper helper to open a blockdevice by name for filesystem
> > > use, this makes sure it's properly claimed (also added for open-by-number)
> > > and gets rid of the struct file abuse.
> > > 
> > > Tested by mounting a reiserfs filesystem with external journal.
> > 
> > Folks, what do we do with this patch?  It's been out for more than a
> > month but didn't actually get picked up in any tree.
> 
> It's still sitting in the great pile of things I got sent over Christmas
> and haven't looked at yet.  It didn't look like a bugfix.

Well, it's fixing that reiserds doesn't bd_claim it's journal device so
people can open the block device with O_EXCL against the documetned
semantics.  It's probably also fixing various corner cases that
open_bdev_excl deals with and a hand-crafted filp_open doesn't.

> >  I'd really like
> > to see this going in soon.
> 
> How come?

I just hate sitting on a stack of patches.  Even more so if I'd like to
see the public API removed in there eventually go away.
