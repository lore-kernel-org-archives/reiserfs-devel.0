From: Valdis.Kletnieks@vt.edu
Subject: Re: reiser4 non-free?
Date: Tue, 11 May 2004 11:02:52 -0400
Message-ID: <200405111502.i4BF2qOu012463@turing-police.cc.vt.edu>
References: <1084188152.26226.196158678@webmail.messagingengine.com> <20040510.214915.74754947.wlandry@ucsd.edu> <200405110158.i4B1wONb022531@turing-police.cc.vt.edu>
            <20040510.223329.108738295.wlandry@ucsd.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="==_Exmh_-344009184P";
	 micalg=pgp-sha1; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18607-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: Your message of "Mon, 10 May 2004 22:33:29 EDT."
             <20040510.223329.108738295.wlandry@ucsd.edu> 
List-Id: <reiserfs-devel.vger.kernel.org>
To: Walter Landry <wlandry@ucsd.edu>
Cc: debian-legal@lists.debian.org, reiser@namesys.com, reiserfs-list@namesys.com, ed@debian.org, cavok@debian.org

--==_Exmh_-344009184P
Content-Type: text/plain; charset=us-ascii

On Mon, 10 May 2004 22:33:29 EDT, Walter Landry <wlandry@ucsd.edu>  said:

> I think you're agreeing with me.  I can't make it a simple red circle
> or green square.  I have to spit out the credits _and_ the
> circle/square.

No, what's happening is that the mkfs program is spitting out the credits,
which are being read by a Perl/tktcl/python/whatever script which is then
parsing it and deciding whether to show the user a circle or a square.

The concept that the user would actually see the program output during system
bootup died when the Bell Lab guys first put 'foo > /dev/null' into a /etc/rc
script back in the late 60s.

For that matter, it probably died in late 1963, when Fred Brooks was steering
the IBM team that produced (among other things) JCL, and the team thought that
coding:

//GO.SYSPRINT DD DUMMY

was something reasonable to support (that's the JCL equiv of "> /dev/null").

I pondered the whole "credits" question for a bit last night, and I realized
that (a) I could account for at least the last 75 'mkfs' commands I had caused
to run, and (b) of those 75, exactly *one* did *not* have all of its output
swallowed by 'anaconda' during a RedHat or Fedora install.....


--==_Exmh_-344009184P
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Exmh version 2.5 07/13/2001

iD8DBQFAoOsccC3lWbTT17ARAmysAKCSAz5SW+tuL60LD9KBxK2J+v7HZACg9Pvy
6mkRUVXDeXO2QVrwZSZHu3s=
=VFL3
-----END PGP SIGNATURE-----

--==_Exmh_-344009184P--
