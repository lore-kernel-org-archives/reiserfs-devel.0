From: Radovan Garabik <garabik@melkor.dnp.fmph.uniba.sk>
Subject: Re: mount reiserfs3 REALLY read only?
Date: Mon, 6 Dec 2004 17:53:37 +0100
Message-ID: <20041206165337.GA25094@melkor.dnp.fmph.uniba.sk>
References: <20041206123706.GA25176@melkor.dnp.fmph.uniba.sk> <1102340556.5598.81.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22694-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1102340557.5598.81.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

On Mon, Dec 06, 2004 at 04:42:36PM +0300, Vladimir Saveliev wrote:

...

>=20
> Before trying to mount ignoring journal you should first make sure that
> journal contains nothing to replay.

I would be willing to tolerate some data corruption, it is better than
not to have those data at all...

> Please send what does debugreiserfs -j /dev/sda say.

you meant debugreiserfs -J, right?
here it is:
jano:~# debugreiserfs -J /dev/sdc1

debugreiserfs 3.6.19 (2003 www.namesys.com)

Filesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x821 of format 3.6 with standard
journal
Count of blocks on the device: 292967344
Number of bitmaps: 8941
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 120166501
Root block: 19823924
Filesystem is NOT clean
Tree height: 5
Hash function used to sort names: "r5"
Objectid map size 972, max 972
Journal parameters:
        Device [0x0]
        Magic [0x122ad61a]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0:
sb_version: 2
inode generation number: 71298401
UUID: 00000000-0000-0000-0000-000000000000
LABEL:
Set flags in SB:
        ATTRIBUTES CLEAN
Journal header (block #8210 of /dev/sdc1):
        j_last_flush_trans_id 2979716
        j_first_unflushed_offset 2941
        j_mount_id 28
        Device [0x0]
        Magic [0x122ad61a]
        Size 8193 blocks (including 1 for journal header) (first block 18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30


>=20
> > Of course, the obvious possibility, copying the partition somewhere and
> > mounting as a loop would probably work, but I do not have those needed =

> > continuous 1.1TB of diskspace...
> >=20
>=20
> If filesystem was never full - it is possible that all the data are in
> the beginning of disk. If it were so, you could copy only beginning of
> disk to good harddrive, resize and mount it.
> debugreiserfs -m /dev/sda should show whether it is possible and how
> many blocks you have to copy. Please send that output as well.

the output is somewhat longer, I put it here (in case you are
interested):
http://kassiopeia.juls.savba.sk/~garabik/junk/reiser.gz

does that "used 1" at the end mean the blocks are really used?
Or is this just for some allocation info?

anyway, the head and tail is:

Filesystem state: consistency is not checked after last mounting

Reiserfs super block in block 16 on 0x821 of format 3.6 with standard
journal
Count of blocks on the device: 292967344
Number of bitmaps: 8941
Blocksize: 4096
Free blocks (count of blocks - used [journal, bitmaps, data, reserved]
blocks): 120166501
Root block: 19823924
Filesystem is NOT clean
Tree height: 5
Hash function used to sort names: "r5"
Objectid map size 972, max 972
Journal parameters:
        Device [0x0]
        Magic [0x122ad61a]
        Size 8193 blocks (including 1 for journal header) (first block
18)
        Max transaction length 1024 blocks
        Max batch size 900 blocks
        Max commit age 30
Blocks reserved by journal: 0
Fs state field: 0x0:
sb_version: 2
inode generation number: 71298401
UUID: 00000000-0000-0000-0000-000000000000
LABEL:
Set flags in SB:
        ATTRIBUTES CLEAN
Bitmap blocks are:
#0: block 17: Busy (0-8210) Free(8211-8211) Busy(8212-9001)
Free(9002-9002) Busy(9003-32767)
used 32766, free 2
#1: block 32768: Busy (32768-65535)
used 32768, free 0
#2: block 65536: Busy (65536-98303)
used 32768, free 0
#3: block 98304: Busy (98304-131071)
used 32768, free 0
#4: block 131072: Busy (131072-163839)
used 32768, free 0

....


#8937: block 292847616: Busy (292847616-292847616)
Free(292847617-292880383)
used 1, free 32767
#8938: block 292880384: Busy (292880384-292880384)
Free(292880385-292913151)
used 1, free 32767
#8939: block 292913152: Busy (292913152-292913152)
Free(292913153-292945919)
used 1, free 32767
#8940: block 292945920: Busy (292945920-292945920)
Free(292945921-292967343) Busy(292967344-292978687)
used 11345, free 21423


--=20
 -----------------------------------------------------------
| Radovan Garab=EDk http://melkor.dnp.fmph.uniba.sk/~garabik/ |
| __..--^^^--..__    garabik @ melkor.dnp.fmph.uniba.sk     |
 -----------------------------------------------------------
Antivirus alert: file .signature infected by signature virus.
Hi! I'm a signature virus! Copy me into your signature file to help me spre=
ad!
