From: Valdis.Kletnieks@vt.edu
Subject: Re: [reiserfs-dev] Re: [ANNOUNCE] reiser4 snaphots
Date: Fri, 08 Nov 2002 15:04:46 -0500
Message-ID: <200211082004.gA8K4kC8008480@turing-police.cc.vt.edu>
References: <9918235451.20021106132043@kgpa.ru> <20021107090256.GC11974@mrball.net> <15818.17585.789642.675479@laputa.namesys.com> <20021108162743.GA21976@mrball.net> <15819.62364.997716.421729@laputa.namesys.com>
            <20021108194948.GA1750@mrball.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1905935254P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11952-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 08 Nov 2002 11:49:48 PST."
             <20021108194948.GA1750@mrball.net> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Todd Lyons <todd@mrball.net>
Cc: Nikita Danilov <Nikita@namesys.com>, ReiserFS-List <reiserfs-list@namesys.com>

--==_Exmh_-1905935254P
Content-Type: text/plain; charset=us-ascii

On Fri, 08 Nov 2002 11:49:48 PST, Todd Lyons said:

> Maybe my understanding is a little off, but I thought that I could just
> rebuild the modules and install them and run depmod and the new module
> symbols would be in effect.  But that didn't work (same error).
> 
> So then I tried also a make bzImage and make install (which updates the
> System.map, something that didn't get done with make modules_install).
> It still would not load (same error).
> 
> Finally, I rebooted loading the new kernel and that fixed it.  No
> comments needed, unless they are "what you did should have worked."

I've seen similar issues when the /boot/System.map file doesn't match the
kernel in use (this is particularly an issue for 'depmod' - the standard
'make modules_install' target passes a -F flag to depmod to use the just-created
System.map file.
-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech


--==_Exmh_-1905935254P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE9zBjdcC3lWbTT17ARAgG4AKCRcUzND6Kl2xtbBxR5zWzwSWhpJQCg2JSg
XFwtjW7+PD88zWPFLRkuo9k=
=a7FE
-----END PGP SIGNATURE-----

--==_Exmh_-1905935254P--
