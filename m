From: Valdis.Kletnieks@vt.edu
Subject: Re: Quota and reiserfs status
Date: Fri, 07 Jun 2002 09:54:25 -0400
Message-ID: <200206071354.g57DsPSA003627@turing-police.cc.vt.edu>
References: <3D00B880.E3A7B770@cri74.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1913919491P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10670-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: Your message of "Fri, 07 Jun 2002 15:43:28 +0200."
             <3D00B880.E3A7B770@cri74.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Fabien Salvi <fabien@cri74.org>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

--==_Exmh_1913919491P
Content-Type: text/plain; charset=us-ascii

On Fri, 07 Jun 2002 15:43:28 +0200, Fabien Salvi <fabien@cri74.org>  said:

> Is it provided to the near future, or maybe not before the next stable
> release of lk ?
> 
> I've made some benchs and I have no problems.
> But, can we considere quota support stable enough for production use ?

It's quite stable - the problem is that if you install the quota patch
(or have a kernel that includes it), it requires a matching upgrade in
the user-space quota tools, and there's some resistance to doing that
mid-kernel-cycle.
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_1913919491P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE9ALsRcC3lWbTT17ARAkfsAKDFTsIMPULomhRS39AMPgnZMMqkdgCbBMUo
q+P/rHmfSKjhb7K+QmEp8lg=
=4ApH
-----END PGP SIGNATURE-----

--==_Exmh_1913919491P--
