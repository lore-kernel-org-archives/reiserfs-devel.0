From: Valdis.Kletnieks@vt.edu
Subject: Re: reiser4 non-free?
Date: Tue, 11 May 2004 12:35:15 -0400
Message-ID: <200405111635.i4BGZFZ1024441@turing-police.cc.vt.edu>
References: <1084188152.26226.196158678@webmail.messagingengine.com> <20040510.214915.74754947.wlandry@ucsd.edu> <200405110158.i4B1wONb022531@turing-police.cc.vt.edu> <20040510.223329.108738295.wlandry@ucsd.edu> <200405111502.i4BF2qOu012463@turing-police.cc.vt.edu>
            <40A0F93F.8020604@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_737475675P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18612-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Tue, 11 May 2004 09:03:11 PDT."
             <40A0F93F.8020604@namesys.com> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: Walter Landry <wlandry@ucsd.edu>, debian-legal@lists.debian.org, reiserfs-list@namesys.com, ed@debian.org, cavok@debian.org

--==_Exmh_737475675P
Content-Type: text/plain; charset=us-ascii

On Tue, 11 May 2004 09:03:11 PDT, Hans Reiser said:
> Valdis.Kletnieks@vt.edu wrote:

> >I pondered the whole "credits" question for a bit last night, and I realized
> >that (a) I could account for at least the last 75 'mkfs' commands I had caused
> >to run, and (b) of those 75, exactly *one* did *not* have all of its output
> >swallowed by 'anaconda' during a RedHat or Fedora install.....

> Yes, I believe that, and that is my concern. 

Unfortunately, this way lies madness - the IBM AIX install stuff *does* scroll
the copyrights for every single program as it installs.

It *sucks*.  Badly.

I've had system upgrades that have had 12 *thousand* lines of output from
copyright notices - and the way IBM makes sure that you see them is by
outputting them to the same place as the error messages, so you can't just
redirect the notices.

And yes, at least twice I've managed to render a system unbootable because I
missed something important scrolling by....

The problem isn't "What do we do if Hans does this?".. The problem is that
Fedora Core 2 is coming in at just under 1,700 RPMs, of which some 750 are
installed in a default "workstation" install.

What happens when the *other* 749 do it too?  You end up with a tragedy
of the commons - *none* of the 750 get read, and the installer becomes
unusable....


--==_Exmh_737475675P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAoQDDcC3lWbTT17ARAvPIAKD4EIqdSS63ZCPOhVZi7CsQhSDx6wCfXUmw
H867x510rNQcAi5l3DQilQo=
=Oq7i
-----END PGP SIGNATURE-----

--==_Exmh_737475675P--
