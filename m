From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: BTW: 2.4.19-patches-to-come?
Date: Fri, 17 May 2002 20:20:51 +0200
Message-ID: <200205172020.51959.Dieter.Nuetzel@hamburg.de>
References: <200205171736.50971.Dieter.Nuetzel@hamburg.de> <1021650453.14986.914.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10371-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1021650453.14986.914.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Mason <mason@suse.com>
Cc: Oleg Drokin <green@namesys.com>, Manuel Krause <manuelkrause@netscape.net>, ReiserFS List <reiserfs-list@namesys.com>

On Friday 17 May 2002 17:47, Chris Mason wrote:
> On Fri, 2002-05-17 at 11:36, Dieter N=FCtzel wrote:
> > Sorry Oleg, that I jump in, here...
> >
> > I get from time to time corrupted files (after reboot and replay) which
> > are _NOT_ written during/before crash!!!
> > It happes during huge C++ compilation of one of my 3D VIS apps.
> >
> > After reboot I have waste in the original *.cxx files. This is very
> > strange and time consuming 'cause I have to remove every broken file by
> > hand and recreate it with CVS when the compiler hit it during the next
> > run.
>
> Is this on IDE?

What? Never ever had such "things" on my private system...;-)

If you need the ultimative U160 disk look at the Fujitsu MAM3184 (18 GB) or=
=20
the bigger brother (36 GB). 15k RPM, 3.5 ms  read, 4.0 ms write, silent lik=
e=20
the current ATA-5/6 (!!!) and fast as hell (max 88.9 MB/s) disk transfer ra=
te=20
(!!!). Sadly my old AHA-2940UW can't handle them correctly even as they=20
should "down compatible". Time for a real U160 controller (any=20
bounties?)...-;)

> With tails turned on?

Not at all.

/dev/sda3 on / type reiserfs (rw,noatime,notail)
/dev/sda2 on /tmp type reiserfs (rw,notail)
/dev/sda5 on /var type reiserfs (rw,notail)
/dev/sda6 on /home type reiserfs (rw,notail)
/dev/sda7 on /usr type reiserfs (rw,notail)
/dev/sda8 on /opt type reiserfs (rw,notail)
/dev/sdb1 on /Pakete type reiserfs (rw,notail)
/dev/sdb5 on /database/db1 type reiserfs (rw,notail)
/dev/sdb6 on /database/db2 type reiserfs (rw,notail)
/dev/sdb7 on /database/db3 type reiserfs (rw,notail)
/dev/sdb8 on /database/db4 type reiserfs (rw,notail)

> Are all the affected files less than 16k?

I have to recheck (regenerate the "test case" --- push the power button).

To be precise I got this with and without the data logging patch applied bu=
t I=20
haven't mounted with data logging.

Most (all) former kernel versions with and without preemption+lock-break sh=
own=20
the same.

> > A similar thing happen during kernel compilations.
> > When the system crash (due to kernel devel stuff) some *.o or mostly
> > .*.o.flags files are broken after replay/reboot. Yes, this time they are
> > written before/during crash and rebuild during replay,
>
> This will be taken care of by the data=3Dordered patches.  I'm combining
> them with the data logging stuff.

Ah, then it's time for my data logging results.

See it in my next post.

-Dieter
