From: David Masover <ninja@slaphack.com>
Subject: Re: Filesystem corruption
Date: Wed, 30 May 2007 15:03:14 -0500
Message-ID: <200705301503.15105.ninja@slaphack.com>
References: <160382.11806.qm@web31708.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart2058863.XLPaF6e1ZN";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30674-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <160382.11806.qm@web31708.mail.mud.yahoo.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: devsk <funtoos@yahoo.com>
Cc: Toby Thain <toby@smartgames.ca>, ReiserFS List <reiserfs-list@namesys.com>

--nextPart2058863.XLPaF6e1ZN
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Wednesday 30 May 2007 12:22:17 devsk wrote:

> I have used R4 for a year now and I have had to reset my PC,
> troubleshooting problems with vmware/mythtv/cisco vpn client/nvidia, so
> many times that its not even funny! And R4 didn't give me any problems ev=
en
> once. It boots right up, without any files lost and consistent FS as a
> subsequent livecd boot and fsck proved it everytime.

That happened to me for maybe a year or so, I'm not sure. Then, slowly, I=20
started to get problems. The machine crashing due to some nvidia bug -- or=
=20
even a reiser-specific oops or something -- then I'd have to fsck it, which=
=20
would take an hour or more, then I'd boot, and apparently no problems.

Only, recently, these fsck-a-thons started happening more and more often, a=
nd=20
I started to lose random files. They'd just be silently truncated to 0 byte=
s.=20
And not files I was writing a lot -- I'm talking about things=20
like /bin/mount.

Now, maybe it's an amd64-specific bug. Or (somehow) a dmraid-specific bug, =
or=20
a dont_load_bitmap bug. (Who can blame me; without dont_load_bitmap, it tak=
es=20
at least 30 seconds, maybe a minute to mount.) Could even be, somehow, a=20
Gentoo-specific bug. Could be a 350-gig-partition bug, or even a bug of the=
=20
it-hates-me variety. (My server ran Reiser4 for awhile longer, with no=20
problems, but I wasn't about to take chances there.)

But, I switched a friend over to Ubuntu, and he had the same kind of proble=
ms.=20
In fact, he had them first (I thought it was his computer, for awhile).

=46inally, we switched to stock Ubuntu kernels and XFS, me on dmraid, him o=
n=20
normal linux raid5 (md), and we now have no problems. It's even faster -- t=
he=20
biggest gain for Reiser4 was /usr/portage, which doesn't exist on Ubuntu.

> If I did that to ext=20
> or xfs, I would have lost big time.

Well, I'm on XFS on my desktop now, and ext3 on my server. No problems at a=
ll=20
so far. Also much faster, because my desktop now has a repacker (xfs_fsr).

> I hope people don't leave this good piece of code to rot!!

Me too, but you know, I can no longer afford to spend a few hours running f=
sck=20
for no apparent reason. I no longer have a machine that can do anything but=
=20
just work.

The killer feature of Reiser4, as implemented, is small file performance th=
at=20
makes ReiserFSv3 weep, and v3 makes XFS weep. All the other stuff we were=20
promised is either planned for a later release (repacker, pseudofiles,=20
transaction API) or barely working (cryptocompress).

And on just about any setup I work on today, small file performance is a sm=
all=20
enough priority that even the slightest hint of instability is a=20
deal-breaker. Enough people feel the same way that ext3 is still widely use=
d.=20
And if it's ever really crucial, there's reiserfs3.

So, you can blame it on my hardware, or on not getting kernel inclusion, or=
=20
anything you want, but the only place I still use Reiser4 is on the=20
gameserver at our LAN party, and we're thinking of moving that to something=
=20
like ext3 or xfs, just so we don't need custom kernels. And after all, that=
's=20
a gameserver, it's not like the filesystem is the bottleneck anyway.

--nextPart2058863.XLPaF6e1ZN
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iQIVAwUARl3YgngHNmZLgCUhAQKYgg/+Jejl/QfAaA1nqGppR8IJAIgLz/orK9sV
TZrlLuXuFCq8AxpT05ffdOaL6sfYqd+RgCEXoosI3m6MTfwt2mJKG8WSh3ZWddYi
H3muVY826yPQ1CUH856jmaiDG8osr20BfCjlCbMzXGyhZYobSKUTjJfVTobqzVtB
Lj6HDl9ofSUAACwWmVsmE3eQkap6/PywlZOUFKWhIX7wyDmsEvScmblXx4VC6G/Z
eANdyYiueZS+9586WZudt5LsT2NC5wqCZzE1pgyQWy816J+ar8fhfuuGyr+KWrxG
JbZVuLpNMBkyTPk4Zcr7j3xdRCMDrF7b5odoHm+AjHQOJM1g/t+NQbtD1A/GvxBD
zy8Y3A7/jTtwj4XEwkTgMTR0boc7XgIzo4WH0m7ghiHBxcFEqVGzculnXIykj5LC
0pSwlrvu/dG7OG/PyhYoX1edAIswI4z/57vP+0Pud/kKLOG+3OLOrBcSynA4pt2R
+bm7JxDl+EB2JLndi115ByO+Oc6KWH/uy+y+cbh+gSoNiQhjJ+VZ4wCstb3nmgNb
lTZFNE78WcPGhiS/Nk8iB4opx6GEfdjTQBA0WTNbeT0XdsadtvwCnUkQ9XuHxLiS
e3Y8xjlHv1SNJk0sptP3E1jFe6PDZxsi74nSuZBULKvHGScE+O38p2ThCjDXTpKt
JG9fxkWtZ0U=
=jTcs
-----END PGP SIGNATURE-----

--nextPart2058863.XLPaF6e1ZN--
