From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS problems
Date: Thu, 07 Aug 2003 19:05:52 +0400
Message-ID: <3F326AD0.4070507@namesys.com>
References: <20030806182055.A28562@bitwizard.nl> <3F31303A.6020408@namesys.com> <3F314BE8.50300@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15235-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F314BE8.50300@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

Jeff Mahoney wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> |> We've noticed horrible slowdowns when the filesystem is > 90% full. It
> |> turns out that when a block group is more than 90% full reiserfs will
> |> prefer a different block group. i.e. it is ALWAYS switching block
> |> groups when the whole disk is > 90% full. Something like that. When we
> |> report something like that it's always: Ah, yes, that's an old bug
> |> we've fixed it. Use patch.....
> |>
> | I don't think you reported that to me.....
> |
> | Jeff, give me an opinion on this....
>
> The skip_busy algorithm works like so:
>
> If the filesystem is less than 95% full, the allocator tries to be a bit
> smarter and leaves 10% of the bitmap free for future allocations to
> avoid fragmentation. 


> If the bitmap being examined has 10% or less free
> space, it's skipped. *UNLESS* the file doing the allocation already has
> an interest in that bitmap, as determined by the allocator getting
> passed a non-zero offset into the bitmap. 

Define this unless clause more fully please.

>
>
> If it finds no bitmaps that are more than 10% free or the filesystem is
> | 95% full, it restarts the search at the initial hint and ignores the
> 10% rule.
>
> In short;
> 1) Find a block in the current bitmap if the file's last block was
> allocated there.
> 2) If there aren't any, or there is no stake

stake?

> , search until a bitmap that
> is > 10% free is found, but only from the initial search point to the
> end of the disk - without wrapping around.
> 3) If there aren't any, try to find any free block from the initial
> search point until the end of the disk
> 4) If there aren't any, start at the beginning of the disk and search up
> to the initial search point.
>
> The idea is that allocations that can be kept contiguous should be. Once
> the allocation ends up being outside of the local bitmap, then the disk
> is already seeking, so it doesn't matter if it seeks a bit more if it
> can find another chunk where it can find contiguous allocation.
>
> All these searches are streamlined by making find_*_zero_bit do as
> little work as possible. For each bitmap, the offset of the first zero
> bit is kept as well as how many free bits there are. This makes it
> trivial to skip bitmaps that have < 10% free, as well as not force the
> allocator to scan entire bitmaps to find that the last bit is the zero 
> bit.
>
> So, yes, when the filesystem approaches 95% full, and there are only new
> files being created, the *initial* allocations will scatter themselves. 

it would be better to scatter at the directory rather than the file 
level, but that is probably harder to code.

>
> This is by design so that the subsequent allocations for each of those
> files will be able to be contiguous with the original allocation.
>
> What is the workload that is producing the horrible slowdowns?
>
> - -Jeff
>
> - --
> jeffm@suse.com
> jeffm@csh.rit.edu
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)
> Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org
>
> iD8DBQE/MUvoLPWxlyuTD7IRArpkAJ9MThFNeVzmEIONDDlypsALv70dTACgj7xo
> EJVh5oDQWqfsG9RH9lcFtO4=
> =ZcoM
> -----END PGP SIGNATURE-----
>
>
>


-- 
Hans


