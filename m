From: Valdis.Kletnieks@vt.edu
Subject: Re: viewprinting processes and process oriented permissions got funded by DARPA
Date: Fri, 16 Apr 2004 21:33:10 -0400
Message-ID: <200404170133.i3H1XAwE005273@turing-police.cc.vt.edu>
References: <407C304F.4080804@namesys.com>
            <407C953E.2080505@slaphack.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1671237748P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18017-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Tue, 13 Apr 2004 20:34:54 CDT."
             <407C953E.2080505@slaphack.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Masover <ninja@slaphack.com>
Cc: Reiserfs List <reiserfs-list@namesys.com>

--==_Exmh_1671237748P
Content-Type: text/plain; charset=us-ascii

On Tue, 13 Apr 2004 20:34:54 CDT, David Masover <ninja@slaphack.com>  said:

> I don't know how relevant this is to the discussion about
> filesystem-based security, but one thing I've wanted to do is limit huge
> portions of a program in security.  Imagine a browser that let
> Javascript play with everything _inside_ the browser, but had to go
> through a common interface before it could create files or connect out?
> ~ At least with the files, it gives a chance to prompt the user.

That was the original Java "sandbox" model.  Javascript is a broken
abortion of a scripting language that has a similar name, but no coherent
security model.

> In general, I like that better than I like parsing out "bad code".  But
> I have never seen a method to create something like that.

You might want to look at http://www.nsa.gov/selinux and friends - that's
designed to restrict what a specific program can do.  It's included in Fedora Core
and a number of other distro's test branches.  There's even a policy for 'mozilla' :)



--==_Exmh_1671237748P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAgIlVcC3lWbTT17ARAhjgAJ9ALIGZdn0+esQpGJ9+qhr7kwT/EQCgh3Pu
POwl591FrMZX0ndVpxYc4hM=
=QnDt
-----END PGP SIGNATURE-----

--==_Exmh_1671237748P--
