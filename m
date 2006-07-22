From: Dirk <noisyb@gmx.net>
Subject: serious Reiser4 fsck problem
Date: Sat, 22 Jul 2006 12:08:58 +0200
Message-ID: <44C1F93A.9090109@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29131-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,
will using

fsck.reiser4 --build-fs

result in data loss? I mean to fix the partition - NOT to lose the data
on it..

The manual page is also not very specific about if data will be lost or
not when using this option...

Using --fix resulted in a message that I should use --build-fs to remove
corruption...

Thanks,
Dirk

