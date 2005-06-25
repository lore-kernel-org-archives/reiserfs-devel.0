From: Valdis.Kletnieks@vt.edu
Subject: Re: reiser4 plugins
Date: Fri, 24 Jun 2005 22:20:50 -0400
Message-ID: <200506250220.j5P2KoFw017143@turing-police.cc.vt.edu>
References: <tdwebste2@yahoo.com> <20050624093510.4330.qmail@web51301.mail.yahoo.com> <200506241545.j5OFj3Iw014214@laptop11.inf.utfsm.cl> <2f9ccaae050624101329390969@mail.gmail.com> <200506242138.j5OLcPr0025054@turing-police.cc.vt.edu> <2f9ccaae0506241520ffa8aa@mail.gmail.com> <200506250037.j5P0bOWn016330@turing-police.cc.vt.edu>
            <42BCAAFB.2000200@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_1119666050_6755P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24569-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 24 Jun 2005 17:53:15 PDT."
             <42BCAAFB.2000200@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: perry@kundert.ca, ReiserFS List <reiserfs-list@namesys.com>

--==_Exmh_1119666050_6755P
Content-Type: text/plain; charset=us-ascii

On Fri, 24 Jun 2005 17:53:15 PDT, Hans Reiser said:
> Valdis.Kletnieks@vt.edu wrote:
> 
> > Right - once the VFS hands the call off to reiser4, you're on your own
> >
> >as far as I'm concerned..
> >  
> >
> Well, that is all I ask for, and Christophe and company disagree..... 
> Happy to abstract it more into VFS after the merge if others want it
> though....

Unfortunately, the only *realistic* path I can see at the moment is to strip
it down to those reiser4 features that don't require any VFS help/changes to
do, and pursue VFS changes as a separate issue entirely.

Also, just as a personal note - talking about a "reiser4 plugin that does ext3
backend storage" doesn't help the cause.  What you *should* be trying to sell:

1) a reiser4 storage backend with backend plugins that follows the VFS conventions.
2) a vastly enhanced VFS that has VFS plugins and calls reiser4 and ext3 backends.

Approaching it that way will make people think that (a) you really *do* understand
the VFS/FS layering and (b) are willing to compromise to get things done.. ;)


--==_Exmh_1119666050_6755P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFCvL+CcC3lWbTT17ARAlDaAKCh5zEuuP61CsaV+Tqdx8jJtLAA0wCcDteR
uVhTkk/ZKP9NHBPvh7yjNlQ=
=bU1U
-----END PGP SIGNATURE-----

--==_Exmh_1119666050_6755P--
