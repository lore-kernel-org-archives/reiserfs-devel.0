From: Mike Benoit <ipso@snappymail.ca>
Subject: Re: Authoring a versioning plugin
Date: Thu, 12 Jan 2006 11:13:35 -0800
Message-ID: <1137093215.14766.42.camel@ipso.snappymail.ca>
References: <200601111759.14638.fred@lab.matcom.uh.cu>
	 <43C5FAE0.5090602@namesys.com> <200601121434.54881.fred@lab.matcom.uh.cu>
	 <200601121505.38907.fred@lab.matcom.uh.cu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-KVfqopGeyMhMIfvaaRjB"
Return-path: <reiserfs-list-return-27685-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200601121505.38907.fred@lab.matcom.uh.cu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Yoanis Gil Delgado <fred@lab.matcom.uh.cu>
Cc: reiserfs-List@namesys.com

--=-KVfqopGeyMhMIfvaaRjB
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Thu, 2006-01-12 at 15:05 -0500, Yoanis Gil Delgado wrote:
> On Thursday 12 January 2006 02:34 pm, you wrote:
> > On Thursday 12 January 2006 01:44 am, you wrote:
> > > Hans Reiser wrote:
> > > > =20
> > > >
> > > >  I am skeptical that having it occur with every
> > > >write is desirable actually.
> > > > =20
> > >
> > > Consider the case where you type cat file1 >> file2.  This will produ=
ce
> > > a version of file2 for every 4k that is in file1, because (well I did=
n't
> > > look at the bash source, but I would guess) it appends in 4k incremen=
tal
> > > writes rather than one big write.  Versioning on file close makes mor=
e
> > > sense, but I suggest manual control using the ..../checkin pseudofile=
,
> > > and then we can reasonably make it the default plugin for the whole F=
S
> > > (write it so that it calls the other plugins so that when we change t=
he
> > > other plugins we don't need to change your code to do it).  People wh=
o
> > > don't want versioning will simply never touch the checkin pseudofile.
> > > Make sure that for that case there is just an if statement condition
> > > check as overhead, and there will be no reason to not make versioning
> > > the default plugin that happens to do nothing unless you use the chec=
kin
> > > pseudofile at least once during the life of the file.
> > >
> > > hmm, maybe ..../snap is better than ..../checkin ?  Well, let's decid=
e
> > > that once the code is written....;-)
> > >
> > > Do you agree with my points here?
> >
>  Yes I agree with your points. Still, i will like that some files have au=
to
>  versioning.

Would you be able to enable auto versioning for an entire directory,
including all new files created in it? For instance I would like to
enable auto versioning on the /etc/ directory, so I can always track
changes to config files.

Also I assume it will track which UID makes the change?

--=20
Mike Benoit <ipso@snappymail.ca>

--=-KVfqopGeyMhMIfvaaRjB
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2 (GNU/Linux)

iD8DBQBDxqpfMhKjsejwBhgRAlVxAKCPO8Yaz+WWkTFATksiBeXPD/KCgwCdGutx
G7834HQj2uB3hzZmx0biWIU=
=139C
-----END PGP SIGNATURE-----

--=-KVfqopGeyMhMIfvaaRjB--

