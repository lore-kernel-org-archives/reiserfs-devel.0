From: Valdis.Kletnieks@vt.edu
Subject: Re: The situation at hand and in the future
Date: Sat, 05 Jun 2004 03:30:50 -0400
Message-ID: <200406050730.i557UouE026516@turing-police.cc.vt.edu>
References: <20040527200127.GS4990@nysv.org> <200405272105.i4RL5LDh026210@turing-police.cc.vt.edu> <40B6670D.9060408@slaphack.com> <20040528063324.GT4990@nysv.org> <40B89C9C.5050307@slaphack.com> <873c5j0zm3.fsf@uhoreg.ca> <40B91A65.2060302@slaphack.com> <200405311827.i4VIRdlS001316@turing-police.cc.vt.edu> <40BBA23D.7000109@slaphack.com> <87ekp0ghbo.fsf@uhoreg.ca>
            <40C1510F.5020608@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-746948616P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19031-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 04 Jun 2004 23:50:23 CDT."
             <40C1510F.5020608@slaphack.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Hubert Chan <hubert@uhoreg.ca>, reiserfs-list@namesys.com

--==_Exmh_-746948616P
Content-Type: text/plain; charset=us-ascii

On Fri, 04 Jun 2004 23:50:23 CDT, David Masover said:

> Or suppose we simply don't want people to have to wait 2-3 times as long
> for a level to load, or for the game to load.  Games tend to be huge
> apps these days (or at least have a huge amount of content to load at
> once).  Every few minutes (or 5-10 mins) in ut2004, the server changes
> levels.  The levels currently take 15-30 seconds to load, most of it
> pure disk activity.

Proper programming would probably render encryption almost-zero overhead.
Except for really high-end disk subsystems, you're not going to get an *effective*
(i.e. after seeks and rotational delay and all that) throughput of much over
40 megabytes/second - and encrypting/decrypting at 40 megabytes/second
on modern hardware should be a no-brainer if you are sensible about key
scheduling and the like.

The only remaining point is to make sure you overlap the CPU and I/O operations.
If you wait for it to read in all 14 megabytes and then decrypt, it will be slow.
If you have enough sense to decrypt the first 64K while the next 64K is reading,
and so on, it should be nearly un-noticable.

> Also, what do you mean by "filesystem-bound"?  Most games I've seen make
> their own databases -- there's things all over with names like
> "textures.mycoolgame".  I wouldn't, I'd probably have it use whatever
> the reiser interface to multiple files is.  The last thing I want to
> think about when writing a game engine (a huge beast on its own which I
> will attempt one of these days) is data storage.

Just remember - if it doesn't all fit in memory at once, the *first* thing you
should be worrying about is data storage ;)



--==_Exmh_-746948616P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAwXaqcC3lWbTT17ARAq6yAJ94+20A4Irf9fIOgHu4Lt9MJ65TkACcD2cZ
iPFzISh+EROYfe22ciMWaQk=
=zP7Q
-----END PGP SIGNATURE-----

--==_Exmh_-746948616P--
