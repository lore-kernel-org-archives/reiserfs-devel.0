From: Valdis.Kletnieks@vt.edu
Subject: Re: fsync() Performance Issue
Date: Sat, 04 May 2002 01:41:53 -0400
Message-ID: <200205040541.g445frQn019183@foo-bar-baz.cc.vt.edu>
References: <93F527C91A6ED411AFE10050040665D0049BF9B4@corpusmx1.us.dg.com> <1020463205.3946.252.camel@tiny>
            <3CD341EC.9080906@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-457746487P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10235-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: Your message of "Sat, 04 May 2002 06:05:32 +0400."
             <3CD341EC.9080906@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

--==_Exmh_-457746487P
Content-Type: text/plain; charset=us-ascii

On Sat, 04 May 2002 06:05:32 +0400, Hans Reiser said:
> Chris Mason wrote:
> >Hans, data=journal turns on the data journaling.  The data journaling
> and the reason it is faster is....
> >patches also include optimizations to write metadata back to disk in
> >bigger chunks for tiny transactions (the current method is to write one
> >transaction's worth back, when a transaction has 3 blocks, this is
> >pretty slow).
> >
> is this a lazy fsync?  If so, then everything makes sense to me, if not, 
> I remain uneducated and looking to receive your wisdom;-)

Well.. *semi* lazy - since the bits *ARE* on the oxide, it's followed
the requirements of fsync() not returning till they hit the oxide ;)

We ran into a similar performance issue when we first started deploying
another vendor's data-journalled filesystem (although at 1:30AM, I'm
unable to remember whether it was Sun or Digital).  We finally did a bunch
of benchmarking work, and discovered that it was due to the arm movement
patterns.  

When running on a non-journalled file system, the arm would be seeking back
and forth however the elevator algorithm told it, to write the next blocks
that needed writing (which if you had any fragmentation or writes to
multiple files, meant you were doing seeks all over the place).

However, when running journalled, during periods of high activity,
the head would basically stay parked in the journal area doing sequential
writes to the journal, meaning the *effective* seek time for the next
write would be essentially zero (since the head was over the journal
already) - it would then go and do all the write-behind out to the
"permanent" area of the disk when the disk wasn't otherwise busy (so
you didn't take a performance hit.
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_-457746487P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE803ShcC3lWbTT17ARAruqAKDhyXp+T8/Z//ZiLbmCJ69yyvipyACgyK3z
wHASJ/NSvgy0drewDN/mIs8=
=z2I8
-----END PGP SIGNATURE-----

--==_Exmh_-457746487P--
