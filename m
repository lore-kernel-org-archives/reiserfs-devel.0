From: <doiggl@velocitynet.com.au>
Subject: Is it possible to obtain a list of file-names from the Reiser4 meta data ?
Date: Mon, 30 May 2016 20:42:36 +1000
Message-ID: <c686a1ebbc96ebd395fb8477b6f68044@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Hello
Ivan Shapovalov.

Question:
Is it possible to obtain a list of file-names from the Reiser4 meta data ?

If so how is it done ?

I have a copy of unpacked Reiser 4 meta data

I'm using
#  rpm -qa |grep -i reiser4 |sort
kernel-reiser4-4.6.0-1.1.x86_64
libreiser4-1_0-6-1.0.6-44.1.x86_64
libreiser4-1_1-0-1.1.0-1.1.x86_64
reiser4progs-1.1.0-35.1.x86_64


# ll metadata-sdb.bz2
-rw-r--r-- 1 root root 2098194393 May 28 17:17 metadata-sdb.bz2

2,098,194,393

# ll metadata-sdb.bz2

unpacked:

# bunzip2 metadata-sdb.bz2

# ll metadata-sdb
-rw------- 1 root root 13401743360 May 30 18:20 metadata-sdb
13,401,743,360


I cannot run command '# mount /dev/sdb  /media/disk' because of 'Wrong
order of keys.'

Use opensuse, linux kernel is  patched with reiser4-for-4.6.0.patch and
boots

# fsck.reiser4 -V
fsck.reiser4 1.1.0
Format release: 4.0.1
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING.


Thanks for the help
--Glenn
