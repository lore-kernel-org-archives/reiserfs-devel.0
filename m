From: Chris Mason <mason@suse.com>
Subject: Re: SuSE 9.0 reiserfsprogs-3.6.9. When will we see an update?
Date: Mon, 01 Dec 2003 13:51:49 -0500
Message-ID: <1070304708.12810.111.camel@tiny.suse.com>
References: <200312011931.01285.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-16198-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200312011931.01285.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: ReiserFS-List <reiserfs-list@namesys.com>

On Mon, 2003-12-01 at 13:31, Dieter N=FCtzel wrote:
> Hello Chris,
>=20
> some time has passed...;-)
>=20
> I had a bad system corruption due to a broken system disk. My IBM U160 di=
sk=20
> (DDYS-T18350; 18,2 GB; 10k RPM) was broken for the third time...
> Now I replaced it with two (RAID1) Fujitsu MAS3184NP (U320; 18,4 GB; 15k =
RPM;=20
> 65-78 MB/s (inner to outer)) and SUSE 9.0 on LVM.
>=20
> After a power loss I got some files in "lost+found" from "/opt" (last=20
> accessed) and reiserfsck was relative slow (reiserfsprogs-3.6.9).
> Reiserfsprogs-3.6.11 and -pre12 is way faster (on my old SuSE7.3 based sy=
stem)=20
> and there where some fixes.
>=20
> I tried to compile them on SuSE 9.0 as always but I failed 'cause SuSE pa=
tched=20
> some things.
>=20
> Can you give some advice?
>=20
> Thanks and greetings.

We're at 3.6.11 internally, it is part of SLES8 SP3 (which was released
after 9.0).  I'll toss some rpms into my directory.

-chris
=20



