From: Dirk Meul <dirk.meul@epost.de>
Subject: "reiserfsck --rebuild-tree" fails
Date: 25 Sep 2002 09:48:04 +0200
Message-ID: <1032940085.27530.6.camel@riggs>
References: <3D839BC3000BAB31@mail.epost.de> (added by
	postmaster@mail.epost.de)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11525-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3D839BC3000BAB31@mail.epost.de> (added by
	postmaster@mail.epost.de)
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello.

I've a big problem with my ReiserFS partition. I got OOPS when trying to
delete a file so i run:
# reiserfsck --fix-fixable /dev/discs/disc2/part3
It told me to rebuild tree so i did:
# reiserfsck --rebuild-tree /dev/discs/disc2/part3
But after 80% of rebuilding following messages appeare in syslog:
dma_intr: status=0x51 { DriveReady SeekComplete Error }
dma_intr: error=0x40 { UncorrectableError }, LBAsect=155297397,
sector=XXXXXXXX

With linux-2.4.20-pre7-ac2 reiserfsck aborts. If i use linux-2.4.20-pre7
my PC locks.

I'm using Debian GNU/Linux sid, so i'm using the reiserfsprogs version
3.6.3.

Is it possible to recover part of the partition?

Regards,
-- 
Dirk Meul <dirk.meul@epost.de>


