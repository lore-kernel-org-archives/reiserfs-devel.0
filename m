From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: reiser fs slow on mksf and mount
Date: Sun, 28 Aug 2005 14:44:29 -0400
Message-ID: <4312060D.8020904@suse.com>
References: <1125074717.5549.44.camel@localhost.localdomain>	 <430F4B91.7030909@namesys.com>	 <1125076138.5549.65.camel@localhost.localdomain>	 <1125076558.5549.72.camel@localhost.localdomain>	 <430F5226.50701@namesys.com>	 <1125080213.5549.100.camel@localhost.localdomain>	 <4310BF35.3060603@suse.com> <1125183208.5569.3.camel@localhost.localdomain>	 <4310FEC1.5020600@suse.com> <1125243608.5544.18.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25680-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1125243608.5544.18.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mingz@ele.uri.edu
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs <reiserfs-list@namesys.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ming Zhang wrote:
> On Sat, 2005-08-27 at 20:01 -0400, Jeff Mahoney wrote:
> 
>> yes, i have a 12*400GB SATA MD raid that want to store my huge number of
>> pictures (i am not a good photographer, but a quick shooter.) all these
>> files are named as DSCxxxxxx.jpg but not continuous since some are
>> really bad so deleted. so i jump out these questions to stress the
>> scalability of fs.

ReiserFS is very well suited for lots of files, so you should be all set
in that respect.

> * We don't cache any other metadata (other than the superblock, which is
> standard practice) specially. In a mostly-reader environment, bitmaps
> would rank very low in importance for caching.
> 
>> could u explain a bit more on what is the purpose of these bitmaps? what
>> is the relationship between these bitmap and other metadata?

The bitmaps are used to keep track of which blocks on disk are used, and
which are available for allocation. Every (blocksize * 8) blocks, there
is a block reserved to keep track of which blocks in that range are
allocated or not. On a 4k block filesystem, that boils down to 1 4k
block for every 128 MB. If a block is used, the bit corresponding to it
is set. When the block is freed, the bit is cleared.

Well there are a several kinds of metadata on the filesystem: The super
block, the bitmaps, the journal, and the reiserfs s-tree itself. The
journal and bitmaps are only used when writing to the filesystem. The
superblock and s-tree are used for any filesystem access. The
relationship is that before a file data block or an s-tree node can be
allocated on disk, the bitmaps must be checked to see where the block
can be allocated.

>> assumed i have 2GB or 4GB ram, which is not unbelievable for a desktop
>> now. but can these RAM be used by 32BIT arch?

The RAM can be used, sure, but not for the bitmaps. I believe the buffer
heads for the bitmaps need to come out of the memory < 1 GB. It would be
possible to put the bitmaps in high memory (like any other data), but
the patch to do so would likely be more involved than the dynamic bitmap
patch, and still waste the memory anyway.

> Allocate-on-flush allows the filesystem to wait until the last possible
> moment to allocate the space on disk, which makes performance a little
> nicer, but more importantly, allows the allocator to allocate entire
> chunks of a file rather than a block-at-a-time.
> 
>> are u talking about allocating space after that file content is cached
>> in RAM and before need to be flushed? this is then like a write-any file
>> system that you can write to a place where it is still continuous and
>> near to current disk head (though latter is hard to achieve since it is
>> hidden by LVM/MD/...).

Well those are two different issues. Allocate on flush would try to keep
the file as contiguous as possible, whether by appending (ideal) or by
keeping the new chunk of data all together as a separate fragment rather
than individual blocks scattered everywhere. As for writing near the
current disk head, that is an operation that is performed by the block
layer. It can make the best decisions on that, since it its at the
lowest level of abstraction. It's entirely possible that a filesystem be
mounted via file-loopback on an NFS mount. In that case, the local
system has no information at all about where the disk head would be.

- -Jeff

- --
Jeff Mahoney
SuSE Labs
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQFDEgYNLPWxlyuTD7IRAlkgAKCM8evk+X3FSAw9IzEbeRKyo+N2tgCffyNi
yNcc2G2Uy09X5zMI97AKaJc=
=UzK+
-----END PGP SIGNATURE-----
