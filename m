From: Chris Mason <mason@suse.com>
Subject: Re: New to reiserfs
Date: 14 May 2002 09:10:46 -0400
Message-ID: <1021381846.20175.572.camel@tiny>
References: <200205132153.59075.Dieter.Nuetzel@hamburg.de>
	<3CE028A3.3080002@namesys.com> 
	<200205132324.24309.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10306-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <200205132324.24309.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Hans Reiser <reiser@namesys.com>, Oleg Drokin <green@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>, JPASTORM@esade.edu

On Mon, 2002-05-13 at 17:24, Dieter N=FCtzel wrote:

> >
> > You should put squid into one big directory (not using their kludge tha=
t
> > avoids making directories too large by using a tree)
>=20
> So you understand me right...;-)
>=20
> > unless you have multiple processors (in which case the VFS directory gi=
ant
> > lock will hurt you).
>=20
> BKL?
>=20
> Where is the limit 2, 4, or even more CPUs?
> I'll have two in some days.

You probably want one directory per squid process.  The VFS layer does
semaphore locking to prevent races between people reading the directory
and people changing the directory.  If you've just got one big
directory, all the squid processes will end up waiting on each other.

More directories mean more time wasted changing the directory stat data,
and ram wasted on reading the stat data.  You see this more with
hundreds or thousands of directories.

-chris


