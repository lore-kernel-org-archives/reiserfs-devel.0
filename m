From: Christoph Hellwig <hch@lst.de>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 18:23:54 +0200
Message-ID: <20040826162354.GA4891@lst.de>
References: <20040825152805.45a1ce64.akpm@osdl.org> <412D9FE6.9050307@namesys.com> <20040826014542.4bfe7cc3.akpm@osdl.org> <1093522729.9004.40.camel@leto.cs.pocnet.net> <20040826124929.GA542@lst.de> <1093525234.9004.55.camel@leto.cs.pocnet.net> <20040826130718.GB820@lst.de> <20040826144422.GD5733@mail.shareable.org> <20040826160306.GA4326@lst.de> <20040826161911.GK5733@mail.shareable.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20717-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040826161911.GK5733@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Christoph Hellwig <hch@lst.de>, Christophe Saout <christophe@saout.de>, Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, torvalds@osdl.org, reiserfs-list@namesys.com

On Thu, Aug 26, 2004 at 05:19:11PM +0100, Jamie Lokier wrote:
> Remember that reiser4 allows you to operate on little pieces of data,
> glueing and rearranging them inside files (something like that).
> 
> No other filesystem has that capability, and it's a data model which
> the fancy features (when they exist) will use.
> 
> You can map those pieces to underlying directories and files and
> renames and unlinks, so that the fancy stuff works on other
> filesystems, but it would be a useless model because those other
> filesystems wouldn't be recognisably "ordinary" files any more.
> 
> For reiser4 to expose that model through a VFS interface, and the
> fancy stuff to use it through the VFS interface, and for the fancy
> stuff to work (even imperfectly) on other filesystems which don't
> offer those operations, some kind of fall-back "store metadata and
> fragment rearrangements in auxiliary files with special names" layer
> would be requied.  That's a big job.

I seem to miss those files in the current implementation.  But again the
big question is how will the interface look?  If the smaller objects
interact with normal files (link/rename, contained in normal
directories), they will have to obey the same locking protocols.  If not
a filesystem could experiment with it of course.

