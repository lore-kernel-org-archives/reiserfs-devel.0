From: Andrea Arcangeli <andrea@suse.de>
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 02:18:51 +0200
Message-ID: <20040827001851.GA7640@nocona.random>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org> <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk> <1093467601.9749.14.camel@leto.cs.pocnet.net> <20040825225933.GD5618@nocona.random> <412DA0B5.3030301@namesys.com> <20040826112818.GL5618@nocona.random> <412E77F3.1090206@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20861-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <412E77F3.1090206@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Christophe Saout <christophe@saout.de>, viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, Aug 26, 2004 at 04:53:23PM -0700, Hans Reiser wrote:
> Think of it as being like VFS, where you can plugin new filesystems.  
> Only in this case, you can plugin new kinds of files, and everything you 
> need to implement those new kinds of files (items, nodes, keys, 
> processing before flushing to disk, etc.) also gets implemented as a 
> plugin.  It is an Uber-VFS.

I'm just confused by the naming, following your comparison with it being
like VFS, I don't call reiser4 a "plugin" of the VFS.

The vfs offers an interface for the fs to register into
it. Like the scsi highlevel code also offers an interface for the
lowlevel driver to register into it, but we don't call scsi lowlevel
drivers "plugins".

the ext3 directory code calling ext3_getblk would be also a plugin in
your vocabulary, and the ext3_getblk call would be plugin-hook.

> I am not concerned about ram in this design, I want nifty new kinds of 
> files easy crafted over a weekend by sysadmins working in Canada and 
> Guatemala.  Software engineering cost is what matters to me ( I turned 
> 40, so I think different now....;-) )

Adding proper layering and abstractions is sure a good thing, if you can
turn the street into a crowd of reiser4 kernel hackers because your API
is so clean that any sysadmin can craft new kind of files over the
weekend you're welcome to go ahead ;). (I just doubt the "plugin"
terminology can make a difference by the time people start scratching
their head into the code, the design and the clean abstraction of the
code will make a difference instead)
