From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [ANNOUNCE] reiser4 snaphots
Date: Wed, 6 Nov 2002 13:10:40 +0300
Message-ID: <15816.60064.196324.339910@laputa.namesys.com>
References: <3DC7D812.6070401@attbi.com>
	<3DC7FC9A.9010509@swissonline.ch>
	<15815.64953.87201.907213@laputa.namesys.com>
	<200211051828.20553.Dieter.Nuetzel@hamburg.de>
	<slrnasg35d.843.andreashappe@marvin.homelinux.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11925-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <slrnasg35d.843.andreashappe@marvin.homelinux.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andreas Happe <andreashappe@gmx.net>
Cc: reiserfs-list@namesys.com

Andreas Happe writes:
 > Dieter N=FCtzel <Dieter.Nuetzel@hamburg.de> wrote:
 > >> Rowan Kl=F6ti writes:
 > >> Hard to say. Depends on Linus mostly. I am personally not very
 > >> optimistic about this.
 > >=20
 > > I'm not that hopeless.
 > > As I read Linus post right, he is very interessted in all the new=20
 > > functionality (atomicity).
 > >=20
 > > The more "numbers" we present (benchmarks) the better.
 > > (numbers count :-)
 >=20
 > well, i've got a little problem with reiser4:
 >=20
 > trying to copy my kerneltree from a reiserfs to a reiser4 partition
 > generated this lovely piece of output:

Recursive panic. What messages were printed just before "bad: scheduling
while atomic!"?

 >=20
 > | Nov  5 19:11:32 marvin kernel: bad: scheduling while atomic!
 > | Nov  5 19:11:32 marvin kernel: Call Trace:
 > | Nov  5 19:11:32 marvin kernel: [<c01159e1>] schedule+0x3d/0x2c8
 > | Nov  5 19:11:32 marvin kernel: [<c015781d>] __wait_on_inode+0x71/0x90
 > | Nov  5 19:11:32 marvin kernel: [<c0115cb0>] default_wake_function+0x0/=
0x34

[...]

 > | Nov  5 19:11:32 marvin kernel: [<c0106ec7>] syscall_call+0x7/0xb
 > | Nov  5 19:11:32 marvin kernel:=20
 >=20
 > of course, the whole mounted partition is not accessable because cp and
 > "ktxnmgrd:wait" hangs.
 >=20
 > andreas,
 > btw: sorry for the long post
 >=20
 >=20

Nikita.
