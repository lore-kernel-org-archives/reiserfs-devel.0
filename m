From: Adam Nielsen <a.nielsen@shikadi.net>
Subject: Reiserfs fails on read only media
Date: Sun, 17 Apr 2005 11:34:27 +1000
Message-ID: <20050417113427.6d17e413.a.nielsen@shikadi.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23888-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi all,

As a quick method of backing up an old hard drive, I tried to dump the
raw disk image onto a DVD-R, thinking I'd be able to mount the DVD as a
normal reiserfs image.

This almost works, however since the disc is readonly the mount fails
because reiserfs is unable to write to the log:

ReiserFS: hdc: warning: sh-458: journal_init_dev: cannot init journal device 'unknown-block(22,0)': -30
ReiserFS: hdc: warning: sh-462: unable to initialize jornal device
ReiserFS: hdc: warning: sh-2022: reiserfs_fill_super: unable to initialize journal space

I tried using the "nolog" option but it still wants to write to the log.
Is this the correct behaviour?  Shouldn't it completely ignore the log
if you use the "nolog" option?

Cheers,
Adam.
