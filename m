From: Chris Mason <mason@suse.com>
Subject: Re: journal log file
Date: 20 May 2002 10:07:12 -0400
Message-ID: <1021903632.22609.22.camel@tiny>
References: <200205201602.21334.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10389-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200205201602.21334.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Oleg Drokin <green@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Mon, 2002-05-20 at 10:02, Dieter N=FCtzel wrote:
> On Monday 20 May 2002 06:15, Oleg Drokin wrote:
> > > partitions (/, /var and /cache), and two of them were created with
> > > reiserfs (/var and /cache). The thing is my / partition hasn't a lot =
of
> > > room to keep the journal log file. What's the biggest size it can rea=
ch?
> > > Will I have one
> >
> > For a filesystem with 4k blocksize standard journal is always 32M (and
> > variable blocksize or relocated journal patches won't be produced for 2=
.2
> > kernels anyway).
>=20
> Oleg, you should have mentioned that Chris had a "variable" log size patc=
h for=20
> "ages" but he only haven't had enough time for polishing it.
>=20
> I for myself were very excited when we get this in some day 'cause than I=
 have=20
> some little more space on my "boot" partition left or I can shrink it=20
> finally.

Note, namesys guys wrote this patch, it is in 2.5.x already.

-chris


