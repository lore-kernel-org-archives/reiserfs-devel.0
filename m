From: Valdis.Kletnieks@vt.edu
Subject: Re: Silly question, defrag
Date: Fri, 05 Apr 2002 09:04:21 -0500
Message-ID: <200204051404.g35E4L6H007366@foo-bar-baz.cc.vt.edu>
References: <Pine.LNX.4.44.0204050850170.6398-100000@dragon.inside.ntisys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1560364882P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: Your message of "Fri, 05 Apr 2002 08:50:35 EST."
             <Pine.LNX.4.44.0204050850170.6398-100000@dragon.inside.ntisys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Benjamin Scott <bscott@ntisys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

--==_Exmh_1560364882P
Content-Type: text/plain; charset=us-ascii

On Fri, 05 Apr 2002 08:50:35 EST, Benjamin Scott <bscott@ntisys.com>  said:

>   What about using "idle time" to defragment the filesystem on a continuous
> basis?  If the system is not doing anything else, a background daemon in the
> kernel could move blocks around to optimize things.  While I expect this

A good idea, worth researching, but probably a royal pain to implement.
The biggest problem is identifying "idle", and being careful to do things
in a way that doesn't cause problems if the system suddenly goes un-idle.

It's not as bad as doing an fsck on a live filesystem - but you do want to
be sure that if a program suddenly decides to read the file you're currently
moving around, that you do the right thing (writing gets a bit trickier -
you have to worry about stuff like somebody doing an fsync() of a block
that you're in the middle of moving around on the disk.  Race Condition City ;)

-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_1560364882P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE8ra7lcC3lWbTT17ARAvkDAKDpLbU+lTQLrl8NKx90MYX4sI615wCg4pxS
+wFDKXptuEB5135oJtS3KhQ=
=DOlk
-----END PGP SIGNATURE-----

--==_Exmh_1560364882P--
