From: "Serge Rodrigues" <serge@onpoi.net>
Subject: some troubles with mounting reiserfs
Date: Sun, 27 Apr 2003 12:25:18 +0200
Message-ID: <000001c30ca7$50708910$0432a8c0@dell8100>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0001_01C30CB8.13F95910"
Return-path: <reiserfs-list-return-13833-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

------=_NextPart_000_0001_01C30CB8.13F95910
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi all,

 

            I have some troubles when I want to mount a reiserfs
partition I use the command :

 

            Mount -t reiserfs /dev/hdb1 /mnt/xxx

 

            The result is

 

            Mount : wrong fs type, bad options, bad superblock on
/dev/hdb1 or too many mounted file systems

 

            I've tried 

 

fsck.reiserfs -check

 

            The result :

 

                        The problem has occurred looks like a hardware
problem

                        Check your hard drive badblocks

 

                        Bread : Cannot read the block (17760256)

 

            Try :

 

            Badblocks -n -s -b 4096 /dev/hdb1 18000000 17700000

 

            The Result :

 

            All seems ok

 

            When I use : 

 

debug.reiserfs /dev/hdb1

 

The Result :

 

<-------------debugreiserfs, 2002------------->

reiserfsprogs 3.6.4

 

 

Filesystem state: consistent

 

Reiserfs super block in block 16 on 0x341 of format 3.6 with standard
journal

Count of blocks on the device: 20010808

Number of bitmaps: 611

Blocksize: 4096

Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 11317287

Root block: 8384

Filesystem is cleanly umounted

Tree height: 4

Hash function used to sort names: "r5"

Objectid map size 2, max 972

Journal parameters:

        Device [0x0]

        Magic [0x0]

        Size 8193 blocks (including 1 for journal header) (first block
18)

        Max transaction length 0 blocks

        Max batch size 0 blocks

        Max commit age 0

Blocks reserved by journal: 0

Fs state field: 0x0

sb_version: 2

inode generation number: 94

UUID: 00000000-0000-0000-0000-000000000000

LABEL:

Set flags in SB:

 

 

How to solve this problem ??

 

 

Thx a lot

 


------=_NextPart_000_0001_01C30CB8.13F95910--


