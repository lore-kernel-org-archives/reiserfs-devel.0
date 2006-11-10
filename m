From: Valdis.Kletnieks@vt.edu
Subject: Re: reiser4 experimental patch
Date: Fri, 10 Nov 2006 09:42:42 -0500
Message-ID: <200611101442.kAAEghne006274@turing-police.cc.vt.edu>
References: <200611091723.20881.smyows@youare.not.br> <200611101244.47290.hirtejs@idmt.fraunhofer.de> <200611100957.05438.smyows@youare.not.br>
            <200611101059.30441.smyows@youare.not.br>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1163169762_6430P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30135-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 10 Nov 2006 10:59:30 -0200."
             <200611101059.30441.smyows@youare.not.br>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Guilherme Covolo <smyows@youare.not.br>
Cc: reiserfs-list@namesys.com

--==_Exmh_1163169762_6430P
Content-Type: text/plain; charset=us-ascii

On Fri, 10 Nov 2006 10:59:30 -0200, Guilherme Covolo said:
> the diference between my an  Johannes Hirte's patch is:
> *********************************************************
> 
> /fs/reiser4/super_ops.c
> 
> 290c290
> < static int reiser4_statfs(struct dentry *dentry, struct kstatfs *statfs)
> ---
> > static int reiser4_statfs(struct super_block *super, struct kstatfs *statfs

diff -c or diff -u please.  That way, if some unrelated thing moves the lines
up or down 1 or 2, it still applies.  Also, it's easier to look at a 'diff -u'
and understand what's going on, because you get to see 3-4 lines either side
of the changed lines.

> i change my super_ops.c but why you alter te int to ssize_t on item.h?

ssize_t isn't an int on some architectures, it's a 'long'.  As a result if
you reference a 32 bit value where you should use 64, you'll certainly
end up with something unexpected (probably an oops).

--==_Exmh_1163169762_6430P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFFVI/icC3lWbTT17ARAgUqAJ9b0MjcUoiBoQ42fJbGj+QBUzMvagCfWGXG
UtmXlw+00zRkNI43kst8GMI=
=/Jlw
-----END PGP SIGNATURE-----

--==_Exmh_1163169762_6430P--
