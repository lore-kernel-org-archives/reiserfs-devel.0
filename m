From: Nick Piggin <npiggin@suse.de>
Subject: Re: Formal Reiser4 inclusion and todo list?
Date: Mon, 2 Aug 2010 17:25:40 +1000
Message-ID: <20100802072540.GA7841@amd>
References: <2E9381E6-A09A-4330-9A61-C4B7D7CE0E71@MailNewsRSS.com>
 <49F2CF9A.1060202@inn.nl>
 <49F2D43F.90105@ontolab.com>
 <8c113a260904250416n28fbdacs682ef8e6859b7dbf@mail.gmail.com>
 <49F339A2.9080705@ontolab.com>
 <200904252027.n3PKReMx073755@mail.meer.net>
 <49F393A1.4030004@gmail.com>
 <0d42c3ebde41a3d0bcc01f9fccc07f1c@mail.velocitynet.com.au>
 <4C508BFC.3010008@ontolinux.com>
 <4C5579E9.2030200@ontolinux.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4C5579E9.2030200@ontolinux.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christian Stroetmann <stroetmann@ontolinux.com>
Cc: Glenn D <doiggl@velocitynet.com.au>, linux-kernel <linux-kernel@vger.kernel.org>, linux reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Sun, Aug 01, 2010 at 03:43:05PM +0200, Christian Stroetmann wrote:
> Hi Glenn;
> 
> On the 28.07.2010 21:58, I wrote:
> >Aloha Glenn;
> >
> >At the 28.07.2010 17:21, you (doiggl@velocitynet.com.au) wrote:
> >>>The following items are still unaddressed:
> >>>
> >>>1. running igrab() in the writepage() path is really going to hammer
> >>>    inode_lock.  Something else will need to be done here.
> >>>
> >>>2. Running iput() in entd() is a bit surprising.  iirc there
> >>>are various
> >>>ways
> >>>    in which this can recur into the filesystem, perform I/O, etc.  I
> >>>guess it
> >>>    works..
> >>>    But again, it will hammer inode_lock.

inode_lock should be going away within 6 months or so, with the
vfs-scaling developments (see linux-fsdevel).

Inode refcounting becomes very light-weight, as it should be.


> >>>3. the writeout logic in entd_flush() is interesting (as in
> >>>"holy cow").
> >>>    It's very central and really needs some good comments describing
> >>what's
> >>>    going on in there - what problems are being solved, which decisions
> >>were
> >>>    taken and why, etc.
> >>>
> >>>4. reiser4_wait_page_writeback() needs commenting.
> >>>
> >>>5. reading the comment in txnmgr.c regarding MAP_SHARED pages: a number
> >>of
> >>>    things have changed since then.  We have page-becoming-writeable
> >>>    notifications and probably soon we'll always take a
> >>>pagefault when a
> >>>    MAP_SHARED page transitions from pte-clean to pte-dirty (although I
> >>>wouldn't
> >>>    recommend that a filesystem rely upon the latter for a while yet).

It is now possible to trap all dirtying activity from all sources
except get_user_pages (but filesystems tend to ignore that little
problem).

