From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Re: reiser4 enabled livecd
Date: Wed, 14 Apr 2004 14:12:40 +0200 (MEST)
Message-ID: <Pine.LNX.4.21.0404141338510.31309-100000@mlf.linux.rulez.org>
References: <20040414112416.GA15922@alias.nmd.msu.ru>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17926-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040414112416.GA15922@alias.nmd.msu.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>


Hello,

Talking about livecd's, I'd mention that Recovery Is Possible has also
Reiser4. It's very often updated, kernel 2.6.5 and as I noticed it always
has the latest from everything and only 26 MB download:

      http://www.tux.org/pub/people/kent-robotti/looplinux/rip/

I made some "real world" ntfsclone benchmarks what I use very often during
NTFS development (e.g. test suite). It reads the NTFS allocation bitmap,
seeks to the used data positions on the source device, seeks to the same
position in the destination sparse file or block device and copy the data
thus the clone is immediately mountable.

Resiser4 beat everybody: ext2, ext3, xfs, reiserfs, jfs and even including
raw cloning between partitions! I've never seen such before for any
filesystem, it _indeed_ optimizes the disk seeks significantly.

It was about 5% faster than raw cloning and at least 10% faster then the
next fastest filesytems (ext2 and xfs). I can send full details if one is
interested.

Congratulations!

	Szaka

