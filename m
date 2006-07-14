From: Jonathan Briggs <jbriggs@esoft.com>
Subject: Re: another semantic storage system (in userspace)
Date: Thu, 13 Jul 2006 18:23:20 -0600
Message-ID: <1152836600.6894.12.camel@localhost>
References: <87veq233dm.fsf@evinrude.uhoreg.ca>
	 <20060713170626.GE31144@HAL_5000D.tc.ph.cox.net>
	 <44B6850F.9010801@namesys.com>  <87veq1z1qc.fsf@evinrude.uhoreg.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-+DLy/NLmSg8HNVWCeIL/"
Return-path: <reiserfs-list-return-28996-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87veq1z1qc.fsf@evinrude.uhoreg.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hubert Chan <hubert@uhoreg.ca>
Cc: Reiserfs mail-list <Reiserfs-List@namesys.com>

--=-+DLy/NLmSg8HNVWCeIL/
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2006-07-13 at 16:30 -0400, Hubert Chan wrote:
> On Thu, 13 Jul 2006 10:38:23 -0700, Hans Reiser <reiser@namesys.com> said=
:
>=20
> > Clay Barnes wrote:
>=20
> >> 1) Scope
> >> a) Should the semantic content of files be purely user-defined?
>=20
> > Yes.
>=20
> I guess this also raises the question of how multiple users on the same
> machine can define their own semantic content (e.g. if user A wants to
> index some new file format, but doesn't want to have to bug the
> administrator to add support for it).  Will the filesystem be talking to
> some userspace daemons?

I was thinking that the file system should only index its own meta-data
attributes.  A user-space daemon should read the file contents and
create these attributes.

Search directories would display selected parts of the indexes.  One of
these that would be highly useful for a user-space indexing daemon is a
timestamp search directory.  The indexer would begin with the timestamp
search set to (UID =3D=3D my user and timestamp > 0).  After indexing a few
files it would update the search to (my user and > timestamp of last
indexed file).  Or possibly, if Reiser4 has something like a 64-bit
monotonic update ID, it could use that instead of a timestamp.

If the filesystem indexes are not going to be updated in real-time but
only at specific times, another search type that could list updated but
not yet indexed files would also be useful.
--=20
Jonathan Briggs <jbriggs@esoft.com>
eSoft, Inc.

--=-+DLy/NLmSg8HNVWCeIL/
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)

iD8DBQBEtuP4G8fHaOLTWwgRAllpAJ9dSp06VxXSDVhKIAljrmIFKWt4dACeMyfn
CWbA8rdm2owMmkKiDsPlqw8=
=c3xd
-----END PGP SIGNATURE-----

--=-+DLy/NLmSg8HNVWCeIL/--

