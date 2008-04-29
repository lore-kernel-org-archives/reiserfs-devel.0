From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] reiserfs: use open_bdev_excl
Date: Tue, 29 Apr 2008 11:24:48 -0700
Message-ID: <20080429112448.5143a4b5.akpm@linux-foundation.org>
References: <20071226153101.GA2428@lst.de>
	<20080429181322.GA21741@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20080429181322.GA21741@lst.de>
Sender: linux-fsdevel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@lst.de>
Cc: chris.mason@oracle.com, linux-fsdevel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Tue, 29 Apr 2008 20:13:22 +0200
Christoph Hellwig <hch@lst.de> wrote:

> On Wed, Dec 26, 2007 at 04:31:01PM +0100, Christoph Hellwig wrote:
> > Use the proper helper to open a blockdevice by name for filesystem
> > use, this makes sure it's properly claimed (also added for open-by-number)
> > and gets rid of the struct file abuse.
> > 
> > Tested by mounting a reiserfs filesystem with external journal.
> 
> Any reason this still didn't get sent to Linus?

no, I just filed it in the wrong place.  It'll get there.
