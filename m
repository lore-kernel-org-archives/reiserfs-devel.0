From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Sun, 29 Aug 2004 16:34:28 +0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040829123428.GP5108@backtop.namesys.com>
References: <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.58.0408251348240.17766@ppc970.osdl.org> <20040825212518.GK21964@parcelfarce.linux.theplanet.co.uk> <20040826001152.GB23423@mail.shareable.org> <20040826003055.GO21964@parcelfarce.linux.theplanet.co.uk> <20040826010049.GA24731@mail.shareable.org> <412DA40B.5040806@namesys.com> <20040826140500.GA29965@fs.tum.de> <1093530313.11694.56.camel@leto.cs.pocnet.net> <20040826150434.GF5733@mail.shareable.org>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040826150434.GF5733@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Christophe Saout <christophe@saout.de>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, Aug 26, 2004 at 04:04:34PM +0100, Jamie Lokier wrote:
> Christophe Saout wrote:
> > What reiser4 can do, but the VFS can't is to insert or remove data in
> > the middle of a file. Adding this above the page cache would probably be
> > almost impossible (truncate seems already complicated enough).
> 
> That would be one of those "special features" that a
> VFS-plus-userspace implementation of archive views could take
> advantage of on reiser4, while using a slower method (sometimes much
> slower) on all other filesystems.
> 
> By the way, can reiser4 share parts of files between different files?

no, those file plugins are not written yet :)

Do you mean COW files or some another thing?  For COW files, the reiser4
support is not enough, we need to teach cp(1) or another utility to inform the
fs layer that copying can be done by creation of COW files.

> -- Jamie

-- 
Alex.
