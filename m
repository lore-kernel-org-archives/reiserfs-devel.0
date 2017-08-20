From: jose@huitzilopochtli.metztli-it.com (Metztli Information Technology)
Subject: reiser4[StorageManager(2383)]: lzo1_alloc...
Date: Sun, 20 Aug 2017 10:15:13 -0700 (PDT)
Message-ID: <20170820171513.B783215FEAF@huitzilopochtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1503249319; h=From: Date: Message-Id: To: Subject: Sender;
 bh=xTpmVil4K/qjY27XTeaWNScThKRBvi7XvWzSBjiMSZI=; b=HedAuW4tyMI9J6K0/0cWZztqoBvK21IEyPGUJKpYY8RBvutyIxmbpjRNkEzEpMC6+BlAgmzu
 YLQanKKjDFjctiO04V4U15UB1sFa7ebdYie9YFNWIVaRqnq2nILNth9cJQEJUKJrHIMfx53u
 7nk1ehUF/LbdQ84k8PahjW/F6Wg=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Niltze, Ed-

Although I am using your latest Reiser4 patch for Linux kernel 4.12.x on a test 1.2TB (transparent compression) reiser4 root fs, I have seen
dmesg generate the following in lesser version patches and in much smaller partitions, i.e., 20Gb -- with transparent compression, too.

Your input would be greatly appreciated:

[ 3449.944653] reiser4[StorageManager(2383)]: lzo1_alloc (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
               WARNING: alloc workspace for lzo1 (tfm action = 1) failed

[ 3449.944674] reiser4[StorageManager(2383)]: lzo1_alloc (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
               WARNING: alloc workspace for lzo1 (tfm action = 1) failed

[ 3449.944694] reiser4[StorageManager(2383)]: lzo1_alloc (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
               WARNING: alloc workspace for lzo1 (tfm action = 1) failed

[ 3449.944715] reiser4[StorageManager(2383)]: lzo1_alloc (/mnt/chiucuetetl/usr/src/linux/fs/reiser4/plugin/compress/compress.c:241)[edward-878]:
               WARNING: alloc workspace for lzo1 (tfm action = 1) failed

[snip]
( the above replicate for about two(2) thousand lines )

Please note that the error above is not immediate but is triggered possibly by multiple events run simultaneously, i.e.,
 plugged 1TB USB hard disk with multiple partitions where copy operation to local disk is being run; another copy operation to-from local hard
disk itself on same filesystem; installing additional packages, building local software, etc.

Subsequently system slows down in latency and fan use increases in all instances.

Thank you in advance for your insight.


Best Professional Regards.
