From: Eriberto <eriberto@eriberto.pro.br>
Subject: tail packing don't works with tails
Date: Thu, 11 Jan 2007 23:57:37 -0200
Message-ID: <eo6puj$eao$1@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30374-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello all,

I have a Debian Etch and a partition formated with ReiserFS 3.6. When I
put a file less than 4 KB in this partition, the df command don't show a
variation. Example:

# df /dev/hda7
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/hda7              9477976     32840   9445136   1% /mnt

# dd if=/dev/zero of=/mnt/3k count=1 bs=3k

# df /dev/hda7
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/hda7              9477976     32840   9445136   1% /mnt

Well, the used space didn't modified. Then the new file was stored in
the BTree. But when I make a file with 5 KB, two blocks (8 KB) are
occupied. Example:

# df /dev/hda7
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/hda7              9477976     32840   9445136   1% /mnt

# dd if=/dev/zero of=/mnt/5k count=1 bs=5k

# df /dev/hda7
Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/hda7              9477976     32848   9445136   1% /mnt

I think a file with 5 KB must occupy one block only (4 KB) and 3 KB must
be put in the BTree. I would like to know if I am right.

Thanks,

Eriberto - Brazil

