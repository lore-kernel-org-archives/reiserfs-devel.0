From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 01:42:06 -0700
Message-ID: <412DA25E.9090405@namesys.com>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <20040825201929.GA16855@lst.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20588-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040825201929.GA16855@lst.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christoph Hellwig <hch@lst.de>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, Linus Torvalds <torvalds@osdl.org>, ReiserFS List <reiserfs-list@namesys.com>

Christoph Hellwig wrote:

>
>Over the last at least five years we've taken as much as possible
>semantics out of the filesystems and into the VFS layer, thus having
>a separation between the semantical layer (VFS) and the low level
>filesystem.
>
VFS is the common filesystem layer.  The only reason you think semantics 
belong in the common filesystem layer is that you are not innovating in 
your semantics, and feel content with stasis.

I don't.  I expect that semantics will get radically changed over the 
next few years as we compete with Giampaolo and whatever lesser lights 
are working at Microsoft.

>  Your attributes are absoultely a VFS thing and as such
>should not happen at the filesystem layer, and no, that doesn't mean
>they're bad per se, I just think they are a rather bad fit for Linux.
>
>So now go on and try to work together with the other peope doing VFS
>level work instead of hiding, or if you think you can't work together
>with us search a nice research OS where you can take over the VFS layer,
>if your ideas prove to be good I'm sure Linux will pick them up sooner
>or later.
>
>	Christoph
>
>
>  
>
I tell you what, use xattrs for all the half speed filesystems, and the 
users and I will use metafiles.
