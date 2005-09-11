From: Valdis.Kletnieks@vt.edu
Subject: Re: we have got hash function screwed up
Date: Sat, 10 Sep 2005 23:00:24 -0400
Message-ID: <200509110300.j8B30P7q013142@turing-police.cc.vt.edu>
References: <431C738F.4010803@freemail.hu>
            <4322FD91.4060404@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1126407624_12093P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25923-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sat, 10 Sep 2005 17:36:49 +0200."
             <4322FD91.4060404@gmx.net> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: evilninja <evilninja@gmx.net>
Cc: reiserfs-list@namesys.com, Gabor HALASZ <halasz.g@freemail.hu>

--==_Exmh_1126407624_12093P
Content-Type: text/plain; charset=us-ascii

On Sat, 10 Sep 2005 17:36:49 +0200, evilninja said:
> Gabor HALASZ schrieb:
> > Sep  5 12:30:24 sk8n kernel: ReiserFS: dm-10: checking transaction log (dm-10)
> > Sep  5 12:30:24 sk8n kernel: ReiserFS: dm-10: Using rupasov hash to sort names
> 
> why did you choose the rupasov hash?
> http://www.namesys.com/mount-options.html knows:
> 
> rupasov: [...] Never use it, as it has high probability of hash
>          collisions.

Why is it selectable then?

Yes, I know there's needs to support borked legacy filesystems that were mkfs'ed
before the problem was recognized.  That means fsck.reiserfs needs to know about
it - but mkfs.reiserfs??  Seen in the Fedora Core devel tree as of tonight:

% rpm -q reiserfs-utils
reiserfs-utils-3.6.19-2
% strings /sbin/mkfs.reiserfs  | grep -i rupasov
rupasov
  -h | --hash rupasov|tea|r5       hash function to use by default


--==_Exmh_1126407624_12093P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFDI53IcC3lWbTT17ARAvnGAKCmSn6+FT/i0kEVy1Eq3uxFOsXrJQCg+pVL
eL0CVOJmO5w4ggtoFo/FPKM=
=OnJP
-----END PGP SIGNATURE-----

--==_Exmh_1126407624_12093P--
