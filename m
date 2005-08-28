From: Ming Zhang <mingz@ele.uri.edu>
Subject: Re: reiser fs slow on mksf and mount
Date: Sun, 28 Aug 2005 11:40:08 -0400
Message-ID: <1125243608.5544.18.camel@localhost.localdomain>
References: <1125074717.5549.44.camel@localhost.localdomain>
	 <430F4B91.7030909@namesys.com>
	 <1125076138.5549.65.camel@localhost.localdomain>
	 <1125076558.5549.72.camel@localhost.localdomain>
	 <430F5226.50701@namesys.com>
	 <1125080213.5549.100.camel@localhost.localdomain>
	 <4310BF35.3060603@suse.com> <1125183208.5569.3.camel@localhost.localdomain>
	 <4310FEC1.5020600@suse.com>
Reply-To: mingz@ele.uri.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25678-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4310FEC1.5020600@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs <reiserfs-list@namesys.com>

On Sat, 2005-08-27 at 20:01 -0400, Jeff Mahoney wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Ming Zhang wrote:
> > On Sat, 2005-08-27 at 15:29 -0400, Jeff Mahoney wrote:
> >>>are this bitmap data is pinned into system thus will not be swapped out?
> >> Yes, any buffers/pages with active reference counts are kept in memory.
> >> Since the current reiserfs bitmap implementation keeps a reference until
> >> filesystem umount, the bitmaps are pinned.
> > so u always keep a reference on all bitmap pages and thus they can not
> > be umounted. yes, by this way it can be pretty fast to do any meta-data
> > operation. but what if current RAM can not hold these bitmap. maybe u
> > think if i want to use tens of TB storage, i of course will have 32GB
> > RAM. :P
> 
> That's been the argument Hans has been presenting so far. I tend to
> disagree with it for several reasons:
> * It used to be unheard of for huge filesystems to be accessible to
> users without high priced RAID arrays. Now, with individual disk
> capacities over 500 GB and the ease of software raid, multiple-TB
> filesystems are quite possible on a desktop machine. These machines, as
> desktops, have no need for 32 GB of RAM, but have a very real demand for
> large storage.

yes, i have a 12*400GB SATA MD raid that want to store my huge number of
pictures (i am not a good photographer, but a quick shooter.) all these
files are named as DSCxxxxxx.jpg but not continuous since some are
really bad so deleted. so i jump out these questions to stress the
scalability of fs.


> * We don't cache any other metadata (other than the superblock, which is
> standard practice) specially. In a mostly-reader environment, bitmaps
> would rank very low in importance for caching.

could u explain a bit more on what is the purpose of these bitmaps? what
is the relationship between these bitmap and other metadata?


> 
> In short, we shouldn't be demanding that users of large storage also
> have loads of memory for what I feel is a very shaky argument in the
> first place.

assumed i have 2GB or 4GB ram, which is not unbelievable for a desktop
now. but can these RAM be used by 32BIT arch?


> 
> >> My dynamic bitmap patch fixes both of the problems you've posed so far.
> >> Mount time is reduced to O(1) time, since only the superblock and root
> >> node are read at mount time. On my system, it's something along the
> >> lines of 0.2s. Memory consumption is reduced also, because the bitmap
> >> block is released after the allocation/free that required it is complete.
> > ic. this is like a delayed lazy allocation. 
> 
> If I understand you correctly, you're referring to allocate-on-flush,
> which is a different idea entirely. What the dynamic bitmap patch does
> is similar to what most other filesystems do -- treat the bitmaps as any
> other kind of metadata is treated and read it on-demand.

yes, sorry, it is not lazy allocation. it is load (into ram) on-demand
or lazy load.



> Allocate-on-flush allows the filesystem to wait until the last possible
> moment to allocate the space on disk, which makes performance a little
> nicer, but more importantly, allows the allocator to allocate entire
> chunks of a file rather than a block-at-a-time.

are u talking about allocating space after that file content is cached
in RAM and before need to be flushed? this is then like a write-any file
system that you can write to a place where it is still continuous and
near to current disk head (though latter is hard to achieve since it is
hidden by LVM/MD/...).


> 
> - -Jeff
> 
> - --
> Jeff Mahoney
> SuSE Labs
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.0 (GNU/Linux)
> 
> iD8DBQFDEP7ALPWxlyuTD7IRAj2+AJ9f2tHTlV3Mrl7m0jDtn50p1egacwCgjbT9
> 2HSYlvH9sIG53JGjBHgT+9s=
> =Suud
> -----END PGP SIGNATURE-----

