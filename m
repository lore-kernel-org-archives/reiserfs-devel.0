From: none <turtle.power@wanadoo.es>
Subject: Re: trouble with reiserfs on ppc vs-3050:
 wait_buffer_until_released ...
Date: Sat, 26 Apr 2003 17:27:57 +0200
Message-ID: <20030426172757.37f44815.turtle.power@wanadoo.es>
References: <1051258287.5564.1.camel@fortknox>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13829-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1051258287.5564.1.camel@fortknox>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi
Digging in logs I've found that this happened to me about 10 days ago,
badblocks didn't found any disk defect.

Apr 16 15:29:37 poma kernel: vs-3050: wait_buffer_until_released: nobody
releases buffer (dev 03:04, size 4096, blocknr 1441792, count 3, list 0,
state 0x10019, page c0674838, (UPTODATE, CLEAN, UNLOCKED)). Still
waiting (60000000)  JDIRTY !JWAIT Apr 16 15:29:44 poma modprobe:
modprobe: Can't locate module char-major-10-134 Apr 16 15:29:53 poma
kernel: vs-3050: wait_buffer_until_released: nobody releases buffer (dev
03:04, size 4096, blocknr 1441792, count 3, list 0, state 0x10019, page
c0674838, (UPTODATE, CLEAN, UNLOCKED)). Still waiting (90000000)  JDIRTY
!JWAIT Apr 16 15:30:10 poma kernel: vs-3050: wait_buffer_until_released:
nobody releases buffer (dev 03:04, size 4096, blocknr 1441792, count 3,
list 0, state 0x10019, page c0674838, (UPTODATE, CLEAN, UNLOCKED)).
Still waiting (120000000)  JDIRTY !JWAIT

My machine is a ppc G3 (mac) with a 2.4.20 benh kernel running on a /
reiserfs that holds the last 6gigs of the drive, and the corrupted one
is a spare partition using the remaining first 6 gigs of the drive.

In my case the problem raised when downloading a big file from a local
machine lets say about 5-10Mb/s with wget, which then get the 100% of my
cpu and becomes "unkillable" but is in R state not D.

I can provide additional information on Monday if someone needs....


On 25 Apr 2003 10:11:53 +0200
Soeren Sonnenburg <kernel@nn7.de> wrote:

> Hi...
>=20
> I suddenly have a file which when I access it using gvim gives
>=20
> vs-3050: wait_buffer_until_released: nobody releases buffer (dev
> 03:07, size 4096, blocknr 2031616, count 3, list 0, state 0x10019,
> page c0add66540, (UPTODATE, CLEAN, UNLOCKED)). Still waiting
> (570000000) JDIRTY !WAIT
>=20
> and makes the whole machine hang...
>=20
>=20
> Ideas what I could do about it ?
>=20
> Soeren.
>=20
>=20


--=20
La resistencia es f=FAtil todos ser=E9is asimilados
