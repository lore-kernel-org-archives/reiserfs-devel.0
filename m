From: Valdis.Kletnieks@vt.edu
Subject: Re: reiser4non-free
Date: Wed, 05 May 2004 14:38:17 -0400
Message-ID: <200405051838.i45IcH6A018977@turing-police.cc.vt.edu>
References: <4097E691.9070001@myrealbox.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1664438526P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18469-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Tue, 04 May 2004 11:53:05 PDT."
             <4097E691.9070001@myrealbox.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Rhyotte <rhyotte@myrealbox.com>
Cc: reiserfs-list@namesys.com

--==_Exmh_-1664438526P
Content-Type: text/plain; charset=us-ascii

On Tue, 04 May 2004 11:53:05 PDT, Rhyotte <rhyotte@myrealbox.com>  said:

> "splash screen" upon every system bootup! The nvidia one is bad enough - 
> I wind up thinking of that one as " well my 3D acceleration is working". 

Off-topic, but NVidia realizes this..   In your XF86Config:

Section "Device"
        Identifier "nVidia Corporation|NV17 [GeForce4 440 Go"
        Driver "nvidia"
        Option "NoLogo" "true"

That last line should fix *that* problem.  I'll let the rest of the people
engaging in the discussion ponder if a similar NoLogo solution helps others
that have similar issues. ;)


--==_Exmh_-1664438526P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAmTSZcC3lWbTT17ARAm7JAJ0eid/zgnF/nEry8gQLrYy3tOoVmgCeIdbW
uJjPNw7AlMdg0ndy/zrh2zE=
=IlGI
-----END PGP SIGNATURE-----

--==_Exmh_-1664438526P--
