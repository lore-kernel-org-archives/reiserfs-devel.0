From: Ingo Bormuth <ibormuth@efil.de>
Subject: ISATTY_BITS set on every file using ccreg40
Date: Mon, 17 Dec 2007 00:25:00 +0100
Message-ID: <20071216232500.GA2314@efil.de>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org


Hi Edward,

I just played around with reiser4's cryptcompress plugin
an realized an odd behaviour.

It seems, every file on any partition made with '-o ccreg40'
has its SATTY_BITS set:

$mkfs.reiser4 /dev/hdaXX
$mount /dev/hdaXX /mnt/test
$touch /mnt/test/x; exec 3<>/mnt/test/x; test -t 3 && echo T || echo F; exec 3>&-
F
$umount /mnt/test
$mkfs.reiser4 -o create=ccreg40 /dev/hdaXX
$mount /dev/hdaXX /mnt/test
$touch /mnt/test/x; exec 3<>/mnt/test/x; test -t 3 && echo T || echo F; exec 3>&-
T

$mkfs.reiser4 -V
mkfs.reiser4 1.0.6
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by reiser4progs/COPYING.

$cat /proc/version
Linux version 2.6.23.9-reiser4-r2 (gcc version 4.1.2) #1 PREEMPT Fri Dec 14 19:34:05 CET 2007


Great performance andspace efficiency, no further problems, great job, btw.




-- 
Ingo Bormuth, voicebox & fax: +49-(0)-12125-10226517
public key 86326EC9, http://ibormuth.efil.de/contact

