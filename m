From: Anders Aagaard <aagaande@gmail.com>
Subject: Tested reiser4 and got some problems.
Date: Thu, 07 Aug 2008 15:28:44 +0200
Message-ID: <489AF88C.2090605@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:content-type
         :content-transfer-encoding;
        bh=jkLkAkmbHM+c/LH7ZhCcxjawkJSI96tSg3v8twVrfzY=;
        b=cNkw+5MhP4OHEz6h2mS3YtDA2JKEExy3smespVHHgMy8IP3qg9PazSY+viEhjYZUof
         cE6ZLlkgixBqkZ5OSK/fOIsEJvF2qX0jybIt27F6ZJDkseUBORds1P97HmdFKczGZ6ri
         e0PkOxSnl63zaen3Rhkif4y3ovatEN+HsnNKI=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Hi

I just tested reiser4, and ran into some problems right away, with 
reiser4progs 1.0.6 and patches from 
http://www.kernel.org/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/. 
  Patched on top of gentoo-sources 2.6.25.

After executing this on my test box:
mkfs.reiser4 -o create=ccreg40,compress=lzo1 /dev/sdb2
mount -t reiser4 -o noatime /dev/sdb2 /mnt/sdb
cd /mnt/sdb
rsync -vax --exclude  "/dev/" --exclude  "/proc/" --exclude "/sys" 
--exclude "/mnt" --progress / .
mkdir -p dev sys proc mnt mnt/cdrom
mknod dev/console c 5 1
mknod dev/null c 1 3
cd ..
umount /mnt/sdb
fsck.reiser4 /dev/sdb2

fsck finds TONS of errors like this:
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (718264), item 
(6),
[67e01:2e524541444d45:67f16] (stat40): wrong bytes (65536), Should be 
(310).
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (718264), item 
(8),
[67e01:2e73657475702e:67f18] (stat40): wrong bytes (65536), Should be 
(152).
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (718264), item 
(9),
[67e01:2e73657475702e:67f19] (stat40): wrong bytes (65536), Should be 
(416).
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (718264), item 
(7),
[67e01:2e6d697373696e:67f17] (stat40): wrong bytes (65536), Should be 
(1635).
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (718103), item 
(2),
[67dcc:2e74627a32746f:67f0f] (stat40): wrong bytes (65536), Should be 
(2223).
         Found 360227 objects (some could be encountered more then 
once).
	Time interval: Thu Aug  7 14:01:13 2008 - Thu Aug  7 14:03:40 2008

After completing the fsck things seem fine, but it makes me slightly 
worried.  There's no kernel oops'es or anything like that in dmesg, 
everything seemed perfectly fine until I did an fsck.  Note that this is 
repeatable.

Anders
