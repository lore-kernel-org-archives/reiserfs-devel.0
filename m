From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH CFT] tons of logging patches
Date: 09 Jul 2002 10:00:43 -0400
Message-ID: <1026223243.5603.124.camel@tiny>
References: <200206222202.56577.Dieter.Nuetzel@hamburg.de>
	<1024945533.9008.10.camel@tiny> 
	<200207091552.52815.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10935-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200207091552.52815.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

On Tue, 2002-07-09 at 09:52, Dieter N=FCtzel wrote:
> On Monday, 8 July 2002 13:51, Chris Mason wrote:
> > On Wed, 2002-07-03 at 20:28, Manuel Krause wrote:
> >
> > > So far the 13 prerelease works fine under rootflags boot and=20
> > > mount/remount option "data=3Dordered" on here.
> >
> > I think I've got the bug, it was newly introduced in -13.  New stuff
> > will be uploaded today.
>=20
> Where is your stuff?
> It didn't appeared in your SuSE "home"
> I'm during the preparation of 2.4.19-rc1-jam2-pc (2.4.19pre1aa2 + jam2 + =
page=20
> coloring).

Sigh, further testing showed I'd only fixed half of the bug.  The other
half is somewhere deep writepage/truncate interaction.  I'm still trying
to find it.

-chris


