From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser5: Parallel scaling out on local hosts. Numbers!
Date: Sun, 10 Apr 2022 18:12:34 +0200
Message-ID: <488ed272-d2ee-d311-aa0c-23eb212b21bf@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=n3XGAdzzz/+5bT8q+RENXVS4bI+kwN6cAFNKDEuZ0CM=;
        b=fvJKrQJTDmhHz0iOM8fM0KwsGjkIykaNWD1jdY+C9TWjGFr+d6dYicINChuFgTeoAA
         jNK+GFEKcCY3Rcjm2pYFIkGxSGF3LavBhM3mzAKr/4AvCAVoEleq/jbxVcgwXaPhkJfk
         QHAnb2/pscghhG1kaQtwNiYqr7lLAEgwornR2G0tvnUHL/Ip0MUqElhw/RcK+LWpAJdu
         wi9HMrUhzloQnkUoU21IW3cv0WTOGA27tnZmRFKJ+c654Hs5qAQbTEcThr8Mwb/AGHJ6
         Udkv38Pgi04b1HXI1hjJJZzMyws9j45MDIntOEAgp2/wBQyBrw8ikvQbrmK6anfnCslv
         Q2Wg==
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Andy Lavr <andy.lavr@gmail.com>

Hi all,

Earlier we announced a logical volume manager with parallel scaling out
on local hosts, which is different from the traditional RAID arrays and
is more like volume managers of networking file systems:
https://reiser4.wiki.kernel.org/index.php/Logical_Volumes_Background

Here we provide some numbers for the latest Reiser5 software release.

Note that performance of volume operations have different topicality.
E.g. performance of device removal is more topical than performance of
adding a device. Indeed, user usually wants the deleted device to go to
other needs immediately, whereas, when adding a device he gets more disk
space immediately after issuing the command (there is no need to wait
for rebalancing completion).



Hardware:

Dell OptiPlex 7050 6C2XR, Intel Core i7-7700, 16GB RAM
(4 Cores / 8 Threads)

Storage media:

DEV1: Lite-On LCS-256M6S, SSD 256GB, SATAIII, 2.5"
DEV2: Intenso 2.5" SSD TOP, 256G, SATAIII, 2.5"
DEV3: Intenso 2.5" SSD TOP, 256G, SATAIII, 2.5"
DEV4: Intenso M.2  SSD TOP, 256G, SATAIII, m.2 2280
RAM0: Block device in RAM


Software:

Reiser4-for-5.16.patch (software release 5.1.3), download at:
https://sourceforge.net/projects/reiser4/files/v5-unstable/kernel/reiser4-for-5.16.patch.gz/download


Reiser4progs-2.0.5 (software release 5.1.3), download at:
https://sourceforge.net/projects/reiser4/files/v5-unstable/progs/reiser4progs-2.0.5.tar.gz/download




                Sequential RAW operations


Data set: 10G at zero offset


1. Read from RAW device

Device     Speed, M/s

   DEV1         470
   DEV2         530


2. Write to RAW device

Device     Speed, M/s


   DEV1        390
   DEV2        420



              Sequential file operations


Stripe size: 128K
Data set: one 10G file



            1. Read/Write a large file, Speed (M/s)



Nr of Disks in the Volume       Write               Read

  1 (DEV1)                        380                 460
  1 (DEV2)                        410                 518
  2 (DEV1+DEV2)                   695                 744
  3 (DEV1+DEV2+DEV3)              890                 970
  4 (DEV1+DEV2+DEV3+DEV4)         950                1100



             2. Copy data from/to formatted device



  From device                  To device           Speed (M/s)

      DEV1                        DEV2                260
      DEV2                        DEV1                255


                         Volume operations


Stripe size: 128K
Data set: one 10G file


Speed of any volume operation is defined as D/T, where
D - total amount of data stored on the volume
T - operation time (including full data rebalancing/migration and sync)
Caches are dropped before each operation.

More details about logical volumes management can be found here:
https://reiser4.wiki.kernel.org/index.php/Logical_Volumes_Administration



              1. Adding a device to a logical volume



      Volume             Device to add              Speed M/s

  DEV1                        DEV2                     284
  DEV1+DEV2                   DEV3                     457
  DEV1+DEV2+DEV3              DEV4                     574


               2. Removing a device from a logical volume



     Volume              Device to remove           Speed M/s

  DEV1+DEV2+DEV3+DEV4         DEV4                     890
  DEV1+DEV2+DEV3              DEV3                     606
  DEV1+DEV2                   DEV2                     336



                    3. Flushing a proxy device



More details about proxy device management can be found here:
https://reiser4.wiki.kernel.org/index.php/Proxy_Device_Administration

Before each operation all data of the logical volume are on the proxy
device. After the operation all the data are on the permanent storage
denoted as "Volume".


     Volume                Proxy device             Speed M/s


  DEV1                         DEV4                    228
  DEV1+DEV2                    DEV4                    244
  DEV1+DEV2+DEV3               DEV4                    290


  DEV1                         RAM0                    283
  DEV1+DEV2                    RAM0                    301
  DEV1+DEV2+DEV3               RAM0                    374
  DEV1+DEV2+DEV3+DEV4          RAM0                    427



                     4. Migrating a file



More details about file migration in Reiser5 volumes can be found here:
https://reiser4.wiki.kernel.org/index.php/Transparent_File_Migration

Before each operation all data of the file are fairly distributed among
all devices-components of the logical Volume. After the operation all
file's data are stored on the Target device.


     Volume                Target Device            Speed M/s


DEV1+DEV2+DEV3+DEV4           DEV1                     387
DEV1+DEV2+DEV3                DEV1                     403
DEV1+DEV2                     DEV1                     427


Comment. With increasing number of components, the speed of file
migration approaches (from top) the write speed to the formatted device
DEV1 (380 M/s).



                            Comments



Parallel O(1)-defragmentor of compound Reiser5 volumes is in plans!
Proxy devices are also a subject of defragmentation.

All file and volume operations are a subject of further performance
improvements. Currently IO requests against devices-components of a
logical volume are submitted by the same thread. This serialization
factor leads to performance drop. Once the software stability reaches
beta level, the things should be parallelized. Also currently for
simplicity _all_ data are read from the volume during its re-balancing.
It would be more reasonable to read only those data which are a subject
of migration.

Theoretical limit for the speed of adding(removing) a second device is a
double copy speed from DEV1 to DEV2 (respectively from DEV2 to DEV1).
Currently we have respectively 1.1 and 1.3 of the copy speed.
