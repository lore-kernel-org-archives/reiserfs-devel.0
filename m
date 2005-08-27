From: =?ISO-8859-1?Q?Miguel_Ernesto_P=E9rez_Cabrera?= <solohayuno@gmail.com>
Subject: what if I touch a reiser4 partition and ...
Date: Sat, 27 Aug 2005 01:44:49 -0400
Message-ID: <2b973fa605082622442afd3040@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25655-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello, group.

I was wondering If after a sfdisk resize of a disk, and leaving the
reiser4 partitition unchanged, Is it posible to remount the reiser4
partition?

I'm not sure, but for what I see, the answer is no... but I would like
to be desagree with this. Please!

This was how my disk looks like before resizing...
Disk /dev/hdd: 238216 cylinders, 16 heads, 63 sectors/track
Units =3D cylinders of 516096 bytes, blocks of 1024 bytes, counting from 0

   Device Boot Start     End   #cyls    #blocks   Id  System
/dev/hdd1   *      0+   2080    2081-   1048823+  83  Linux
/dev/hdd2          0       -       0          0    0  Empty
/dev/hdd3          0       -       0          0    0  Empty
/dev/hdd4       2081  238215  236135  119012040   85  Linux extended
/dev/hdd5       2081+  85301   83221-  41943383+  83  Linux
/dev/hdd6      85302+ 120670   35369-  17825975+  83  Linux
/dev/hdd7     120671+ 122261    1591-    801863+  82  Linux swap / Solaris
/dev/hdd8     122262+ 123712    1451-    731303+  83  Linux
/dev/hdd9     123713+ 154920   31208-  15728831+  83  Linux
/dev/hdd10    154921+ 238215   83295-  41980679+  83  Linux

I was looking a way to delete hdd6, hdd8, hdd9 and hdd10, put hdd7
(swap) at the end and increment hdd5 just before swap partition.

but after doing this, and mounting the reiser4 partition, I just get
an empty filesystem :s, why?

All I have done is to change partition size with sfdisk and run
mkfs.reiser4 on hdd1 hdd5 and run fsck on both. Do I lose my data? or
it still missing arround there?

Miguel
