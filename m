From: Lars Segelken <lars.segelken@web.de>
Subject: Re: reiserfs partition unmountable
Date: Mon, 04 Apr 2005 21:42:24 +0200
Message-ID: <1112643744.7074.2.camel@localhost.localdomain>
References: <1112453207.7750.0.camel@localhost.localdomain>
	 <20050404115415.GC6211@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23774-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050404115415.GC6211@backtop.namesys.com>
Sender: lars.segelken@web.de
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Am Montag, den 04.04.2005, 15:54 +0400 schrieb Alex Zarochentsev: 
> what kernel used by Knoppix 3.2?
Linux-2.4.20-xfs
> can you send here output of debugreiserfs -J /dev/<the device>
> ?

Here is the output af debugreiserfs:


debugreiserfs 3.6.19 (2003 www.namesys.com)


Filesystem state: consistent

Reiserfs super block in block 16 on 0x343 of format 3.6 with standard
journal
Count of blocks on the device: 33563792
Number of bitmaps: 1025
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 17848334
Root block: 14713007
Filesystem is clean
Tree height: 5
Hash function used to sort names: "r5"
Objectid map size 972, max 972
Journal parameters:
        Device [0x0]
        Magic [0xeaa2e8a]
        Size 8193 blocks (including 1 for journal header) (first block
18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0:
sb_version: 2
inode generation number: 939323
UUID: 201ab3b6-8845-433e-a0c1-f953591c007f
LABEL:
Set flags in SB:
        ATTRIBUTES CLEAN
Journal header (block #8210 of /dev/hdb3):
        j_last_flush_trans_id -1
        j_first_unflushed_offset 4593
        j_mount_id 3
        Device [0x0]
        Magic [0xeaa2e8a]
        Size 8193 blocks (including 1 for journal header) (first block
18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30


Lars


