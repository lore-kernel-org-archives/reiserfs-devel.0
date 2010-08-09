From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4 for 2.6.35
Date: Mon, 09 Aug 2010 14:48:21 +0200
Message-ID: <4C5FF915.1010801@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Please, note, that in the latest release (04-Aug-2010)
http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/

reiser4 over loop devices doesn't work.
Also there can be oopses after umount (8): kernel BUG at fs/inode.c 
(line 311).
Will be fixed, but it will take a time, so feel free to look at this...

Thanks,
Edward.
