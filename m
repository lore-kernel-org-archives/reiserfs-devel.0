From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Mon, 9 Aug 2004 22:42:18 +0400
Message-ID: <20040809184218.GJ9811@backtop.namesys.com>
References: <20040809175934.GI9811@backtop.namesys.com> <20040809183026.9AF1D15CD6@mail03.powweb.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20102-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040809183026.9AF1D15CD6@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Dabbs <david@dabbs.net>
Cc: 'ReiserFS List' <reiserfs-list@namesys.com>

On Mon, Aug 09, 2004 at 01:22:36PM -0500, David Dabbs wrote:
> 
> 
> > -----Original Message-----
> > From: Alex Zarochentsev [mailto:zam@namesys.com]
> > Sent: Monday, August 09, 2004 1:00 PM
> > To: David Dabbs
> > 
> > mkfs.reiser4 sets the fs-wide default fibration plugin.
> > 
> > Alex.
> [David Dabbs] 
> 
> So does mkfs.reiser4 using ext-1 as its default? I don't have the code
> available to check before asking.

mkfs.reiser4 can report default plugins:

darkstar:~ # ~zam/bk/reiser4progs/progs/mkfs/mkfs.reiser4 -p
/home/zam/bk/reiser4progs/progs/mkfs/.libs/lt-mkfs.reiser4 0.5.7
Copyright (C) 2001, 2002, 2003, 2004 by Hans Reiser, licensing governed by
reiser4progs/COPYING.

Default profiles:
format:     "format40" (id:0x0 type:0x8)
journal:    "journal40" (id:0x0 type:0xf)
oid:        "oid40" (id:0x0 type:0x9)
alloc:      "alloc40" (id:0x0 type:0xe)
key:        "key_large" (id:0x1 type:0x10)
node:       "node40" (id:0x0 type:0x2)
statdata:   "stat40" (id:0x0 type:0x1)
nodeptr:    "nodeptr40" (id:0x3 type:0x1)
direntry:   "cde40" (id:0x2 type:0x1)
tail:       "tail40" (id:0x6 type:0x1)
extent:     "extent40" (id:0x5 type:0x1)
acl:        "absent (id:0x4 type:0x1)"
permission: "absent (id:0x0 type:0x6)"
regular:    "reg40" (id:0x0 type:0x0)
directory:  "dir40" (id:0x1 type:0x0)
symlink:    "sym40" (id:0x2 type:0x0)
special:    "spl40" (id:0x3 type:0x0)
hash:       "r5_hash" (id:0x1 type:0x3)
fibration:  "ext_1_fibre" (id:0x2 type:0x4)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
formatting: "smart" (id:0x2 type:0x5)

darkstar:~ #

> 
> David
> 

-- 
Alex.
