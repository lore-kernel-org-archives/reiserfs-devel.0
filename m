From: Valdis.Kletnieks@vt.edu
Subject: Re: viewprinting: what format should views be stored in?
Date: Fri, 20 Aug 2004 12:10:58 -0400
Message-ID: <200408201610.i7KGAwLm014275@turing-police.cc.vt.edu>
References: <20040820072324.CA4DA15D92@mail03.powweb.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-1364767896P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20435-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Fri, 20 Aug 2004 07:23:24 -0000."
             <20040820072324.CA4DA15D92@mail03.powweb.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: David Dabbs <david@dabbs.net>
Cc: reiser@namesys.com, reiserfs-list@namesys.com

--==_Exmh_-1364767896P
Content-Type: text/plain; charset=us-ascii

On Fri, 20 Aug 2004 07:23:24 -0000, David Dabbs said:

> Hans and George, what did you find lacking in currently-available Linux security
> module frameworks such as LIDS or LSM? They provide system function hooks
> in which module writers may control object access. LSM-based work is on-going. See 
> http://sic.iaik.tugraz.at/Best%20Paper%20Award/2004/LSM_quaritsch_winkler.pdf
> for details of their addition of module stacking (multiple policies) and hooks into
> the TCP layer. I'm going to read up on these frameworks.

Amen to that - while reading through Hans' summary, I was having a hard time
figuring out what this was buying us that SELinux doesn't provide. Thanks for the
pointer to the Quartisch&Winkler paper, as module stacking seems to be heating up.
The "usual scenario" for what people seem to want with LSM is a MAC system
like SELinux or LIDS, then zero or more "pathological case" handlers (for
instance, the 'BSD Securelevels' LSM, or some variant of the OpenWall mods, or
a chroot/jail module) to harden a specific aspect of the system, and then the
Capabilities LSM.

The biggest reason for wanting to do security at the LSM level rather than the
filesystem level is because that way you can *really* secure things (hint -
your filesystem can be as secure as you want, but if you don't also secure
stuff like unix-domain sockets or SYSV shared memory segments, 2 cooperating
processes can end-run an MLS trying to prevent it....)

If there's a specific need that you can't think of how to implement via SELinux
or the low-level LSM calls, please feel free to ask - if the exact nature of
the problem is itself sensitive, I can vector you to people over on the spook
side of the fence who should be able to either help you out or redirect you to
even spookier people.. ;)


--==_Exmh_-1364767896P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFBJiKRcC3lWbTT17ARAqwUAKCk1/O8TrAu1UyninrglB6g9UitoACgnJh3
G3IBma+23GZP5AwO4QLZx6Q=
=5Rtg
-----END PGP SIGNATURE-----

--==_Exmh_-1364767896P--
