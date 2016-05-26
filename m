From: <doiggl@velocitynet.com.au>
Subject: Re: Two Reiser4 FSs in the same HDD cause head seek panic?
Date: Thu, 26 May 2016 16:00:43 +1000
Message-ID: <12edeef37eda6bb88853193ab1820b4c@mail.velocitynet.com.au>
References: <ni15m1$hf6$1@ger.gmane.org> <3ba9c56a60bb5f4e6d9f6e3bb867ebe3@mail.velocitynet.com.au> <ni5eto$gkr$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <ni5eto$gkr$1@ger.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Georgios Tsalikis <georgios@tsalikis.net>
Cc: reiserfs-devel@vger.kernel.org

On Thu, 26 May 2016 03:15:55 +0300, Georgios Tsalikis
<georgios@tsalikis.net> wrote:
> On 25/05/2016 01:22 =CE=BC=CE=BC, doiggl@velocitynet.com.au wrote:
>> On Tue, 24 May 2016 11:58:53 +0300, Georgios Tsalikis
>> <georgios@tsalikis.net> wrote:
>>> I happened to format a rootfs partition and another one for /home w=
ith
>>> Reiser4. It proved to be a disaster. Apart from the slow boot times
>>> (expected from this drive) even after reaching a functional GUI the
>>> disk kept doing I/O  like crazy. When /home became Btrfs the issue
>>> ceased. My other computer that uses an entire drive formatted with
>>> Reiser4 is nice and silent as well.

Hello,
What do following commands show ?
--Glenn

example:

# which fsck.reiser4=20
/usr/sbin/fsck.reiser4

# fdisk -l

Disk /dev/sdb: 2000.4 GB, 2000398934016 bytes, 3907029168 sectors
Units =3D sectors of 1 * 512 =3D 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes

# fsck.reiser4 -V
fsck.reiser4 1.0.6
Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
reiser4progs/COPYING.=20


# fsck.reiser4 --print-profile /dev/sdb
Default profile:
create:          "reg40"           (id:0x0 type:0x0)    [Regular file
plugin for creat(2)]
key:             "key_large"       (id:0x1 type:0xb)    [Key plugin]
compress:        "lzo1"            (id:0x0 type:0xc)    [Compression
plugin]
compressMode:    "conv"            (id:0x4 type:0xd)    [Compression Mo=
de
plugin]
cluster:         "64K"             (id:0x0 type:0x10)   [Cluster plugin=
]
hash:            "r5_hash"         (id:0x1 type:0x3)    [Directory entr=
y
hash plugin]
fibration:       "ext_1_fibre"     (id:0x2 type:0x4)    [Key fibration
plugin]
formatting:      "smart"           (id:0x2 type:0x5)    [File body
formatting plugin]

# fsck.reiser4 --print-plugins  /dev/sdb
Known plugins:
"reg40"             (id:0x0 type:0x0) [Unix-file regular file plugin.]
"dir40"             (id:0x1 type:0x0) [Directory file plugin.]
"sym40"             (id:0x2 type:0x0) [Symlink file plugin.]
"spl40"             (id:0x3 type:0x0) [Special file plugin.]
"ccreg40"           (id:0x4 type:0x0) [Cryptcompress regular file plugi=
n.]
"stat40"            (id:0x0 type:0x1) [StatData item plugin.]
"cde40"             (id:0x2 type:0x1) [Compound directory entry item
plugin.]
"nodeptr40"         (id:0x3 type:0x1) [Node pointer item plugin.]
"extent40"          (id:0x5 type:0x1) [Extent file body item plugin.]
"plain40"           (id:0x6 type:0x1) [Plain file body item plugin.]
"ctail40"           (id:0x7 type:0x1) [Compressed file body item plugin=
=2E]
"bbox40"            (id:0x8 type:0x1) [Safe link item plugin.]
"node40"            (id:0x0 type:0x2) [Node plugin.]
"rupasov_hash"      (id:0x0 type:0x3) [Rupasov hash plugin.]
"r5_hash"           (id:0x1 type:0x3) [R5 hash plugin.]
"tea_hash"          (id:0x2 type:0x3) [Tea hash plugin.]
"fnv1_hash"         (id:0x3 type:0x3) [Fnv1 hash plugin.]
"deg_hash"          (id:0x4 type:0x3) [Degenerate hash plugin.]
"lexic_fibre"       (id:0x0 type:0x4) [Lexicographic fibration plugin.]
"dot_o_fibre"       (id:0x1 type:0x4) ['.o' fibration plugin.]
"ext_1_fibre"       (id:0x2 type:0x4) [1-symbol extention fibration
plugin.]
"ext_3_fibre"       (id:0x3 type:0x4) [3-symbol extention fibration
plugin.]
"extents"           (id:0x0 type:0x5) ['Extents only' tail policy plugi=
n.]
"tails"             (id:0x1 type:0x5) ['Tails only' tail policy plugin.=
]
"smart"             (id:0x2 type:0x5) [Smart tail policy plugin.]
"sdext_lw"          (id:0x0 type:0x6) [Light stat data extension plugin=
=2E]
"sdext_unix"        (id:0x1 type:0x6) [Unix stat data extension plugin.=
]
"sdext_lt"          (id:0x2 type:0x6) [Large times stat data extension
plugin.]
"sdext_symlink"     (id:0x3 type:0x6) [Symlink stat data extension
plugin.]
"sdext_plugin_set"  (id:0x4 type:0x6) [Plugin Set StatData extension
plugin.]
"sdext_flags"       (id:0x5 type:0x6) [Inode flags stat data extension
plugin.]
"sdext_crypto"      (id:0x7 type:0x6) [Crypto stat data extension plugi=
n.]
"sdext_heir_set"    (id:0x8 type:0x6) [Heir Set StatData extension
plugin.]
"format40"          (id:0x0 type:0x7) [Disk-format plugin.]
"oid40"             (id:0x0 type:0x8) [Inode number allocator plugin.]
"alloc40"           (id:0x0 type:0x9) [Space allocator plugin.]
"journal40"         (id:0x0 type:0xa) [Journal plugin.]
"key_short"         (id:0x0 type:0xb) [Short key plugin.]
"key_large"         (id:0x1 type:0xb) [Large key plugin.]
"lzo1"              (id:0x0 type:0xc) [lzo1 compression transform plugi=
n.]
"gzip1"             (id:0x1 type:0xc) [gzip1 compression transform
plugin.]
"none"              (id:0x0 type:0xd) ['Don't compress' compression mod=
e
plugin.]
"latt"              (id:0x1 type:0xd) ['Check on dynamic lattice'
compression mode plugin.]
"ultim"             (id:0x2 type:0xd) ['Check ultimately' compression m=
ode
plugin.]
"force"             (id:0x3 type:0xd) ['Compress evrything' compression
mode plugin.]
"conv"              (id:0x4 type:0xd) ['Convert to extent' compression
mode plugin.]
"64K"               (id:0x0 type:0x10) [64K size cluster plugin.]
"32K"               (id:0x1 type:0x10) [32K size cluster plugin.]
"16K"               (id:0x2 type:0x10) [16K size cluster plugin.]
"8K"                (id:0x3 type:0x10) [8K size cluster plugin.]
"4K"                (id:0x4 type:0x10) [4K size cluster plugin.]



--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
