From: Valdis.Kletnieks@vt.edu
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Wed, 31 Mar 2004 17:37:24 -0500
Message-ID: <200403312237.i2VMbOCa013227@turing-police.cc.vt.edu>
References: <20040331084335.GE5229@nysv.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1176583924P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17635-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Wed, 31 Mar 2004 11:43:35 +0300."
             <20040331084335.GE5229@nysv.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Markus =?UNKNOWN?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: reiserfs-list@namesys.com

--==_Exmh_1176583924P
Content-Type: text/plain; charset=us-ascii

On Wed, 31 Mar 2004 11:43:35 +0300, mjt@nysv.org (Markus =?UNKNOWN?Q?T=F6rnqvist?=)  said:

> I'm not sure either what Hans Reiser meant by a macro, does that mean
> a settable variable? It's a decent compromise, I think. As someone
> else stated, let's just hope for an inoffensive default.

VMS has SYS$FOO variables all over the place, but they don't have the same
semantics as a Unix environment variables.  It's unclear what scope a settable
variable for this should have - systemwide, filesystem, process group, process,
thread, or file descriptor.  Equally good cases can be made for/against each of
them.


--==_Exmh_1176583924P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD4DBQFAa0gjcC3lWbTT17ARAjXAAJjcTSJumHcPJN4wCegRlQt1dKJmAJ9p11oA
8z6vsbNANGk0aBLPBGEPVQ==
=bTou
-----END PGP SIGNATURE-----

--==_Exmh_1176583924P--
