From: Chris Mason <mason@suse.com>
Subject: Re: Data-logging and md as / fs bug
Date: 08 May 2003 09:31:25 -0400
Message-ID: <1052400685.14617.489.camel@tiny.suse.com>
References: <3EB30852.6090402@netscape.net>
	 <200305062134.42520.christian.mayrhuber@gmx.net>
	 <1052250298.14612.235.camel@tiny.suse.com>
	 <200305062156.27595.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14019-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200305062156.27595.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list <reiserfs-list@namesys.com>

On Tue, 2003-05-06 at 15:56, Dieter N=FCtzel wrote:
> Am Dienstag, 6. Mai 2003 21:44 schrieb Chris Mason:
> > On Tue, 2003-05-06 at 15:34, Christian Mayrhuber wrote:
> > > Hi,
> > >
> > > I've patched 2.4.21-rc1 with the following:
>=20
> I have nearly the same running on-top of 2.4.21-pre6-jam1
>=20
> > > 02-akpm-b_journal_head-1.diff
>=20
> Needed?
>=20

Yes

> > > 03-2.4.21-rc1-relocation-6.diff
> > > 04-reiserfs-sync_fs-1.diff
> > > 05-2.4.21-pre6-data-logging-36.diff
> > > 06-logging-export.diff
>=20
> Needed?

06-logging-export is only needed if you want to compile reiserfs as a
module

>=20
> > > 06-write_times.diff
>=20
> I have -aa;-)
>=20
> > > 07-quota-v2-2.4.21.diff
> > > 08-2.4.21-pre6-reiserfs-quota-26.diff
>=20
> Both not, yet.
>=20
> > > 09-kinoded-8.diff
> > > 10-reiserfs-quota-link-fix.diff
>=20
> Needed?
>=20

Only if you are using quota

> 11.dirty-inodes-for-kinoded.diff

This is flawed, since it does not include any way to throttle inode
changes.  kinoded can't keep up with an active FS, and major changes are
needed to fix that.  I've dropped it for now.

> iget5_locked_for_2.4.21-pre5-datalogging.diff

Not needed any more.

> search_reada-4.diff
>=20
> Usefull?

Good for desktop workload, needs additional changes for random io.

-chris


