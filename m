From: Valdis.Kletnieks@vt.edu
Subject: Re: % of filesystem using tails/tail unpacking (shred related)
Date: Mon, 28 Oct 2002 16:20:57 -0500
Message-ID: <200210282120.g9SLKvgn005200@turing-police.cc.vt.edu>
References: <HDEFILEPHCPLCAGPLCEMKEMFDFAA.icycle@charter.net>
            <15805.2440.413201.310382@laputa.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1558175697P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11816-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 28 Oct 2002 12:55:20 +0300."
             <15805.2440.413201.310382@laputa.namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <Nikita@namesys.com>
Cc: Reiserfs-List <reiserfs-list@namesys.com>

--==_Exmh_1558175697P
Content-Type: text/plain; charset=us-ascii

On Mon, 28 Oct 2002 12:55:20 +0300, Nikita Danilov said:
> Brett Russ writes:

>  > 1) as mentioned first, an impact study should be done to determine if
>  > unpacking will overflow the available space on the device
> 
> Why cannot you do unpacking just before shredding particular file?

Unpacking before shredding has a subtle hole in it - since you will unpack
into *different* disk blocks and then shred *those* blocks, you will be
leaving unshredded data in the blocks the file occupied before unpacking.
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_1558175697P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE9vao5cC3lWbTT17ARAh0uAKDxtO0oUhU2bMNFFuApHXIlpQAlXQCgrNW9
YbAa4k1WbiI8U8W8RyGdYbs=
=2zj1
-----END PGP SIGNATURE-----

--==_Exmh_1558175697P--
