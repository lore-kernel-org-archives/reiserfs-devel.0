From: mitya@school.ioffe.ru (Dmitry Baryshkov)
Subject: Re: silent semantic changes with reiser4
Date: Fri, 27 Aug 2004 00:30:17 +0400
Message-ID: <20040826203017.GA14361@school.ioffe.ru>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825152805.45a1ce64.akpm@osdl.org> <412D9FE6.9050307@namesys.com> <20040826014542.4bfe7cc3.akpm@osdl.org> <412DAC59.4010508@namesys.com> <1093548414.5678.74.camel@krustophenia.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20788-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1093548414.5678.74.camel@krustophenia.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>, Andrew Morton <akpm@osdl.org>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

Hello,
On Thu, Aug 26, 2004 at 03:26:55PM -0400, Lee Revell wrote:
> On Thu, 2004-08-26 at 05:24, Hans Reiser wrote:
> > 
> > Well, in V4, you can easily compose a plugin from plugin methods of 
> > other plugins, write a little piece of code with the one thing you want 
> > different, and add it in.  Disk format changes, no big deal, add a new 
> > disk format plugin, or a new item plugin, or a new node plugin, etc., 
> > and you got your new format.
> > 
> 
> OK, real world example.  My roommate has an AKAI MPC-2000, a very
> popular hardware sampler from the 90's.  The disk format is known,there
> are a few utilities to edit the disks on a PC and extract the PCM
> samples, but there are no tools to mount it on a modern PC.  Are you
> saying that, since I know the MPC disk format, I could write a reiser4
> plugin to mount an MPC drive?
> 

Another example: Can ext2/etx3/reiserfsv3/xfs be implemented as reiser4
plugins? From Hans' words it seems so. If this is correct, then maybe
reiser4 core should be updated to completely replace current VFS layer?
Then it's a good point to create a branch (in old development model it
would be 2.7, dunno for new :), replace VFS layer with reiser4 core, and
rewrite all (or at least most used) FS as reiser4 plugins. Then
everybody will be happy.

But this looks too good to be true. Perhaps I misunderstood Hans' words
aboud 'new disk format', did I?

-- 
With best wishes
Dmitry Baryshkov

