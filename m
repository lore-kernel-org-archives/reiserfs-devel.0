From: Valdis.Kletnieks@vt.edu
Subject: Re: Silly question, defrag
Date: Thu, 04 Apr 2002 14:09:23 -0500
Message-ID: <200204041909.g34J9N6H025095@foo-bar-baz.cc.vt.edu>
References: <3CAABBA6.3030101@swelltech.com> <20020403154906.A21821@ultraviolet.org> <20972156.20020404111651@tnonline.net>
            <20020404105440.F27377@ultraviolet.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-74575822P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: Your message of "Thu, 04 Apr 2002 10:54:40 PST."
             <20020404105440.F27377@ultraviolet.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Tracy R Reed <treed@ultraviolet.org>
Cc: ReiserFS List <reiserfs-list@namesys.com>

--==_Exmh_-74575822P
Content-Type: text/plain; charset=us-ascii

On Thu, 04 Apr 2002 10:54:40 PST, Tracy R Reed <treed@ultraviolet.org>  said:

> If there were real value in regularly defragging then Veritas, Sun, IBM,
> HP, and all of those guys would have made defraggers for their respective
> filesystems and it would be considered best practice and standard
> operating procedure to use them. But I have never heard of any such tools
> nor procedures.

Actually, IBM *does* ship a 'defragfs' with its JFS file system under AIX.
When using file system compression under JFS, you can get horribly fragmented
under certain usage patterns.  'defragfs' is perfectly happy with running
on a live mounted filesystem.

-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_-74575822P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE8rKTjcC3lWbTT17ARAmKdAKCSapp3GNWCEkMJ1UspiIiuNZaneQCdGrhw
+LzQUthcw9uNGZikiFoeA2k=
=oYM6
-----END PGP SIGNATURE-----

--==_Exmh_-74575822P--
