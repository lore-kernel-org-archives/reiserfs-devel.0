From: Andrea Arcangeli <andrea@suse.de>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 14:16:30 +0200
Message-ID: <20040826121630.GN5618@nocona.random>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org> <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk> <1093467601.9749.14.camel@leto.cs.pocnet.net> <20040825225933.GD5618@nocona.random> <412DA0B5.3030301@namesys.com> <20040826112818.GL5618@nocona.random> <1093520699.9004.11.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20648-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1093520699.9004.11.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Saout <christophe@saout.de>
Cc: Hans Reiser <reiser@namesys.com>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, Aug 26, 2004 at 01:44:59PM +0200, Christophe Saout wrote:
> I think you're not exactly understanding what a reiser4 "plugin" is.
> 
> Currently plugins are not modules. It just means that there's a defined
> interface between the reiser4 core and the plugins. Just like you could
> see filesystems as "VFS plugins".

but filesystems are exactly always modules (in precompiled kernels at
least).

Anyways I don't see any visible EXPORT_SYMBOL in reiser4.

> 
> In fact, reiser4 plugins are
> - users of the reiser4 core API
> - some of them are implementing Linux VFS methods (thus being some sort
> of glue code between the Reiser4 storage tree and the Linux VFS)

then it seems a bit misleading to call those things plugins.

As you wrote those are "users of the reiser4 core API", with plugins I
always meant dynamically loadable things, like plugins for web browers
(hence kernel modules in kernel space). While here apparently you can't
plugin anything at runtime, it's just code that uses the reiser4 core
API that can be modified with a kernel patch as usual.
