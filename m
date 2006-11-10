From: "Roger Lucas" <roger@planbit.co.uk>
Subject: RE: reiserfsck with LVM read-only snapshot
Date: Fri, 10 Nov 2006 18:06:25 -0000
Message-ID: <20061110180425.426BC12EE1@bluewhale.planbit.co.uk>
References: <4554BA92.2070003@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30138-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4554BA92.2070003@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'David Masover' <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

Thanks - I'll go digging :-)

> -----Original Message-----
> From: David Masover [mailto:ninja@slaphack.com]
> Sent: 10 November 2006 17:45
> To: Roger Lucas
> Cc: reiserfs-list@namesys.com
> Subject: Re: reiserfsck with LVM read-only snapshot
> 
> Roger Lucas wrote:
> 
> > Hmmm.  I'm not sure about dm_snapshot having not used it before and LVM seems to work pretty well
> (at least as far as its
> > capabilities allow).  I'm open to all suggestions, however.
> 
> I'm not sure exactly where to point you to, though. The scary thing
> about dm_snapshot is that there's so little documentation.
> 
> No, wait, looks like there is. Check a copy of the kernel source:
> 
> Documentation/device-mapper/snapshot.txt
> 
> You should be able to get it to work, even on top of LVM. But, if you're
> only using LVM for snapshots, you might consider using device-mapper
> directly instead.
> 
> Try it out on some loop devices first to get an idea of how it works.
> You know, little 10 meg files with an ext2 fs, set up with losetup (not
> mount -o loop), then you can play with dmsetup. As far as I know, any
> device-mapper device can be created from any block device, period --
> dmraid works by creating dm_linear devices to represent the partitions
> of, say, a dm_stripe device. No performance hit that I can tell.
> 
> If you need more help with that, let me know.

