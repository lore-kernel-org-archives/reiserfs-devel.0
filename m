From: "Robin H. Johnson" <robbat2@orbis-terrarum.net>
Subject: Re: possible bug - fsck shows perfect results, linux refuses to mount
Date: Mon, 31 Mar 2003 01:16:21 -0800
Message-ID: <20030331091621.GA23666@cherenkov.orbis-terrarum.net>
References: <20030331072250.GC22731@cherenkov.orbis-terrarum.net> <20030331113446.A31858@namesys.com> <20030331074957.GD22731@cherenkov.orbis-terrarum.net> <20030331120014.C25533@namesys.com> <20030331083758.GA23518@cherenkov.orbis-terrarum.net> <20030331125652.H25533@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Return-path: <reiserfs-list-return-13469-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030331125652.H25533@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Oleg Drokin <green@namesys.com>
Cc: "Robin H. Johnson" <robbat2@orbis-terrarum.net>, reiserfs-list@namesys.com

--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 31, 2003 at 12:56:52PM +0400, Oleg Drokin wrote:
> > Nope, no I/O messages in the logs at all.
> Hm...
> And you can do "dd if=3D/dev/hdb1 of=3D/tmp/somefile bs=3D4096 count=3D2
> skip=3D18" and it does not produce any errors?
Works fine, no errors. I copied the first 256mb of the drive to a
ramdisk a few times to be certain as well.

> What if you run that debugreiserfs command again and see if it
> complains about being unable to read 18th block?
No change in the output of debugreiserfs.

> > I had previously scanned the partition only, but I've scanned the entire
> > drive now, just to be entirely certain, and there are no bad blocks at
> > all. I've tested with both the standard readonly test, and the
> > non-destructive read/write.
> Hmm, but debugreiserfs cannot read it for some reason, this is weird.
Yes, very.

> Well, repacker, delayed block allocations, fine-grained locking is
> coming to my head right now, but all of this is going to be in
> reiser4, and Hans intends reiser4 to replace reiserfs eventually, so
> he feels that spending money/time on such things is just a waste of
> resources.
I'd agree with Hans on that. Duplication of effort is most often not
worthwhile.=20

> Probably you can look at the list of all of new features of reiser4
> and think of those as of features missed in reiserfs.  On the other
> hand if somebody actually needs these features in reiserfs right now,
> just vote with the money ;)
I don't need them myself. ReiserFS works out great on a large number of
places that I use it, including a 1.2TiB IDE RAID3 array. I'm eagerly
anticapting Reiser4. I am however waiting until it's offical declared more
stable before I try it out.

> > But I suspect that may be a much larger task (and I certianly don't want
> > my drives and RAID arrays ever getting that full in the first place).
> Repacker is not that trivialindeed, if you read this list for some
> time already, you might have noticed discussion in which Hans and
> Chris have agreed that while repacker is cool and can be implemented,
> nobody knows what layout for the data should be chosen.
Nope, I just subscribed to the list today, when I had this problem.

I've taken the system home for now, I so I can hack on it some more.
Mostly to find what was causing the reboots previously, but also so this
can get worked on.

However, I realize some of my assignments aren't waiting for me. Argh,
nasty evil signals and systems AM/FM mathematics. I'm a full-time
SysAdmin, and an almost full-time student as well.

--=20
Robin Hugh Johnson
E-Mail     : robbat2@orbis-terrarum.net
Home Page  : http://www.orbis-terrarum.net/?l=3Dpeople.robbat2
ICQ#       : 30269588 or 41961639
GnuPG FP   : 11AC BA4F 4778 E3F6 E4ED  F38E B27B 944E 3488 4E85

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.0 (GNU/Linux)
Comment: Robbat2 @ Orbis-Terrarum Networks

iD8DBQE+iAdlsnuUTjSIToURAoswAKCpXXvYao8NJmK9UzRsjQ1DuBPiQACfR2yf
/pKnZ8yiG8NMjHoDKu8uUnA=
=OYSe
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--
