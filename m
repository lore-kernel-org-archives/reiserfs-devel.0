From: Valdis.Kletnieks@vt.edu
Subject: Re: Was able to reproduce "cp: cannot stat file.x: Input/output error"
Date: Tue, 10 Aug 2004 11:41:59 -0400
Message-ID: <200408101541.i7AFfxtZ020270@turing-police.cc.vt.edu>
References: <20040807065039.5BF4E15CBC@mail03.powweb.com> <41148997.4070404@namesys.com> <200408100321.i7A3LHxu027087@turing-police.cc.vt.edu>
            <411887D5.1000202@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1191329028P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20126-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Tue, 10 Aug 2004 01:31:17 PDT."
             <411887D5.1000202@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: David Dabbs <david@dabbs.net>, 'ReiserFS List' <reiserfs-list@namesys.com>

--==_Exmh_-1191329028P
Content-Type: text/plain; charset="us-ascii"
Content-Id: <13810.1092152518.1@turing-police.cc.vt.edu>

On Tue, 10 Aug 2004 01:31:17 PDT, Hans Reiser said:

> Thanks for explaining
> 
> sync;sync;sync;halt
> 
> I always felt I was failing to grok something.

As was the author who recommended it.  It started out as:

# sync   ( this one schedules the I/O)
# sync   ( just a time waster typing)
# sync   ( just a time waster typing )
# halt    ( and we finally actually shut down).

The disks on the old PDP and Vax 750 boxes were actually sluggish enough that
if you had a whole 1M or 2M in the buffer cache to flush out, it was actually not
difficult to enter "sync", hit return, enter "halt", hit return, and have the
halt happen before sync finished, doing the predictable to the non-journaled file
systems.  Empirical studies showed that even on the biggest-memory boxes,
sync could almost always finish with 2 time-wasters before the halt.. ;)


--==_Exmh_-1191329028P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFBGOzGcC3lWbTT17ARAqrNAKDPsNrVzJgtYlWkNQLQWE+IgcMzlQCeM25o
GvMvC9MJOTxZAJUf6W6jrTk=
=Rvhb
-----END PGP SIGNATURE-----

--==_Exmh_-1191329028P--
