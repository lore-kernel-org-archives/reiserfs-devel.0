From: "Serge Rodrigues" <serge@onpoi.net>
Subject: RE : some troubles with mounting reiserfs
Date: Mon, 28 Apr 2003 21:33:20 +0200
Message-ID: <001e01c30dbd$09f495f0$0732a8c0@dell8100>
References: <20030428053807.GB22902@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13879-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030428053807.GB22902@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Oleg Drokin' <green@namesys.com>
Cc: reiserfs-list@namesys.com



-----Message d'origine-----
De=A0: Oleg Drokin [mailto:green@namesys.com]=20
Envoy=E9=A0: lundi 28 avril 2003 7:38
=C0=A0: Serge Rodrigues
Cc=A0: reiserfs-list@namesys.com
Objet=A0: Re: some troubles with mounting reiserfs

Hello!

On Sun, Apr 27, 2003 at 12:25:18PM +0200, Serge Rodrigues wrote:
>             I have some troubles when I want to mount a reiserfs
> partition I use the command :
>             Mount -t reiserfs /dev/hdb1 /mnt/xxx
>             The result is
>             Mount : wrong fs type, bad options, bad superblock on
> /dev/hdb1 or too many mounted file systems

>> Well, what kernel version do you use?
>> What are the messages in kernel log? (e.g. run dmesg to see)

The Kernel is 2.4.20 with grsec security patch

Dmseg (resierfs)

reiserfs: checking transaction log (device 03:05) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
VFS: Mounted root (reiserfs filesystem) readonly.
Freeing unused kernel memory: 124k freed
Adding Swap: 530104k swap-space (priority -1)
reiserfs: checking transaction log (device 03:01) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
reiserfs: checking transaction log (device 03:06) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
reiserfs: checking transaction log (device 03:07) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
reiserfs: checking transaction log (device 03:08) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
reiserfs: checking transaction log (device 03:09) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
reiserfs: checking transaction log (device 03:0a) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
reiserfs: checking transaction log (device 03:0c) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
hdb: dma_intr: status=3D0x51 { DriveReady SeekComplete Error }
hdb: dma_intr: error=3D0x40 { UncorrectableError }, LBAsect=3D142082111,
sector=3D142082048
end_request: I/O error, dev 03:41 (hdb), sector 142082048
hdb: dma_intr: status=3D0x51 { DriveReady SeekComplete Error }
hdb: dma_intr: error=3D0x40 { UncorrectableError }, LBAsect=3D147587135,
sector=3D147587072
end_request: I/O error, dev 03:41 (hdb), sector 147587072
sh-2029: reiserfs read_bitmaps: bitmap block (#17760256) reading failed
reiserfs_read_super: unable to read bitmap
blk: queue c034fae4, I/O limit 4095Mb (mask 0xffffffff)
blk: queue c034fc20, I/O limit 4095Mb (mask 0xffffffff)



>             I've tried=20
> fsck.reiserfs -check
>             The result :
>                         The problem has occurred looks like a hardware
> problem
>                         Check your hard drive badblocks
>                         Bread : Cannot read the block (17760256)

>> Hm, sounds like your partition is bigger than underlying block device
and >> you recently have upgraded your kernel
>> to 2.4.21rc1 or something like that, no?

Yes but from 2.4.19 to 2.4.20 and exactly I have perform an new install
of this machine and put the HDD after the install

>             When I use :=20
> debug.reiserfs /dev/hdb1
> The Result :
> <-------------debugreiserfs, 2002------------->
> reiserfsprogs 3.6.4
> Reiserfs super block in block 16 on 0x341 of format 3.6 with standard
> journal
> Count of blocks on the device: 20010808

Hm, but then debugfs should have complained too?

> How to solve this problem ??

>>We need to see what are the kernel messages.
>>also output of "fdisk -l /dev/hdb"

fdisk -l /dev/hdb :

Disk /dev/hdb: 81.9 GB, 81964302336 bytes
16 heads, 63 sectors/track, 158816 cylinders
Units =3D cylinders of 1008 * 512 =3D 516096 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hdb1             1    158816  80043232+  83  Linux



>>Bye,
>>    Oleg


Thx oleg

Serge


