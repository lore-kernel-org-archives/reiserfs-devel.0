From: Diego Calleja =?ISO-8859-15?Q?Garc=EDa?= <diegocg@teleline.es>
Subject: Re: Filesystem Tests
Date: Thu, 7 Aug 2003 21:09:22 +0200
Message-ID: <20030807210922.24c77cc9.diegocg@teleline.es>
References: <3F306858.1040202@mrs.umn.edu>
	<20030805224152.528f2244.akpm@osdl.org>
	<3F310B6D.6010608@namesys.com>
	<20030806183410.49edfa89.diegocg@teleline.es>
	<3F324C4D.9000008@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15240-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F324C4D.9000008@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

El Thu, 07 Aug 2003 16:55:41 +0400 Hans Reiser <reiser@namesys.com> escribi=
=F3:

> Run fsck on a 1 terabyte array while a department waits for their server=
=20
> to come back up instead of having it back in 90 seconds and.....

To start, some people don't need data safety.

>=20
> disk speeds have increased linearly while their capacity has increased=20
> quadratically.

It's useful as you say to show how slow is ext3 compared with ext2, between
other things. Also, it looks that ext2 scales really well. Benchmarks are n=
ot
there to show how fast and nice your reiser4 is compared with others
(there's no doubt reiser4 is pretty nice BTW). People are developing other
filesystems, you know.


