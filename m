From: Marcel Hilzinger <marcel@hilzinger.hu>
Subject: Re: Linux Gazette benchmark Reiser 4
Date: Mon, 9 Jan 2006 20:01:17 +0100
Message-ID: <200601092001.17684.marcel@hilzinger.hu>
References: <e50d039c0601061010k51b103e4qb799090d52e7b744@mail.gmail.com> <13dbb67f0601070441q559b156ep@mail.gmail.com> <43C2A9D8.80103@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-27640-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43C2A9D8.80103@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Am Montag, 9. Januar 2006 19:22 schrieb Hans Reiser:
> Andrea Gelmini wrote:
> > 2006/1/6, Robert Hulme <rob@robhulme.com <mailto:rob@robhulme.com>>:
> >
> >     http://linuxgazette.net/122/TWDT.html#piszcz
> >
> >     It seems to come off fairly badly in most of the tests.
> >
> >
> > I really did not understand  this kind of benchmark. I don't care
> > which filesystem is faster creating 10.000 files (something I never
> > have to do). I care about which filesystem fits better with my
> > everyday use of my data.
> > Days ago I wrote a few script trying to simulate a tipical desktop
> > session, *my* tipical desktop session. With different filesystem I've
> > got difference of minutes. That's a benchmark that mean something to me.
> > Why I'm trying/looking at reiser4?
> > Because:
> > a) seeks are the real problem of hd (they kill performance);
> > b) journal in a fixed position creates a lot of seeks;
> > c) I love ext2, but my laptop crash a lot of time in a day (tests,
> > battery and so on).
> >
> > Testing reiser4 is giving to me a good feeling with wondering logs.
> > You know... less seek, less HD stress... so more responsiveness.
> > Well, it's too early to express an opinion about R4 (I'm using it
> > since last week), but the only way to test a FS is to use it for a
> > long time.
> >
> > Sorry for my bad english,
> > gelma
>
> reiser4 is normally very fast in creating 10,000 files.  I suspect that
> there was simply error in how he did the test, and when the guys get
> back i will have someone try to reproduce his results.

I made some benchmarks for the german Linux-Magazin 6 month ago. Reiser4 on=
=20
Suse Linux OSS was twice as fast as the next FS when copying the uncompress=
ed=20
kernel-sources. Either there was a bug in the version of reiser4 he used, o=
r=20
he did something completely wrong. =20

If I have some free time, I will redo the benches with kernel 2.6.15
=2D-=20
=DCdv=F6zlettel -- Mit freundlichen Gr=FCssen,
Marcel Hilzinger
