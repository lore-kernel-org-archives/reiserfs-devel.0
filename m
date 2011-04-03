From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for Linux-2.6.38
Date: Mon, 04 Apr 2011 00:01:31 +0200
Message-ID: <4D98EE3B.9040109@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Hello, everyone.

. Fixed bug in on-demand bitmap loading [1*];
. Cleanup/restore journal info to not confuse other
   journalling file systems [2*].

1*) http://marc.info/?l=reiserfs-devel&m=130100295519456&w=2
2*) http://marc.info/?l=reiserfs-devel&m=129936482701793&w=2

Please, find at
http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6

Thanks,
Edward.
