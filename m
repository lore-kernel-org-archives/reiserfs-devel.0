From: Valdis.Kletnieks@vt.edu
Subject: Re: newer r4 snapshots?
Date: Fri, 24 Sep 2004 19:05:42 -0400
Message-ID: <200409242305.i8ON5gi7001773@turing-police.cc.vt.edu>
References: <555047326.20040924170651@wp.pl> <41545B77.8040101@namesys.com> <999723148.20040924205515@wp.pl>
            <41549CF7.9060307@willsmith.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1175698512P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21912-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Sat, 25 Sep 2004 06:17:27 +0800."
             <41549CF7.9060307@willsmith.org> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Will Smith <will@willsmith.org>
Cc: reiserfs-list@namesys.com

--==_Exmh_-1175698512P
Content-Type: text/plain; charset=us-ascii

On Sat, 25 Sep 2004 06:17:27 +0800, Will Smith said:
> Do we have to follow -mm to obtain updates to the v4 code?
> 
> I would rather keep a relatively stable Linux kernel but have bleeding
> edge reiser4 to test.
> 
> Is such an option available?
> 
> If not, is there a changelog describing which reiser4 changes have
> been integrated into each -mm kernel?

You can retrieve the 2.6.X-mmY-broken-out.tar.gz, which has all the
separate patches in it - the 'series' file indicates the order the patches
should get applied.

for i in `grep ^reiser broken-out/series`; do
   patch -p1 < broken-out/$i
done

(add salt, pepper, and seasoning to taste.. ;)

The problem you'll hit is that there's probably interdependencies
that you'll have to hand-resolve - for starters, the very first patch
that goes into -mm is linus.patch, which Andrew told me is "whatever was
in Linus's BK an hour or so before" (i.e. it's probably even more bleeding
edge than the most recent -bk snapshot).  So you're probably going to
end up doing some hand-editing to make stuff work.

Right now, patch.2.6.9-rc2 is some 432K lines, and linus.patch is
another 135K.  Good luck. ;)


--==_Exmh_-1175698512P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFBVKhFcC3lWbTT17ARAkllAKDULtScfSvmNHZP9To36AHbPQRq6gCaAux3
B9zHWUhRyDZJIDVGVxIQhrc=
=ERMg
-----END PGP SIGNATURE-----

--==_Exmh_-1175698512P--
