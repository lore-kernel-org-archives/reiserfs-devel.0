From: Dr Aldo Medina <aldomedina@hotpop.com>
Subject: reiserfsck goes to and endless loop
Date: 27 Apr 2003 22:56:47 -0500
Message-ID: <1051499797.12231.27.camel@linuxclient>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13840-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Trying to recover some deleted file, I used losetup /dev/loop0
backupcopy (being this a backup of the partition). I then use reiserfsck
--rebuild-tree -S /dev/loop0. I've tried ru 




