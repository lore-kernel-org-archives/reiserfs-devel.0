From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Corrupted reiserfs filesystem: please help to solve this - No one ?
Date: Sat, 21 Aug 2004 17:50:05 +0200
Message-ID: <200408211750.05906.christian.mayrhuber@gmx.net>
References: <200408181706.07347.m.vd.brink@worldonline.nl> <200408211640.12710.m.vd.brink@worldonline.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20455-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408211640.12710.m.vd.brink@worldonline.nl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: m.vd.brink@worldonline.nl
Cc: reiserfs-list@namesys.com

On Saturday 21 August 2004 16:40, Melis van den Brink wrote:
> No one ?

I'm using reiserfs with lvm on servers with 2.4.x kernels and never ever had 
any problem. 
The order of the steps you have taken seem to be the right ones.

Maybe the text backup file for vgcfgrestore of the lvm config was old/wrong 
and the volume group is now set up in a different way than it was at creation 
time of reiserfs. I guess Reiserfs cannot find it's superblock, because it's 
just not there, because lvm has assembled the logical volume in a wrong 
fashion.

This sounds like a lvm problem to me, at first hand.  I guess you have to ask 
on the lvm mailing list.
http://linux.msede.com/lvm_mlist/archive/

Maybe you can run reiserfsck --check directly on a physical device, but before
doing this better ask someone who knows where lvm writes it's physical volume
data. The superblock may sit at an offset after some lvm header.

-- 
lg, Chris
