From: <doiggl@velocitynet.com.au>
Subject: asking a question about resize_reiserfs port to cater for a reiser4 volume.
Date: Wed, 05 Oct 2016 00:12:02 +1100
Message-ID: <51373b5d400bc673662dbbe9983a7bd4@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org
Cc: zam@namesys.com

Hello,

Is this the correct place to ask about asking a question about
resize_reiserfs port?
Cheers
--Glenn

Could a 'port' be made of resize_reiserfs to cater for a reiser4 volume ?

This   version   of  resize_reiserfs  has  been  written  by  Alexander
Zarochentcev <zam@namesys.com>.

info:
http://manpages.ubuntu.com/manpages/trusty/man8/resize_reiserfs.8.html#contenttoc6

#
I can test on a Reiser4 volume [uses entire disk].
Only 43% is used so 1.8T [entire disk] - 747G [used] = 57% [free space]
--Glenn

# r3
# resize_reiserfs 
Usage: resize_reiserfs  [-s[+|-]#[G|M|K]] [-fqvV] device

#
# osc ls  openSUSE:Leap:42.2:Rings:1-MinimalX reiserfs
_link
# -> openSUSE:Leap:42.2 reiserfs (latest)
debugreiserfs-fix-use-after-free-while-closing-log
reiserfs.changes
reiserfs.spec
reiserfsprogs-3.6.24-22-g57eac84.tar.bz2
silent-rules.patch

r4
# osc ls    filesystems  reiser4progs 
_link
reiser4progs-1.1.0.tar.gz
reiser4progs.changes
reiser4progs.spec
# -> openSUSE:Factory reiser4progs (latest)
reiser4progs-1.1.0.tar.gz
reiser4progs.changes
reiser4progs.spec

https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-4.x/
reiser4-for-4.7.0.patch.gz 	2016-08-09 	624.8 kB
README.txt 	2016-08-09 	3.0 kB

#urls:
http://manpages.ubuntu.com/manpages/trusty/man8/resize_reiserfs.8.html#contenttoc6
https://build.opensuse.org/package/show/openSUSE:Leap:42.2:Rings:1-MinimalX/reiserfs
https://build.opensuse.org/package/show/filesystems/reiser4prog
https://bugzilla.gnome.org/show_bug.cgi?id=772387
