From: Tommi Sakari Uimonen <tuimonen@cc.hut.fi>
Subject: accidentally formatted vfat over reiserfs, recoverable?
Date: Fri, 19 Sep 2003 19:17:52 +0300 (EEST)
Message-ID: <Pine.OSF.4.58.0309191844050.245847@kosh.hut.fi>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15708-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hi. I had a reiserfs (3.6.11 from debian unstable) partition and I made a
'mkfs.vfat -F 32' on it. Is there any chance of getting the data from the
old reiserfs partition?

I have not written onto it since, and mkfs.vfat performed it's duties very
promptly, so I guess it just wrote something  "small" to the beginning of
the partition. (The partition is  about 100GB so I would have noticed if
it had done some serious formatting on it)

Maybe some dd if=/dev/hdb5 of=... magic or what?

Tommi Uimonen


