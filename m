From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: My mistake....
Date: Thu, 11 Jul 2002 12:50:26 -0600
Message-ID: <20020711185026.GH1045@clusterfs.com>
References: <000b01c228db$3a1b1f00$0e01a8c0@englishbay.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10983-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <000b01c228db$3a1b1f00$0e01a8c0@englishbay.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian <brian@english-bay.com>
Cc: reiserfs-list@namesys.com

On Jul 11, 2002  06:02 -0700, Brian wrote:
> I deleted the partition, rebooted and repartioned exactly as before. I have
> run reiserfsck and rebuilt everything BUT when I try to mount the partition
> "mount" insists it's still an empty ext3 filesystem.

To overwrite the ext2/ext3 superblock:
dd if=/dev/zero of=/dev/<whatever> bs=1k count=1 seek=1

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/

