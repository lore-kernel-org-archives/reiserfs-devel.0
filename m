From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: secure delete?
Date: Thu, 25 Mar 2004 16:00:46 +0300
Message-ID: <1080219646.1977.308.camel@tribesman.namesys.com>
References: <Pine.LNX.4.44.0403240625080.18021-100000@potato.zayda.com>
	 <40613E9A.9090605@namesys.com>
	 <1080115473.1976.219.camel@tribesman.namesys.com>
	 <1080170284.11768.1306.camel@arabia.home.lan>  <20040325034937.GB8473@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17468-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040325034937.GB8473@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2004-03-25 at 06:49, Tom Vier wrote:
> On Thu, Mar 25, 2004 at 12:18:08AM +0100, Enrique Perez-Terron wrote:
> > So, even a fairly cheap and quick encryption system combined with a
> > "secure delete" facility makes it many orders of magnitude more
> > expensive to recover any information from the disk. While it is hardly
> > the first priority, there might still be many customers that will one
> > day be willing to pay for this.
> 
> i really like the idea of a per file key in the inode. the fs could wipe the
> key field itself, using the gutmann method, without too much trouble (like
> wiping the entire file from within the kernel; that could be gigs and take
> hours).
> 
> could this be implimented using plugins?
> 
> also, it was mentioned that reiserfs doesn't reserve space. so all
> structures (except the superblock and journal, of course) are dynamic and
> regular files can overwrite old nodes? if so, then wipe could use a regular
> file to wipe free space fairly effectively. if not, maybe i could use the
> reiserfsprogs libs to figure out what blocks are free (before it's mounted
> of course).
> 
> btw, anyone know what the block coherancy is in 2.6? if i write to a blkdev,
> then mount it, will the fs driver see the writes?

No, it will not. Until blkdev flushes its changes.

> i know if the fs writes to
> the blkdev, reading the blkdev from userspace can return stale cache. too
> bad you can't do something like umount; bsync; (now safely read/write the
> blkdev).

