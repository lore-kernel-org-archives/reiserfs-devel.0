From: Domenico Andreoli <cavok@libero.it>
Subject: typo: failed to genetate UUID? what's it?
Date: Tue, 13 Jan 2004 15:12:01 +0100
Message-ID: <4003FCB1.4030205@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16480-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

i suppose this is an error message...

~/devel/reiserfsprogs-3.6.11$ grep genetate . -R
./fsck/super.c:         fsck_log ("rebuild-sb: no uuid found, failed to genetate UUID\n");
./tune/tune.c:              message ("failed to genetate UUID\n");
./mkreiserfs/mkreiserfs.c:          reiserfs_warning (stderr, "failed to genetate UUID\n");

please fix it in 3.6.12

what does it really mean? is something i need to worry? i sometimes receive
it when i'm formatting a new reiserfs partition.

dom

-----[ Domenico Andreoli, aka cavok
  --[ http://filibusta.crema.unimi.it/~cavok/gpgkey.asc
    ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50

