From: <doiggl@velocitynet.com.au>
Subject: Could a 'port' be made of resize_reiserfs to cater for a reiser4 volume ?
Date: Mon, 03 Oct 2016 21:35:05 +1100
Message-ID: <ab9a5c64927a62d5e91c817633f2d010@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hello
Could a 'port' be made of resize_reiserfs to cater for a reiser4 volume ?
Is it possible ? 
What steps needed ?
What reiser4 code could be used ?
--Glenn

# r3
# resize_reiserfs 
Usage: resize_reiserfs  [-s[+|-]#[G|M|K]] [-fqvV] device

#
# osc ls   openSUSE:Leap:42.2:Rings:1-MinimalX  reiserfs 
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


urls
#
https://build.opensuse.org/package/show/openSUSE:Leap:42.2:Rings:1-MinimalX/reiserfs
https://build.opensuse.org/package/show/filesystems/reiser4prog

