From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] reiserfs: use open_bdev_excl
Date: Wed, 6 Feb 2008 21:16:27 -0800
Message-ID: <20080206211627.9683a9e2.akpm@linux-foundation.org>
References: <20071226153101.GA2428@lst.de>
	<20080207044513.GA4088@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20080207044513.GA4088@lst.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@lst.de>
Cc: chris.mason@oracle.com, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Thu, 7 Feb 2008 05:45:13 +0100 Christoph Hellwig <hch@lst.de> wrote:

> On Wed, Dec 26, 2007 at 04:31:01PM +0100, Christoph Hellwig wrote:
> > Use the proper helper to open a blockdevice by name for filesystem
> > use, this makes sure it's properly claimed (also added for open-by-number)
> > and gets rid of the struct file abuse.
> > 
> > Tested by mounting a reiserfs filesystem with external journal.
> 
> Folks, what do we do with this patch?  It's been out for more than a
> month but didn't actually get picked up in any tree.

It's still sitting in the great pile of things I got sent over Christmas
and haven't looked at yet.  It didn't look like a bugfix.

>  I'd really like
> to see this going in soon.

How come?
