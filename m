From: Valdis.Kletnieks@vt.edu
Subject: Re: testing/questions about latest Reiser4
Date: Mon, 05 Apr 2004 19:00:23 -0400
Message-ID: <200404052300.i35N0NTT025232@turing-police.cc.vt.edu>
References: <4070E534.9010509@mrs.umn.edu>
            <1081178588.1162.47.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_2089346634P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17735-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 05 Apr 2004 19:23:08 +0400."
             <1081178588.1162.47.camel@tribesman.namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Vladimir Saveliev <vs@namesys.com>
Cc: Grant Miner <mine0057@mrs.umn.edu>, reiserfs-list@namesys.com

--==_Exmh_2089346634P
Content-Type: text/plain; charset=us-ascii

On Mon, 05 Apr 2004 19:23:08 +0400, Vladimir Saveliev said:

> >   Are 
> > pseudo files just representation of stat data stored a special way? 
> 
> Pseudo files are not stored anywhere

Subtle distinction here - the data in a pseudo file has to be stored
*somewhere* if you want it to persist across reboots, and even for things that
don't survive a reboot, the data has to be saved *someplace* in memory, even if
it's only in a variable or a dentry structure or something like that....

So more accurate might be to say "The content of pseudo files is created on the
fly from metadata that is managed (and possibly saved) by the file system".

(Sorry to be pedantic, but it's a point that will cause a lot of confusion if you
don't really understand it)...

--==_Exmh_2089346634P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAceUHcC3lWbTT17ARAjn9AKC2ldqz2CTbKqekHW3fhusPiq6RUwCg+KTF
fMaRwsaBqYmmqaoZ6Dbf2Ho=
=vQ4z
-----END PGP SIGNATURE-----

--==_Exmh_2089346634P--
