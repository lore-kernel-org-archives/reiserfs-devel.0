From: Chris Mason <mason@suse.com>
Subject: Re: Re: BTW: 2.4.19-patches-to-come?
Date: 20 May 2002 09:48:14 -0400
Message-ID: <1021902494.22609.20.camel@tiny>
References: <200205171736.50971.Dieter.Nuetzel@hamburg.de>
	<1021650453.14986.914.camel@tiny> 
	<200205172020.51959.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10387-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200205172020.51959.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Oleg Drokin <green@namesys.com>, Manuel Krause <manuelkrause@netscape.net>, ReiserFS List <reiserfs-list@namesys.com>

On Fri, 2002-05-17 at 14:20, Dieter N=FCtzel wrote:
> On Friday 17 May 2002 17:47, Chris Mason wrote:
> > On Fri, 2002-05-17 at 11:36, Dieter N=FCtzel wrote:
> > > Sorry Oleg, that I jump in, here...
> > >
> > > I get from time to time corrupted files (after reboot and replay) whi=
ch
> > > are _NOT_ written during/before crash!!!
> > > It happes during huge C++ compilation of one of my 3D VIS apps.
> > >
> > > After reboot I have waste in the original *.cxx files. This is very
> > > strange and time consuming 'cause I have to remove every broken file =
by
> > > hand and recreate it with CVS when the compiler hit it during the nex=
t
> > > run.
> >
> > Is this on IDE?
>=20
> What? Never ever had such "things" on my private system...;-)

Ah.  What I was hoping for was that tail conversions + writeback caching
were causing these corrupted files.  Clearly that isn't the case.  I'd
be really interested to see if you could reproduce on a vanilla kernel.

-chris


