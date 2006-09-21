From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: partition cannot be mounted from grub
Date: Thu, 21 Sep 2006 16:43:06 +0400
Message-ID: <200609211643.06775.vs@namesys.com>
References: <eet9jg$463$1@sea.gmane.org> <200609211559.12052.vs@namesys.com> <eetvnu$c38$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29963-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <eetvnu$c38$1@sea.gmane.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Huub <huubvanniekerk@gmail.com>
Cc: reiserfs-list@namesys.com

Hello

On Thursday 21 September 2006 16:14, Huub wrote:
> 
> > yes
> > that should give us a hint whether the problem is in reiserfs or in grub
> > 
> 
> Looks like I can do a clean install. 

If there is no important data on the system - this is the easiest way.

> No filesystem or superblock found. 
> 

I would guess that you got partition table corruption. 
You may want to try to fdisk /dev/hdc in the way it was partitioned before. 
However, boundaries of partitions are to known presizely for that, though.

You may also try gpart(8). It does not look at partition table and may find partition boundaries.
