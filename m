From: "Webservice" <info@webservice.be>
Subject: Problems with accessing directory
Date: Tue, 29 May 2001 18:14:28 +0200
Message-ID: <002101c0e85a$6faad060$8a455351@shanasola26yqz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24200-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Kurt Ghekiere <Kurt@ris.be>

After a new build off a server we keep getting problems with it.
The server is in software raid-1 (mirroring) with slackware 10.1 and
reiserfs.

When accessing a particulary directory, the systems hangs with a kernel
panic (mapping memory).
Memory has been changed twice without any effect.

When starting up the machine we got lot (hundreds) of thes messages:
md:reiserfsck (pid 106) used obsolete MD ioctl,  upgrade your software to
use new
ictls.
Then machine boots further, and it works normally until we access a
perticulair directory.
The server reboots or hangs with a kernel panic (mapping virtual memory)
Switching to init 1 and then reiserfsck --rebuild-tree reports errors which
can be fixed, but the problems still remains.

/proc/mdstat gives no errors
Personalities : [linear] [raid0] [raid1] [raid5]
read_ahead 1024 sectors
md0 : active raid1 sdb2[1] sda2[0]
      19542976 blocks [2/2] [UU]

md1 : active raid1 sdb3[1] sda3[0]
      19542976 blocks [2/2] [UU]

md2 : active raid1 sdb5[1] sda5[0]
      19542976 blocks [2/2] [UU]

md3 : active raid1 sdb6[1] sda6[0]
      17293824 blocks [2/2] [UU]

unused devices: <none>

any ideas?


Thx in advandce...

