From: Frank van Maarseveen <frankvm@xs4all.nl>
Subject: Re: The argument for fs assistance in handling archives (was: silent semantic changes with reiser4)
Date: Mon, 6 Sep 2004 10:41:55 +0200
Message-ID: <20040906084155.GB31483@janus>
References: <20040902203854.GA4801@janus> <1094160994.31499.19.camel@shaggy.austin.ibm.com> <20040902214806.GA5272@janus> <20040902220027.GD23987@parcelfarce.linux.theplanet.co.uk> <20040902220242.GA5414@janus> <20040902220640.GE23987@parcelfarce.linux.theplanet.co.uk> <20040902221133.GB5414@janus> <20040902221722.GF23987@parcelfarce.linux.theplanet.co.uk> <20040902222650.GA5523@janus> <20040906080424.GC28697@thundrix.ch>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-21500-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040906080424.GC28697@thundrix.ch>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Tonnerre <tonnerre@thundrix.ch>
Cc: Frank van Maarseveen <frankvm@xs4all.nl>, viro@parcelfarce.linux.theplanet.co.uk, Dave Kleikamp <shaggy@austin.ibm.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, Linus Torvalds <torvalds@osdl.org>, Jamie Lokier <jamie@shareable.org>, Horst von Brand <vonbrand@inf.utfsm.cl>, Adrian Bunk <bunk@fs.tum.de>, Hans Reiser <reiser@namesys.com>, Christoph Hellwig <hch@lst.de>, fsdevel <linux-fsdevel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Mon, Sep 06, 2004 at 10:04:24AM +0200, Tonnerre wrote:
> 
> Problem is:
> 
> There are  cool superblock magics  for reiserfs. And for  ext[23]. And
> even for good old Minix. Cool.
> 
> However,  there  are   also  ugly  file  systems,  such   as  fat  for
> example. Fat has been defined as  "something that can be read by a fat

This problem is not new. Kernel probes for filesystems in a particular
order for mounting the root fs. And mount understands the fstype=auto in
/etc/fstab. There is no perfect solution but it's sure possible to come
up with something acceptable and workable with not too much effort, for
a configuratble subset of file-systems. This is not that much different
from an automounter/usermount mounting a USB storage device or cdrom:
ext3, ext2, udf, iso9660, vfat, read-only or not, just to name a few
things. This should work anyway.

-- 
Frank
