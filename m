From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: ReiserFS problems
Date: Thu, 07 Aug 2003 11:53:43 -0400
Message-ID: <3F327607.8030006@suse.com>
References: <20030806182055.A28562@bitwizard.nl> <3F31303A.6020408@namesys.com> <3F314BE8.50300@suse.com> <3F326AD0.4070507@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15236-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F326AD0.4070507@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
| Jeff Mahoney wrote:
|
|> -----BEGIN PGP SIGNED MESSAGE-----
|> Hash: SHA1
|>
|> |> We've noticed horrible slowdowns when the filesystem is > 90% full. It
|> |> turns out that when a block group is more than 90% full reiserfs will
|> |> prefer a different block group. i.e. it is ALWAYS switching block
|> |> groups when the whole disk is > 90% full. Something like that. When we
|> |> report something like that it's always: Ah, yes, that's an old bug
|> |> we've fixed it. Use patch.....
|> |>
|> | I don't think you reported that to me.....
|> |
|> | Jeff, give me an opinion on this....
|>
|> The skip_busy algorithm works like so:
|>
|> If the filesystem is less than 95% full, the allocator tries to be a bit
|> smarter and leaves 10% of the bitmap free for future allocations to
|> avoid fragmentation.
|
|
|
|> If the bitmap being examined has 10% or less free
|> space, it's skipped. *UNLESS* the file doing the allocation already has
|> an interest in that bitmap, as determined by the allocator getting
|> passed a non-zero offset into the bitmap.
|
|
| Define this unless clause more fully please.
|
|>
|>
|> If it finds no bitmaps that are more than 10% free or the filesystem is
|> | 95% full, it restarts the search at the initial hint and ignores the
|> 10% rule.
|>
|> In short;
|> 1) Find a block in the current bitmap if the file's last block was
|> allocated there.
|> 2) If there aren't any, or there is no stake
|
|
| stake?

The "unless" and "stake" mean the same thing. When the block allocator
is given a hint for a file, it's the last block allocated already for
that file. So, the search starts at the bitmap and offset specified by
the hint. If there is a block available after that position, but still
in that bitmap, it's used; regardless of the 10% rule.

Once we move out of that bitmap, the skip busy algorithm is applied,
which aims to keep bitmaps at least 10% free when possible so that
future allocations may have blocks local to the last allocation available.

The algorithm is only as good as the hint passed to it. It doesn't try
to be smart about placement other than implementing the above algorithm.

- -Jeff

- --
jeffm@suse.com
jeffm@csh.rit.edu
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iD8DBQE/MnYGLPWxlyuTD7IRAriBAKCBi4j1YvWmndTrQsqDAZex/HFSMACdFMrV
octG4Hi4ipGEKXUxoiWkFwo=
=J/Pn
-----END PGP SIGNATURE-----

