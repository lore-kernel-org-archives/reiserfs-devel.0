From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Where to put the journal
Date: Mon, 02 Aug 2004 13:27:19 +0400
Message-ID: <410E08F7.9020303@namesys.com>
References: <410CCFCA.1030309@baldauf.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19914-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <410CCFCA.1030309@baldauf.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Xu=E2n_Baldauf?= <xuan--2004.08.01--reiserfs-list--namesys.com@baldauf.org>
Cc: Reiserfs List <reiserfs-list@namesys.com>

Hello

Xu=E2n Baldauf wrote:
> Hello,
>=20
> I want to setup a Linux software RAID 5 over disks of different speed=20
> with reiserfs on top. I know that the journal has to be accessed=20
> frequently for comparably small accesses. That's why I'm considering to=
=20
> "offload" the journal onto an extra partition on a faster disk of the=20
> RAID set.
>=20
> Thus, the journal would not be protected by the RAID, but this is not s=
o=20
> important for me.
>=20
> Is this kind of reasoning sane? Would there be any speedup by offloadin=
g=20
> the journal?
>=20

Person who did some tests on non standard journal is on vacation. He is e=
xpected to come back today. Maybe he remembers benchmark results,

