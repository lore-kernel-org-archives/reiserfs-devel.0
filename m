From: Valdis.Kletnieks@vt.edu
Subject: Re: Fastest way to walk through a file tree on reiser4
Date: Mon, 19 Apr 2004 22:06:08 -0400
Message-ID: <200404200206.i3K268rl002953@turing-police.cc.vt.edu>
References: <408155A5.8080205@poelzi.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1407750144P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18068-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sat, 17 Apr 2004 18:04:53 +0200."
             <408155A5.8080205@poelzi.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: "daniel.poelzleithner" <poelzi@poelzi.org>
Cc: reiserfs-list@namesys.com

--==_Exmh_1407750144P
Content-Type: text/plain; charset=us-ascii

On Sat, 17 Apr 2004 18:04:53 +0200, "daniel.poelzleithner" <poelzi@poelzi.org>  said:

> The program should walk through a file tree and return a list of all 
> files their link count is 1. What would be the fastest way to realize this ?

Depends.  Which matters more, correctness or speed? ;)

Many programs perform an *inverse* optimization - If you're looking for
all subdirectories, and find a directory with link count == 2, there's no need
to recurse down into it looking for subdirs (if you have a directory 'a',
that has a subdir 'a/b', it will have a link count of at least 3 - if 'a' has
exactly 2 links, it's a leaf directory).

Also, looking for "exactly one link" doesn't work right for hardlinks:

cd your_sub_dir
cp /datatree/some_file ./name1
ln ./name1 ./name2

--==_Exmh_1407750144P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAhIWPcC3lWbTT17ARAi1TAKDUl7/v/7cj5Ov1MyyVeYPwzpCIOwCfZXB+
/c14ieI14aroi+CwDtHASfw=
=Xet6
-----END PGP SIGNATURE-----

--==_Exmh_1407750144P--
