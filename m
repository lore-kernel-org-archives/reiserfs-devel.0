From: Bram Stolk <bram@sara.nl>
Subject: Re: rebuilding tree of root fs
Date: Thu, 17 Oct 2002 14:20:11 +0200
Message-ID: <20021017142011.535209f0.bram@sara.nl>
References: <20021017102854.GA10839@rushmore>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11720-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021017102854.GA10839@rushmore>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: rwhron@earthlink.net
Cc: reiserfs-list@namesys.com

On Thu, 17 Oct 2002 06:28:54 -0400
rwhron@earthlink.net wrote:

> > My reiserfs filesystem is damaged.
> > When I run reiserfsck, it reports that '--rebuild-tree' is required.
> 
> > However, if I add the --rebuild-tree, reiserfsck refuses to continue
> > because the fs cannot be mounted.
> 
> > Unfortunately, the fs is my root fs, so it cannot be unmounted.
> 
> I have that too running 2.5.41-ac2.  Which kernel were you running?
> I test reiserfs a lot and this is the first problem I've had.

2.4.19

But the corruption occurred when I had to power-down a non-responding
system, so it was not during normal operations.

> BTW, I'm thinking I'll have to boot off CD to fix this, but
> listening on the list for other suggestions.

Booting off CD is not feasable for me unfortunately.
I have a vaio picturebook, which has no CD drive. 
An USB CD drive from sony does exist, but I don't have one, and
I've heard that non-sony USB CD drives will not be bootable.
I am afraid that this means opening up the vaio, and physically
removing the drive, or paying through the nose for a sony USB 
CDROM drive.

  Bram

> 
> -- 
> Randy Hron
> http://home.earthlink.net/~rwhron/kernel/bigbox.html
> 
> 


-- 
------------------------------------------------------------------------------
 Bram Stolk, VR Specialist.
 SARA Academic Computing Services Amsterdam, PO Box 94613, 1090 GP  AMSTERDAM
 email: bram@sara.nl   Phone +31-20-5923059  Fax +31-20-6683167

 "I heard if you play the NT-4.0-CD backwards, you get a satanic message."
 "Thats nothing, if you play it forward, it installs NT-4.0"
------------------------------------------------------------------------------
