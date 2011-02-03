From: Gleb Baryshev <gleb.baryshev@gmail.com>
Subject: fsck.reiser4 (libaal-1.0.5) segfault
Date: Thu, 03 Feb 2011 11:20:16 +0300
Message-ID: <4D4A6540.5070401@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=N20/NqZWFwxHXAjn+BTsvbx42VidbWLWLWhRBrL6ztE=;
        b=LrHXptvVBIVzg0hJcGrQV5/4HLrYwnE8v6Hk87wM2DKI6hTm03N2cAbDLhYv3/tPra
         uEYB73PI3Iw+VxWNzIpXmfoI9WqqX5cUFzqJbYV06XIuGex35+qM4fjU975Mc/l98IS5
         6jaByjU8NOI6lXdYCcrlnVW6WnZLwTPAO4xTY=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Hello

I encountered segmentation fault when checking reiser4 partition. Here 
is fsck output:


*******************************************************************
This is an EXPERIMENTAL version of fsck.reiser4. Read README first.
*******************************************************************

Fscking the /dev/sda10 block device. 

Will check the consistency of the Reiser4 SuperBlock. 

Will check the consistency of the Reiser4 FileSystem. 

Continue? 

(Yes/No): Yes
***** fsck.reiser4 started at Thu Feb  3 07:39:51 2011
Reiser4 fs was detected on /dev/sda10. 

Master super block (16):
magic:		ReIsEr4
blksize:	4096
format:		0x0 (format40)
uuid:		eb887ad5-6151-4076-bbac-f413f7d7f0b2
label:		SRC

Format super block (17):
plugin:		format40
description:	Disk-format plugin.
version:	0
magic:		ReIsEr40FoRmAt
mkfs id:	0x549b325f
flushes:	0
blocks:		2622592
free blocks:	1900771
root block:	937012
tail policy:	0x2 (smart)
next oid:	0x45169
file count:	107030
tree height:	4
key policy:	LARGE


CHECKING THE STORAGE TREE 

FSCK: extent40_repair.c: 167: extent40_check_struct: Node (932329), item 
(0), unit (0),
[441b0:4(FB):737443434c5130:45168:0]: unallocated unit is found.
FSCK: extent40_repair.c: 167: extent40_check_struct: Node (932329), item 
(1), unit (0),
[441b0:4(FB):73746e38357566:45167:0]: unallocated unit is found.
         Read nodes 89014 

	Nodes left in the tree 89014
		Leaves of them 87446, Twigs of them 1540
	Time interval: Thu Feb  3 07:39:52 2011 - Thu Feb  3 07:40:34 2011
CHECKING EXTENT REGIONS. 

         Read twigs 1540 

	Time interval: Thu Feb  3 07:40:34 2011 - Thu Feb  3 07:40:36 2011
CHECKING THE SEMANTIC TREE 

[============\                                      ] 25%Segmentation fault


Backtrace from gdb:


#0  0xb7f59a9c in aal_block_move () from /usr/local/lib/libaal-1.0.so.5
#1  0xb7f88406 in reiser4_tree_alloc_extent () from 
/usr/local/lib/libreiser4-1.0.so.7
#2  0xb7f83af2 in reiser4_tree_walk_node () from 
/usr/local/lib/libreiser4-1.0.so.7
#3  0xb7f83b7a in reiser4_tree_walk_node () from 
/usr/local/lib/libreiser4-1.0.so.7
#4  0xb7f83b7a in reiser4_tree_walk_node () from 
/usr/local/lib/libreiser4-1.0.so.7
#5  0xb7f83d62 in reiser4_tree_adjust () from 
/usr/local/lib/libreiser4-1.0.so.7
#6  0xb7f83db9 in reiser4_tree_mpressure () from 
/usr/local/lib/libreiser4-1.0.so.7
#7  0xb7f84d99 in reiser4_tree_connect_node () from 
/usr/local/lib/libreiser4-1.0.so.7
#8  0xb7f84eb6 in reiser4_tree_load_node () from 
/usr/local/lib/libreiser4-1.0.so.7
#9  0xb7f853be in reiser4_tree_lookup () from 
/usr/local/lib/libreiser4-1.0.so.7
#10 0xb7f80248 in tree_lookup () from /usr/local/lib/libreiser4-1.0.so.7
#11 0xb7fa70ea in obj40_find_item () from /usr/local/lib/libreiser4-1.0.so.7
#12 0xb7fa7f5e in obj40_update_body () from 
/usr/local/lib/libreiser4-1.0.so.7
#13 0xb7fa587d in obj40_check_item () from 
/usr/local/lib/libreiser4-1.0.so.7
#14 0xb7fab249 in reg40_check_struct () from 
/usr/local/lib/libreiser4-1.0.so.7
#15 0xb7f67df0 in repair_object_check_struct () from 
/usr/local/lib/librepair-1.0.so.7
#16 0xb7f6b175 in repair_semantic_check_struct () from 
/usr/local/lib/librepair-1.0.so.7
#17 0xb7f6c966 in cb_object_traverse () from 
/usr/local/lib/librepair-1.0.so.7
#18 0xb7f89148 in reiser4_object_traverse () from 
/usr/local/lib/libreiser4-1.0.so.7
#19 0xb7f89165 in reiser4_object_traverse () from 
/usr/local/lib/libreiser4-1.0.so.7
#20 0xb7f89165 in reiser4_object_traverse () from 
/usr/local/lib/libreiser4-1.0.so.7
#21 0xb7f89165 in reiser4_object_traverse () from 
/usr/local/lib/libreiser4-1.0.so.7
#22 0xb7f89165 in reiser4_object_traverse () from 
/usr/local/lib/libreiser4-1.0.so.7
#23 0xb7f89165 in reiser4_object_traverse () from 
/usr/local/lib/libreiser4-1.0.so.7
#24 0xb7f6be3f in repair_semantic () from /usr/local/lib/librepair-1.0.so.7
#25 0xb7f6db4d in repair_check () from /usr/local/lib/librepair-1.0.so.7
#26 0x0804af6e in main ()


Let me know if additional details are needed or if I should apply any 
patches.

Regards,
Gleb
