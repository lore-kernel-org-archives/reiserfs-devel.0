From: Valdis.Kletnieks@vt.edu
Subject: Re: fsync() Performance Issue
Date: Mon, 29 Apr 2002 14:58:08 -0400
Message-ID: <200204291858.g3TIw8Qn009356@foo-bar-baz.cc.vt.edu>
References: <93F527C91A6ED411AFE10050040665D0049BF961@corpusmx1.us.dg.com> <20020429162020.92AD93EA8@lyta.coker.com.au> <6tsqcu0887p2396p14cn2krqrhh1o0dhfk@4ax.com>
            <m3adrmz8us.fsf@merlin.emma.line.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-794612288P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10201-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: Your message of "Mon, 29 Apr 2002 19:56:59 +0200."
             <m3adrmz8us.fsf@merlin.emma.line.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Cc: reiserfs-list@namesys.com

--==_Exmh_-794612288P
Content-Type: text/plain; charset=us-ascii

On Mon, 29 Apr 2002 19:56:59 +0200, Matthias Andree <ma@dt.e-technik.uni-dortmund.de>  said:

> Barring write cache effects, fsync() only returns after all blocks are
> on disk. While I'm not sure if and if yes, which, Linux file systems are
> affected, but for portable applications, be aware that sync() may return
> prematurely (and is allowed to!).

And in fact is the reason for the old "recipe":
  # sync
  # sync
  # sync
  # reboot

On the older Vax 750-class machines, sync could return LONG before the blocks
were all flushed - the second 2 sync's were so you were busy typing for
several seconds while the disks whirred.  Failure to understand the typing
speed issue has lead at least one otherwise-clued author to recommend:
  # sync;sync;sync
  # reboot

(the distinction being obvious if you think about when the shell reads the
commands, and when it does the fork/exec for each case....)

-- 
				Valdis Kletnieks
				Computer Systems Senior Engineer
				Virginia Tech



--==_Exmh_-794612288P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQE8zZfAcC3lWbTT17ARAr7qAJ9UWivnpPRK6XjhU5QgJSfoK5u+OACfVBOX
oTnE5Jjg8dKeO+zLjUrlfVk=
=OrLc
-----END PGP SIGNATURE-----

--==_Exmh_-794612288P--
