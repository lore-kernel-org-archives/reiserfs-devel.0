From: Hans Reiser <reiser@namesys.com>
Subject: need opinions from sysadmins on where reiser4progs should install
Date: Sat, 12 Nov 2005 23:17:37 -0800
Message-ID: <4376E891.6070506@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26911-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

currently it installs mkfs.reiser4 and such in /usr/local/sbin

This is not found by default paths for most roots, and seems unlikely to
be where I would want it to go if I was sysadmin....  I would never
install mkfs.anything unless I wanted it in /sbin.....  but then I am
not a professional....

What do the sysadmins on the list think?

Hans


