From: =?iso-8859-1?Q?Oscar_Garc=EDa?= <ogarcia@atlasit.com>
Subject: Re: Problem with ReiserFS + NFS + Convolo
Date: Sat, 14 Jun 2003 14:39:18 +0200
Message-ID: <003e01c33271$f9c90560$1501a8c0@int.atlassolutions.net>
References: <003001c33270$967bd650$1501a8c0@int.atlassolutions.net> <20030614123452.GA32756@namesys.com>
Reply-To: =?iso-8859-1?Q?Oscar_Garc=EDa?= <ogarcia@atlasit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14541-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com, eramos@atlasit.com

Awesome!

I can't upgrade to 2.4.21, but I'll upgrade to 2.4.20 with your patch.

Thanks a lot,  I'll tell you how it goes ;-)


----- Original Message ----- 
From: "Oleg Drokin" <green@namesys.com>
To: "Oscar Garc?a" <ogarcia@atlasit.com>
Cc: <reiserfs-list@namesys.com>; <eramos@atlasit.com>
Sent: Saturday, June 14, 2003 2:34 PM
Subject: Re: Problem with ReiserFS + NFS + Convolo


> He;;p!
>
> On Sat, Jun 14, 2003 at 02:29:21PM +0200, Oscar Garc?a wrote:
>
> > I'm running  a linux cluster with convolo and two nodes. One of the
services I offer from this cluster is nfs to a bunch of solaris machines.
Now every so often I get an error like this:
> > Jun 13 13:29:44 cluster1 kernel: 0: reiserfs_unlink
> > Jun 13 13:29:44 cluster1 kernel: reiserfs[3736]: assertion !( !truncate
&& ( inode -> u.reiserfs_i.i_flags & i_link_saved_un
> > link_mask ) ) failed at super.c:238:add_save_link: saved link already
exists for unlinked inode c16f7
> > And the uptime of the machine begins to go up, and up, and up... As soon
as this happens processes begin to get blocked in the wait queue of the
kernel, and the machine is still up but gives no service.
> > 2x Compaq DL360G2, 2xPIII 14.Ghz, 2Gb RAM, 2x18Gb HDD, 1 QL2000 FC
Adapter
> > 1x External Storage of 1.4 Tb
> > Running RedHat 7.2, kernel 2.4.18 #12 SMP with patches for Convolo 2.0
(www.missioncrtiticallinux.com)
>
> Hm. Sounds like you was bitten by iget4() race bug.
> You need to upgrade to 2.4.21 or to apply the patch I am attaching here.
>
> Bye,
>     Oleg
>

