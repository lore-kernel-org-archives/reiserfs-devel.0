From: Ryan Underwood <nemesis-lists@icequake.net>
Subject: Re: Reiserfs Data Recovery
Date: Mon, 8 Mar 2004 19:13:11 -0600
Message-ID: <20040309011311.GA15226@dbz.icequake.net>
References: <404C81B9.4050504@nsanity.com> <20040308184124.GE5817@dbz.icequake.net> <404CC8AA.9020405@nsanity.com> <20040308215919.GB11093@dbz.icequake.net> <404CF46B.10000@nsanity.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1yeeQ81UyVL57Vl7"
Return-path: <reiserfs-list-return-17129-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <404CF46B.10000@nsanity.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nick Vahalik <nick@nsanity.com>
Cc: reiserfs-list@namesys.com

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Mon, Mar 08, 2004 at 04:32:11PM -0600, Nick Vahalik wrote:
> Same here.  Of course, now I'm wondering if the crash had anything to do=
=20
> with a possible faulty drive.  It's one of those IBM Deathstars!  I=20
> forgot about it until about 2 am this morning when I found my receipt. =
=20
> Eh, well at least I had my code backed up...

Oh wow, you do definitely want to run IBM DFT as soon as possible.  That
might be the only thing that is wrong... usually you would see some
syslog errors though when you tried to mount the drives if the system
was having problems reading from the drive(s).  DFT should not destroy
any data or make anything worse, but it will try to relocate the sector
if it is having trouble reading it.

this firmware upgrade was released a while ago and corrects some
deathstar crashing if you have one of the listed drives:
http://www-1.ibm.com/support/docview.wss?rs=3D0&q=3DDTLA&uid=3Dpsg1MIGR-441=
95

> Well, I was thinking about doing more of a raw data recovery.  We have=20
> tools that will just simply look for files minus the structure and dump=
=20
> the results out into a spare drive.  I did this once to another web=20
> server I had.  It recovered 80% of my code... and the MBR/SB was=20
> completely eradicated on that drive as well.

Yeah, I guess you can try something if you have the tools, but just
guessing that to get anything serious done you will need tools that
understand Reiser structures.  Otherwise all you can do in a general
case is to find contiguous allocation blocks and try to piece together
files from those.  That approach might get all of your data, though
pieceing it together would be loads of fun...

> Well you replied, and I guess this is just another lesson to backup,=20
> backup, backup!  In all honesty, I don't think the filesystem itself is=
=20
> damaged, I still think it's just the superblock.  I've had this problem=
=20
> before with another drive... it just decided to MBR/Root SB... It was=20
> also an Hitachi (IBM) Drive.  *sigh*  Oh well, I'll just set the drives=
=20
> aside and leave em.  Maybe in a week or two I'll have enough money to=20
> actually afford $25.=20

I think you might try the DFT approach before giving up, but definitely
don't do anymore damage with reiserfsck. :)  Also, since this is a
stripe set, is the md device able to start the raid successfully?  If
so, and if it only fails when you try to mount the filesystem on the
raid, you will have better chances than if md can't even figure out that
you have a stripe set spanning those disks.

--=20
Ryan Underwood, <nemesis@icequake.net>

--1yeeQ81UyVL57Vl7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFATRonIonHnh+67jkRAlUoAJ9cnNKtz3I9vke27xbMmI4Qx7Oz2gCaA2R6
c2vyR87jtEuTQObvoqfKSRQ=
=2fMo
-----END PGP SIGNATURE-----

--1yeeQ81UyVL57Vl7--
