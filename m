From: Roland =?iso-8859-1?q?H=E4der?= <webmaster@autoinstaller.de>
Subject: Re: Fwd: Bad root block 0
Date: Mon, 8 Sep 2003 18:55:53 +0200
Message-ID: <200309081855.53308.webmaster@autoinstaller.de>
References: <200309071446.32049.webmaster@autoinstaller.de> <200309081715.01529.webmaster@autoinstaller.de> <20030908153427.GA28885@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15596-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030908153427.GA28885@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello,

> > Opps: Vanilla 2.4.21 with cryptoloop (not patched, it's compiled
> > alone and installed into /lib/modules/2.4.21/xxxxx)
>
> Ah, ok.
:-)

> What debugfs command found the metadata? Was it just plain
> "debugreiserfs -p"? How much leaves/internal nodes were found?

debugreiserfs /dev/loop3:

debugreiserfs 3.6.11 (2003 www.namesys.com)
 
 
Filesystem state: consistency is not checked after last mounting
 
Reiserfs super block in block 16 on 0x703 of format 3.6 with standard journal
Count of blocks on the device: 24492
Number of bitmaps: 1
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved] blocks): 24492
Root block: 0
Filesystem is cleanly umounted
Tree height: 65535
Hash function used to sort names: "r5"
Objectid map size 2, max 972
Journal parameters:
        Device [0x0]
        Magic [0x9cdd049]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0xfa02:
        FATAL corruptions exist.
sb_version: 2
inode generation number: 0
UUID: 7691903f-ec2b-4c06-9cf2-eaa545c7db77
LABEL: Haspa-Banking
Set flags in SB:
        ATTRIBUTES CLEAN

debugreiserfs -d /dev/loop3:

debugreiserfs 3.6.11 (2003 www.namesys.com)
 
Loading on-disk bitmap .. 8216 bits set - done
super block..ok
bitmaps..(1).. ok
journal (from 18 to 8210)..ok
Super block, bitmaps, journal - 8195 blocks - done, 23 blocks left
0%....20%....40%....60%....80%....100%                           left 0, 0 /sec
Packed 8195 blocks:
        compessed 0
        full blocks 8195
                leaves with broken block head 0
                corrupted leaves 0
                internals 0
                descriptors 0
data packed with ratio 1.00

Hope this is enougth?

Roland

