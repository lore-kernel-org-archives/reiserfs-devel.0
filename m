From: Chris Worley <chrisw@lnxi.com>
Subject: Permission denied on access to files; even as root
Date: Sun, 16 Jun 2002 17:15:58 +0000 (UTC)
Message-ID: <1024353028.26879.10577.camel@xserver>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10743-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I've got a couple hundred files that seem to be in a bad state since I
tried (unsuccessfully) converting my file system, for example (as root):

/usr/bin # ls -l gdb
ls: gdb: Permission denied
/usr/bin # mv gdb gdb.bak
mv: cannot stat `gdb': Permission denied
/usr/bin # chmod a+r gdb
chmod: getting attributes of `gdb': Permission denied

Any idea what has happened and how to recover these files?

Thanks,

Chris

