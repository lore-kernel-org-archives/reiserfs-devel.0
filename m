From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: reiser fs slow on mksf and mount
Date: Mon, 29 Aug 2005 10:26:51 -0400
Message-ID: <43131B2B.8020406@suse.com>
References: <1125074717.5549.44.camel@localhost.localdomain>	 <430F4B91.7030909@namesys.com>	 <1125076138.5549.65.camel@localhost.localdomain>	 <1125076558.5549.72.camel@localhost.localdomain>	 <430F5226.50701@namesys.com>	 <1125080213.5549.100.camel@localhost.localdomain>	 <4310BF35.3060603@suse.com> <1125183208.5569.3.camel@localhost.localdomain>	 <4310FEC1.5020600@suse.com>	 <1125243608.5544.18.camel@localhost.localdomain>	 <4312060D.8020904@suse.com> <1125319151.5544.16.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25694-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1125319151.5544.16.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ming Zhang <mingz@ele.uri.edu>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ming Zhang wrote:
> On Sun, 2005-08-28 at 14:44 -0400, Jeff Mahoney wrote:
>>* We don't cache any other metadata (other than the superblock, which is
>>standard practice) specially. In a mostly-reader environment, bitmaps
>>would rank very low in importance for caching.
> 
>>>could u explain a bit more on what is the purpose of these bitmaps? what
>>>is the relationship between these bitmap and other metadata?
> The bitmaps are used to keep track of which blocks on disk are used, and
> which are available for allocation. Every (blocksize * 8) blocks, there
> 
>> here blocksize is 512bytes right from followed data? this comes from
>> sector size?

No. Block size is the declared filesystem blocksize, not the hardware
sector size. It must be a power of 2, and 512-8192 bytes. The "standard"
filesystem blocksize is 4k. If you've declared your block size as 512
bytes (using mkreiserfs -b 512), that would certainly be another source
of performance issues.

>> so what is the on disk layout? i asked this because when i have a slow
>> mount reiserfs on top of RAID1, I saw many small write each second. I
>> guess they scatter over whole disk.

Well two things occur on mount: Reading the bitmaps causes a read every
128M to occur, and replaying the journal can cause up to 8192 block
writes to occur. Replaying the journal is generally pretty quick.
Reading the bitmaps on a large filesystem can take a while. This is the
issue you originally asked about.

> is a block reserved to keep track of which blocks in that range are
> allocated or not. On a 4k block filesystem, that boils down to 1 4k
> block for every 128 MB. If a block is used, the bit corresponding to it
> is set. When the block is freed, the bit is cleared.
> 
> Well there are a several kinds of metadata on the filesystem: The super
> block, the bitmaps, the journal, and the reiserfs s-tree itself. The
> journal and bitmaps are only used when writing to the filesystem. The
> superblock and s-tree are used for any filesystem access. The
> relationship is that before a file data block or an s-tree node can be
> allocated on disk, the bitmaps must be checked to see where the block
> can be allocated.
> 
>> ic. so other meta-data is checked as other file systems.

No. The bitmaps and journal are still part of the same filesystem. They
are just not part of the s-tree.

>>>assumed i have 2GB or 4GB ram, which is not unbelievable for a desktop
>>>now. but can these RAM be used by 32BIT arch?
> The RAM can be used, sure, but not for the bitmaps. I believe the buffer
> heads for the bitmaps need to come out of the memory < 1 GB. It would be
> possible to put the bitmaps in high memory (like any other data), but
> the patch to do so would likely be more involved than the dynamic bitmap
> patch, and still waste the memory anyway.
> 
>> yes, i also suspect this 1GB limit. So 64bit is the way and AMD64 is
>> cheap anyway rite?

Personally, I think so.

> current disk head, that is an operation that is performed by the block
> layer. It can make the best decisions on that, since it its at the
> lowest level of abstraction. It's entirely possible that a filesystem be
> mounted via file-loopback on an NFS mount. In that case, the local
> system has no information at all about where the disk head would be.
> 
>> yes, but then block layer will need another bitmap to track which block
>> is used or not and also do a mapping again...
> 
>> the cost of layering?

The ideas of "in use" and "available" are purely filesystem abstractions
to keep track of where we already have filesystem data/metadata. The
block layer doesn't know or care about them - it's just a collection of
blocks that the user may do whatever they please with. Now, not to
confuse the issue, but the example of a loopback-mounted filesystem can
cause an allocation if the host file is sparse, but that's really a
corner case.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFDExsrLPWxlyuTD7IRAvGmAJ9QU16I2oz/kkCbqwdeGcIgkey8TgCgqS8s
lI6YzJEJ20j5LiheAqw6eoE=
=YD9V
-----END PGP SIGNATURE-----
