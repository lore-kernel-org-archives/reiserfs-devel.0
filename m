From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: Still wrong reported file size after --rebuild-tree
Date: Sat, 2 Nov 2002 17:10:15 +0300
Message-ID: <200211021710.15930.vitaly@namesys.com>
References: <20021030193045.69179289.philippe.gramoulle@mmania.com> <200211011630.13195.vitaly@namesys.com> <3DC2ED15.9080403@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11907-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DC2ED15.9080403@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>
Cc: Philippe =?utf-8?q?Gramoull=C3=A9?= <philippe.gramoulle@mmania.com>, reiserfs <reiserfs-list@namesys.com>

On Saturday 02 November 2002 00:07, Hans Reiser wrote:
> Vitaly Fertman wrote:
> >Hi,
> >
> >On Wednesday 30 October 2002 21:30, Philippe Gramoull=C3=A9 wrote:
> >>Hi,
> >>
> >>I just wanted to let you know that after rebuilding the tree for a 500Go
> >>volume, i still have wrong file size reported :
> >>
> >>/dev/sdb1            572418604 174714996 397703608  31% /storage
> >>
> >># ls -l
> >>total 4928006
> >>-r-x-wx-wx 1 daemon   324231      32768 Jan  1  1970 25s.jpg
> >>-r-x--x--- 1 19415372 19415373 83388383504122186 Aug 13 1970 25s_lb.jpg
> >>-r--rw-rw- 1 19415354 19415355 83388306194710840 Aug 13 1970 25slight.j=
pg
> >>-r---wxrwx 1 19415331 19415332 83388207410463009 Aug 13 1970
> >> 25slight_ln.jpg
> >
> >ReiserFS can handle 64 bit file sizes, so from the reiserfsck point of
> > view these are correct sizes.
>
> You mean to say that you haven't written code to check that file sizes
> are correct, yes?

No, I meant that it is considered as a legal situation to have a size in=20
a file statdata greater then its real body size. Thus you can truncate=20
the file to the greater size.=20

However, if you are sure that you do not have files with such holes at=20
the end you can use --ajust-file-sizes option in rebuild and fix-fixable
modes - fixable here - to correct such statdata's file sizes to file body=20
sizes. (Sorry that I have not mentioned about this option in my previous=20
email).=20

--=20

Thanks,
Vitaly Fertman
