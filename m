From: D_i_F_i@gmx.de
Subject: "no space left" but df -k shows plenty of free space
Date: Sat, 17 May 2003 17:34:09 +0200
Sender: difi
Message-ID: <3EC65671.DA1CB780@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14145-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

while copying some data into a logical volume with reiserfs as
filesystem, I've got an error message, that there isn't enough
space left on the device. Even just creating a new empty file
isn't possible anymore:

sammy:/opt/kgm/data/log # touch abc
touch: creating `abc': No space left on device

But the df-command has still reported quite a lot of free capacity:

sammy:/opt/kgm/data/log # df -k /opt/kgm/data
Filesystem        1k-blocks     Used Available Use% Mounted on
/dev/kgmvg/datalv  10485436  7987364   2498072  77% /opt/kgm/data

If I had used ext2 or ext3, the number of already used inodes could
be the reason for this problem. But this isn't an issue when using
reiserfs as the following command shows:

sammy:/opt/kgm/data/log # df -i /opt/kgm/data
Filesystem            Inodes   IUsed   IFree IUse% Mounted on
/dev/kgmvg/datalv         -       -       -    -  /opt/kgm/data

Even "du -hc /opt/kgm/data/" reports an amount of data, that should
be easily stored into a filesystem with a capacity of 10G:

411M    /opt/kgm/data/ABC/in/new
1.1G    /opt/kgm/data/ABC/in
512     /opt/kgm/data/ABC/log
512     /opt/kgm/data/ABC/out
1.1G    /opt/kgm/data/ABC
129k    /opt/kgm/data/tool
512     /opt/kgm/data/etc
3.9G    /opt/kgm/data/log
2.0M    /opt/kgm/data/tmp
2.3G    /opt/kgm/data/data
25M     /opt/kgm/data/files
1.1M    /opt/kgm/data/names
136M    /opt/kgm/data/kerna
137M    /opt/kgm/data/kernb
180M    /opt/kgm/data/logtool
233k    /opt/kgm/data/buf
57M     /opt/kgm/data/patch13/unpack
75M     /opt/kgm/data/patch13
50M     /opt/kgm/data/patch14/unpack
66M     /opt/kgm/data/patch14
7.9G    /opt/kgm/data
7.9G    total

Only after moving some of the files into another filesystem, I was
able to store further files into this filesystem. So I guessed,
that it should work if I extend the reiserfs by 2G (lvextend and
resize_reiserfs). And as a matter of fact this enlargement worked.

Now, df -k /opt/kfm/data shows:

Filesystem        1k-blocks     Used Available Use% Mounted on
/dev/kgmvg/datalv  12582524  7987360   4595164  64% /opt/kgm/data

Now we can use the filesystem without problems but I fear that we
will run into problems when the filesystem reaches 77% usage again.

The directory with the biggest number of files currently contains
about 70.000 files. I don't think that this is a real challange for
reiserfs. Also the other limits as stated in the FAQ on
http://www.namesys.com/ aren't reached by now.

I'm using reiserfs version 3.6.25 [built into kernel] of a
SLES7-Distribution (SuSE) on IBM zSeries (z900, z/VM) in
64-Bit-Mode (s390x). The filesystem has been resized
3 times on the fly (in mounted state). Could it be, that this
caused the filesystem to get damaged somehow? Or is there a bug
in the df-command, that may cause it to report wrong values for
free capacities? Can it be, that the last enlargement of
the filesystem didn't do its full job so that the problem maybe
disapeared with the next enlargement? Or is it necessary to delete
and recreate the whole filesystem (which would cause us a lot of
trouble)? Or what do you suggest?

Lots of questions. I would appreciate if you could give me some
anwers for at least some of them.

Regards,
Dirk
