From: Christoph Hellwig <hch@lst.de>
Subject: Re: reiser4 plugins (was: silent semantic changes with reiser4)
Date: Sat, 28 Aug 2004 13:12:33 +0200
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040828111233.GA11339@lst.de>
References: <20040825152805.45a1ce64.akpm@osdl.org> <412D9FE6.9050307@namesys.com> <20040826014542.4bfe7cc3.akpm@osdl.org> <1093522729.9004.40.camel@leto.cs.pocnet.net> <20040826124929.GA542@lst.de> <1093525234.9004.55.camel@leto.cs.pocnet.net> <20040826130718.GB820@lst.de> <1093526273.11694.8.camel@leto.cs.pocnet.net> <20040826132439.GA1188@lst.de> <20040828105929.GB6746@alias>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20040828105929.GB6746@alias>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: flx@msu.ru, Christoph Hellwig <hch@lst.de>, Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

On Sat, Aug 28, 2004 at 02:59:29PM +0400, Alexander Lyamin wrote:
> Thu, Aug 26, 2004 at 03:24:39PM +0200, Christoph Hellwig wrote:
> > This VFS interface is an integral part of ??very filesystem, and it
> 
> VFS never was "an integral part" of ANY filesystem. my dog knows it.
> its just unified INTERFACE TO any filesystem (including reiser4).

You's misquoting me.  IF you quoted the whole context it'd be pretty
sure that the part of the filesystem that intefaces with the VFS is
meant.

But one could even say VFS is integral part of a linux filesystem as
it does most of the work a filesystem driver does in other operating
systems.

> P.S. I imagine, how much flamed it would be if reiser4 made any intensive
> changes in linux VFS code...

It really depends on how you sent them.  If you had a big patch without
explanations - sure.

