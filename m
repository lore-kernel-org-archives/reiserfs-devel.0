From: Yury Umanets <umka@namesys.com>
Subject: Re: reiser4 snapshot
Date: Tue, 12 Aug 2003 13:54:28 +0400
Message-ID: <1060682068.21149.40.camel@haron.namesys.com>
References: <16183.48363.884605.564937@laputa.namesys.com>
	 <pan.2003.08.12.00.32.11.185228@math.ubc.ca>
	 <20030812060542.GA5363@namesys.com> <20030812072220.GA29079@chepelov.org>
	 <1060673517.21149.7.camel@haron.namesys.com>
	 <20030812080212.GA23206@chepelov.org>
	 <1060676758.21147.23.camel@haron.namesys.com>
	 <20030812094852.GB22491@chepelov.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15299-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030812094852.GB22491@chepelov.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Cyrille Chepelov <cyrille@chepelov.org>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

On Tue, 2003-08-12 at 13:48, Cyrille Chepelov wrote:
> Le Tue, Aug 12, 2003, =E0 12:25:58PM +0400, Yury Umanets a =E9crit:
>=20
> > Everything is fixed and new snapshot is in
> > http://thebsh.namesys.com/snapshots/2003.08.11/.
> >=20
> > See ./configure --help for new option --with-libaal.
>=20
> That fixes it, thanks!

>=20
> It can be debated whether --with-libaal=3D/foo/bar should imply
> LD_LIBRARY_PATH=3D$LD_LIBRARY_PATH:/foo/bar/lib or not (it doesn't seem it
> does right now), but at least it's now possible to build and install
> libaal + reiser4progs in a user tree without touching /usr.

I guess, it is not the job for configure script, but rather for
user/administrator. At least I don't even one project that do so :)

>=20
> 	-- Cyrille


