From: Wouter Verhelst <wouter@grep.be>
Subject: Re: plagiarism of reiserfs by Debian
Date: 20 Apr 2003 01:24:09 +0200
Message-ID: <1050794648.27117.11.camel@rock.grep.be>
References: <200304181604.28955.vitaly@namesys.com>
	 <3EA17427.7040300@namesys.com> <87ademfifz.fsf@deneb.enyo.de>
	 <87y926jjmj.fsf@lgeyermac.math.lsa.umich.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-mfKd4FKiHe9WfwUzBgOL"
Return-path: <reiserfs-list-return-13730-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87y926jjmj.fsf@lgeyermac.math.lsa.umich.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: debian-devel@lists.debian.org, debian-legal@lists.debian.org, reiser@namesys.com, reiserfs-list@namesys.com

--=-mfKd4FKiHe9WfwUzBgOL
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Op za 19-04-2003, om 22:51 schreef Lukas Geyer:
> the issue seems to be the fix of #152547. If we are not allowed to
> remove a screenful of advertising from the output of a program, then
> this unduly restricts the freedom to distribute modified versions.

Uhm.

=46rom the GPL, section 2:

    c) If the modified program normally reads commands interactively
    when run, you must cause it, when started running for such
    interactive use in the most ordinary way, to print or display an
    announcement including an appropriate copyright notice and a
    notice that there is no warranty (or else, saying that you provide
    a warranty) and that users may redistribute the program under
    these conditions, and telling the user how to view a copy of this
    License.  (Exception: if the Program itself is interactive but
    does not normally print such an announcement, your work based on
    the Program is not required to print an announcement.)

Otherwise put: if the program shows the 'no warranty' clause from the
GPL at startup, you may not remove it. Although a 'no warranty' message
is certainly not the same as a list of sponsors, they both require some
messages being printed for legalese reasons. I, personally, see nothing
wrong with that; it certainly doesn't result in software being non-free.

That said, the screenfull of messages indeed is a nuisance; could they
be replaced by a reference to them? I'd think of something like
'development of ReiserFS was sponsored by multiple third parties; please
see <compile-time defined filename> for details', or maybe 'development
of ReiserFS was sponsored by <list of names of third parties>; please
see <compile-time defined filename> for details' if your contracts don't
allow for removal of those names from the output...

--=20
wouter at grep dot be
"An expert can usually spot the difference between a fake charge and a
full one, but there are plenty of dead experts."=20
  -- National Geographic Channel, in a documentary about large African beas=
ts.

--=-mfKd4FKiHe9WfwUzBgOL
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: Dit berichtdeel is digitaal gesigneerd

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA+odqYWgZ1HEtaPf0RAmmYAJ9GQRqI/Y5Lf5Az2ejp+krN8hXYeQCeLc4O
N+I7vXWdRjYaD4LCm/q5yOY=
=I6bb
-----END PGP SIGNATURE-----

--=-mfKd4FKiHe9WfwUzBgOL--
