From: Stewart Smith <stewart@flamingspork.com>
Subject: Re: Longhorn FS being removed to Blackcomb (end of decade)
Date: Sat, 10 Apr 2004 16:33:27 +1000
Message-ID: <1081578802.13650.30.camel@kennedy>
References: <3DF9165145FACB4C96977FF650C1E9040C469DD0@its-mail1.its.corp.gwl.com>
	 <1081539224.19257.55.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-zNgzbw08X35/5707FNWi"
Return-path: <reiserfs-list-return-17828-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1081539224.19257.55.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Jonathan Briggs <jbriggs@esoft.com>
Cc: "Burnes, James" <james.burnes@gwl.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

--=-zNgzbw08X35/5707FNWi
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2004-04-10 at 05:33, Jonathan Briggs wrote:
> I think the best way to be doing database features is with a fast,
> robust file change notification feature, and do the database in user
> space.  Some filesystem features would be required, but I think metadata
> and two-way hard links is all we need.

Symbolic links would quite possibly work better - as then you can
extract the path of the original file, and with the manipulation of
these symlinks being part of the file manipulation atom (as in, an
atomic operation), consistency wouldn't be a problem.

> The daemon could watch directory creation and look for query metadata on
> directories.  When found, it would use index directories or full
> filesystem search to fill in the query results.

You have a lot of consistency problems here. Consider this:
1. process 1 creates file
2. kernel tells userspace to index it
CRASH

the userspace daemon hasn't had time to put it into the index. On
reboot, how do you get a list of files to insert into the index without
scanning every single file on disk (essentially a fsck)? You can't - so
you're in trouble. You could have a to-be-indexed directory of hard/sym
links where as the userspace utility flushes the index of the item to
disk, it is removed from there. That could work... but it requires the
creat() (etc) operations to also create this link atomically, otherwise
you could create the file, but not have it in the "to be indexed" list.

It's for these kinds of reasons that all the befs indexing stuff is all
in kernel.

--=20
Stewart Smith (stewart@flamingspork.com)
http://www.flamingspork.com/


--=-zNgzbw08X35/5707FNWi
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBAd5Ux3tgLgERgy8oRAtXhAKCBiwnsn2UU9jubpKuatDCg8A7M3QCffSAC
HgCvPyp9BuybNeIxkKMHMZ4=
=8NlR
-----END PGP SIGNATURE-----

--=-zNgzbw08X35/5707FNWi--

