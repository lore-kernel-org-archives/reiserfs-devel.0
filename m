From: Valdis.Kletnieks@vt.edu
Subject: Re: Proposal for keying encrypted filesystem
Date: Thu, 03 Apr 2003 15:08:52 -0500
Message-ID: <200304032008.h33K8qS7007850@turing-police.cc.vt.edu>
References: <200303282026.23543.phma@webjockey.net> <200303291155.40419.phma@webjockey.net> <3E85E338.CEAA7DC7@namesys.com> <200303301130.24136.phma@webjockey.net> <3E8824B4.55C63A55@namesys.com> <3E88300C.22B54FD7@namesys.com> <20030331133618.GO8452@hvs.envisage.co.za> <3E88496C.E83B780F@namesys.com> <20030331164502.GU8452@hvs.envisage.co.za> <3E8985D5.7CA598FF@namesys.com> <3E89B908.1070106@namesys.com> <200304031614.h33GE7S7004132@turing-police.cc.vt.edu>
            <3E8C8EEE.3060604@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_655021196P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13560-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Thu, 03 Apr 2003 23:43:42 +0400."
             <3E8C8EEE.3060604@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

--==_Exmh_655021196P
Content-Type: text/plain; charset=us-ascii

On Thu, 03 Apr 2003 23:43:42 +0400, Hans Reiser said:

> Ok, let's do it.  Edward, find some documentation about this and send us 
> info....

http://lsm.immunix.org/
http://www.coker.com.au/selinux/   Russ Coker's NSA Security Enhanced Linux package

One thing you want to be careful about is to make sure your LSM module
is "composable" - in other words, that it plays nice with other modules.  Some
modules stack nicely, some dont.

--==_Exmh_655021196P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE+jJTUcC3lWbTT17ARAn85AJ40DbEJ+zLKOtIfEYS0HZcZyArgVQCgxJHl
aRMllMgZdN0wu+KjAQjd8KY=
=t65A
-----END PGP SIGNATURE-----

--==_Exmh_655021196P--
