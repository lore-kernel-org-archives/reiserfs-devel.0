From: Valdis.Kletnieks@vt.edu
Subject: Re: Can ReiserFS solve this?
Date: Mon, 28 Apr 2003 10:42:30 -0400
Message-ID: <200304281442.h3SEgVdA003758@turing-police.cc.vt.edu>
References: <3EAD34D5.8030108@solidcode.net>
            <20030428143231.GA11226@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1466054346P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13865-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 28 Apr 2003 18:32:31 +0400."
             <20030428143231.GA11226@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: Erik Terpstra <erik@solidcode.net>, reiserfs-list@namesys.com

--==_Exmh_-1466054346P
Content-Type: text/plain; charset=us-ascii

On Mon, 28 Apr 2003 18:32:31 +0400, Oleg Drokin said:

> How about such a generic solution:
> 
> you create /incoming/.temp (or /incoming.tmp), all the files are being writte
n
> there. When write is complete, you just do rename(2) from tempdir to /incomin
g

Oleg:  A very good solution, except there are chucklehead admins at the
remote site that refuse to make changes to their end, and this solution
would require a change at the remote end to do a FTP rename.. ;)

--==_Exmh_-1466054346P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE+rT3WcC3lWbTT17ARAp/DAJ9y1rwJ1nrsJaE7gVRXksOiV3A2bQCbBOhy
jHVJo8Sj7q9ybuugrFitWmo=
=/mCP
-----END PGP SIGNATURE-----

--==_Exmh_-1466054346P--
