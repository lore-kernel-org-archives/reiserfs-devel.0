From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: How to build a big file server
Date: Thu, 5 Jun 2003 02:55:54 -0600
Message-ID: <20030605025554.J1522@schatzie.adilger.int>
References: <1054800852.1997.15.camel@wusel.schnulli.de> <3EDEFE7A.1090502@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14414-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EDEFE7A.1090502@gmx.net>; from c-d.hailfinger.kernel.2003@gmx.net on Thu, Jun 05, 2003 at 10:25:30AM +0200
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Cc: Heinz-Josef Claes <hjclaes@web.de>, ReiserFS List <reiserfs-list@namesys.com>

On Jun 05, 2003  10:25 +0200, Carl-Daniel Hailfinger wrote:
> Heinz-Josef Claes wrote:
> > - I plan to build a system with IDE 250GB drives. 7 of them for raid 5
> > and one hot spare. The OS will be on separate hardware raid 1 on smaller
> > disks. Does anybody have experience with IDE controllers for the big
> > disks? Is it better to use hardware raid oder software raid
> > (performance)?
> 
> As long as you don't buy pseudo raid solutions like those from promise,
> you should be better off using hardware raid, especially if one of the
> disks fails. Performance-wise linux software raid may be faster.

The other problem I've heard of with hardware RAID is that if you do not
have another of exactly the same RAID controller, it may be impossible to
get your data back if the controller fails.  If you are planning on making
many similar servers, that may not be a problem, but is always something
to be aware of with hardware RAID.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

