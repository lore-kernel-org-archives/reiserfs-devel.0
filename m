From: Chris Mason <mason@suse.com>
Subject: Re: reiserfs on removable media
Date: 02 Jul 2003 15:17:13 -0400
Message-ID: <1057173432.20903.927.camel@tiny.suse.com>
References: <pan.2003.07.02.14.23.09.812119.20132@umail.hungrycats.org>
	 <3F032A33.3050303@namesys.com> <1057172345.20904.923.camel@tiny.suse.com>
	 <200307022108.49841.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14810-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200307022108.49841.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Hans Reiser <reiser@namesys.com>, Andreas Dilger <adilger@clusterfs.com>, Zygo Blaxell <eazgwmir@umail.furryterror.org>, reiserfs-list@namesys.com

On Wed, 2003-07-02 at 15:08, Dieter N=FCtzel wrote:
> Am Mittwoch, 2. Juli 2003 20:59 schrieb Chris Mason:
> > On Wed, 2003-07-02 at 14:53, Hans Reiser wrote:
> > > >This is called ordered data mode, and exists on ext3 and also reiser=
fs
> > > > with Chris Mason's patches.  Under normal usage it shouldn't change
> > > > performance compared to writeback data mode (which is what reiserfs
> > > > does by default).
>=20
> Chris,
>=20
> I thought data=3Dordered is the "new" default with your patch?
>=20
It is.

> > > It had some impact, I forget exactly how much, maybe Chris can
> > > resuscitate his benchmark of it?
> >
> > The major cost of data=3Dordered is that dirty blocks are flushed every=
 5
> > seconds instead of every 30.  The journal header patch in my
> > experimental data logging directory changes things so that only new
> > bytes in the file are done in data=3Dordered mode (either adding a new
> > block or appending onto the end of the file).
> >
> > This helps a lot in the file rewrite tests.
>=20
> What's faster than with your patches? ordered|journal|writeback?
>=20
> I thought is order: writeback < ordered < journal ;-)

Usually ;-)  ordered is faster in a few rare benchmarks because it helps
keeps the number of dirty buffers lower and generally sends the dirty
buffers to the disk in a big flood.

journal is faster for some fsync heavy benchmarks.

For practical desktop usage, data=3Dordered and writeback are usually
close to each other.

-chris


