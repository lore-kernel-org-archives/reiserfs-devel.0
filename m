From: Valdis.Kletnieks@vt.edu
Subject: Re: Interesting deletion idea
Date: Fri, 08 Oct 2004 18:14:37 -0400
Message-ID: <200410082214.i98MEbfT003666@turing-police.cc.vt.edu>
References: <41662BC7.80309@comcast.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-613764224P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22032-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 08 Oct 2004 01:55:19 EDT."
             <41662BC7.80309@comcast.net> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: John Richard Moser <nigelenki@comcast.net>
Cc: reiserfs-list@namesys.com

--==_Exmh_-613764224P
Content-Type: text/plain; charset=us-ascii

On Fri, 08 Oct 2004 01:55:19 EDT, John Richard Moser said:

> It'd be fun to be able to mount -o remount,erase=gutman / and have the
> gutman algorithm erase everything.  It may be interesting to get the
> journal to work around parts of the journal being erased, and to do
> other things in an attempt to allow heavy erasure algorithms (Gutman is
> a 34 pass alg IIRC) to function without slowing operations down visibly.

Anybody seriously proposing Gutman's 35 passes needs to be taken out back
and shot - or at least worked over with a rubber hose.  The *only* reason
that there's 35 passes is so that at least 3 or 4 passes will tickle a
corner case of some on-media encoding scheme (for instance, if you don't
have any MFM drives left, you can toss like half the entries).

Current thinking from the spooks who should know:

Canadian RCMP TSSIT OPS-II says: "Must first be checked for correct functioning
and then have all storage areas overwritten once with the binary digit ONE,
once with the binary digit ZERO and once with a single numeric, alphabetic or
special character, " (http://jya.com/rcmp2.htm)

American DoD 5220-22.M says: Overwriting all addressable locations with a
character, its complement, then a random character and verify.

DOD 5220-22.M applies to civilian contractors, and is approved for material
rated up to SECRET.  TOP SECRET or higher still calls for physical destruction
of media or mass degaussing.

In other words, our spooks think that if 3 passes isn't enough, you need to
totally destroy it.

(Two notes - (1) that read-back verify *is* required to make sure you did it
right, and (2) neither one worries about the information leakage from bad blocks
that have been remapped by the drive)

> The erasure should probably only apply to relavent parts of disk.  Inode
> information, for example, would be pointless; journal transactions, file
> data, and directory entries, on the other hand, are all possible
> sensitive information; the filename may be sensitive data (directory entry).

Careful analysis of the inodes themselves has a *lot* more information leakage
than you might expect - if the filesystem uses *ANY* sort of predictable order
for inode allocation, you can look at the free inodes and trace back what
order they were freed in (very easy if the filesystem has a free inode list,
a bit more of a challenge if it allocates on the fly like reiser3).  Once
you know that, you know what uid/gid the file belonged to, its size, and
the ctime/mtime/atime.

That's a *LOT* of info that can be used to reconstruct what was going on.

> Buffering multiple overwrites of the same area and applying them in a
> sane and orderly manner may allow you to catch rapid, repeted overwrites
> of disk areas and wait until several have gone by before actually
> applying them.  This would allow you to avoid some of the overhead of
> attempting to destroy overwritten data.

Actually, that's the *last* think you want to do - you really need to send
3 overwrites down the pipe to the disk *and make sure you have a write barrier
between them*.  The *last* think you want is to send 3 writes to the disk,
and have the disk's write cache bugger^Wbuffer "optimize" it so only the
last written block actually goes to disk....

--==_Exmh_-613764224P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFBZxFMcC3lWbTT17ARAt4zAJ9MvzdYImOhtYqeVtXthKZx2kRj2wCdGzV0
U6WkiUI12umkO31hkoY1bLs=
=ek4+
-----END PGP SIGNATURE-----

--==_Exmh_-613764224P--
