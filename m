From: Valdis.Kletnieks@vt.edu
Subject: Re: metas Permission Denied
Date: Thu, 29 Apr 2004 12:14:48 -0400
Message-ID: <200404291614.i3TGEoAI017900@turing-police.cc.vt.edu>
References: <E38393BE-9950-11D8-B39A-000A95C88606@aoc.nrao.edu> <16528.46352.173184.528623@laputa.namesys.com> <39CF0546-99EE-11D8-8CFE-000A95C88606@aoc.nrao.edu>
            <16529.9818.916980.360020@laputa.namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-278718528P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18287-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Thu, 29 Apr 2004 19:59:22 +0400."
             <16529.9818.916980.360020@laputa.namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: reiserfs-list <reiserfs-list@namesys.com>

--==_Exmh_-278718528P
Content-Type: text/plain; charset=us-ascii

On Thu, 29 Apr 2004 19:59:22 +0400, Nikita Danilov said:

> chmod u+rx backup/fsplit.c
> 
> "x" bit is necessary for lookups, and "r" bit---for readdir.

This is going to be *such* a non-starter - there's many decades of
"C files are mode 644 and executables are 755" tradition that this
will fly against.  What this basically implies is that the 'execute'
bit is useless, because it's being overloaded to mean both "the file
is executable" and "you can peek at the metadata".

% cd /tmp
% cat > foo.sh
echo foo
% ./foo.sh
-bash: ./foo.sh: Permission denied
% chmod +x ./foo.sh
% ./foo.sh
foo

Do you really intend to break those semantics??

--==_Exmh_-278718528P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAkSn4cC3lWbTT17ARAjvJAJ9HGBKgiejc6EoZNhx8z2RBT5z5OwCfWVgx
4E91bT4RWTNgFsnBv2oGRlw=
=zP75
-----END PGP SIGNATURE-----

--==_Exmh_-278718528P--
