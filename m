From: Christoph Hellwig <hch@lst.de>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 11:24:14 +0200
Message-ID: <20040826092413.GA28854@lst.de>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <20040825201929.GA16855@lst.de> <412DA25E.9090405@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20603-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <412DA25E.9090405@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, Linus Torvalds <torvalds@osdl.org>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, Aug 26, 2004 at 01:42:06AM -0700, Hans Reiser wrote:
> Christoph Hellwig wrote:
> 
> >
> >Over the last at least five years we've taken as much as possible
> >semantics out of the filesystems and into the VFS layer, thus having
> >a separation between the semantical layer (VFS) and the low level
> >filesystem.
> >
> VFS is the common filesystem layer.  The only reason you think semantics 
> belong in the common filesystem layer is that you are not innovating in 
> your semantics, and feel content with stasis.
> 
> I don't.  I expect that semantics will get radically changed over the 
> next few years as we compete with Giampaolo and whatever lesser lights 
> are working at Microsoft.

Hans, please stop the gooddamn personal attack bullshit.

How do you for example suggestion exporting your semantics over the
network if they're not done at the VFS level?  How do you want some
clusterfilesystem support them or tmpfs?

