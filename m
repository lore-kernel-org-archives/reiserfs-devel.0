From: Sam Vilain <sam@vilain.net>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Thu, 13 Feb 2003 05:22:35 +1300
Sender: Sam Vilain <sv@horo.vilain.net>
Message-ID: <200302130522.35829.sam@vilain.net>
References: <93F527C91A6ED411AFE10050040665D0049C06D5@corpusmx1.us.dg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12723-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <93F527C91A6ED411AFE10050040665D0049C06D5@corpusmx1.us.dg.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Wed, 12 Feb 2003 08:43, berthiaume_wayne@emc.com wrote:
> Dirk, I'd be interested in hearing from you your performance
> experience with ext3 when it reaches 96% full.

No problem, because you get ENOSPC at 95% or 90%.

Hmm, another feature SysAdmins actually find useful, missing in reiserfs.=
 =20
Along with quotas (this feature is a lazy case of a quota, really).

On Wed, 12 Feb 2003 18:12, Ross Vandegrift wrote:
> You have to start your software on some kind of foundation.  Working
> hardware sounds like a great place to me.

Hmm, you've never heard of redundancy or fault tolerance then.

What part fails the most in running systems ?  Disk platters.

CPUs might overheat and RAM might suddenly one day get a sticky bit, but =
as=20
you point out there ain't much you can do about it.  Except buy a Tandem,=
=20
or use ECC memory.

But with disks, you can.  Mirroring aside, modern hard disks use S.M.A.R.=
T.=20
technology which claims to be able to spot failures before they happen. =20
Many BIOSes will let you turn this feature on and off.  Of course I've=20
never actually seen it in action :-).

Not only that, but re-attempting a failed read might just work.  In that=20
case, you need to freshen the data (hopefully the disk will re-map the=20
block once it sees a write), and if that fails, re-map the block.  I don'=
t=20
know if any of the other filesystems do that (I seriously doubt it), but=20
it's what Norton 4.5 on DOS used to do to `repair' faulty disks :-).

But doing disk repair is entirely irrelevant for a filesystem.  What's=20
important is that you don't get an Oops, a kernel Segfault or worse rando=
m=20
data corruption or file structure mangling, that the calling process gets=
=20
EIO instead.

Stopping random corruption from violating your assumptions is extremely=20
difficult; a software engineer's nightmare :-).  However, modern disks ar=
e=20
pretty good at keeping their own CRCs, so you should expect that you can=20
always get an error code back from the OS if the data didn't come back th=
e=20
same state you wrote it.

You (the reiserfs team) need to wire up reiserfs on a custom loopback=20
device, and selectively flick blocks to faulty and see what happens.  It'=
s=20
just a part of stress testing.

And there is no excuse - reiserfsck should do the right thing when it=20
encounters a filesystem with bad blocks and recover what is possible,=20
marking the bad blocks as bad.  It needs dd_rescue built into its=20
operation :-).

It must suck having a free project get only slight funding.  All of a=20
sudden a whole load of geeks get very angry and demanding.  I wish I coul=
d=20
help, but hey it's more fun to troll.^H^H^H I've got better things to do.
--=20
Sam Vilain, sam@vilain.net

The reason we start a war is to fight a war, win a war, thereby
causing no more war!
 - George W. Bush during the first Presidential debate
