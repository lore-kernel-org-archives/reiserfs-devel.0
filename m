From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] corruption bugs in 2.6 v3
Date: Wed, 03 Mar 2004 20:06:00 -0500
Message-ID: <1078362360.3933.182.camel@watt.suse.com>
References: <1078346080.3933.160.camel@watt.suse.com>
	 <200403040016.32865.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17064-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403040016.32865.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: reiserfs-list@namesys.com, green@linuxhacker.ru

On Wed, 2004-03-03 at 18:16, Dieter N=FCtzel wrote:
> Am Mittwoch, 3. M=E4rz 2004 21:34 schrieb Chris Mason:
> > Hello everyone,
> >
> > These two patches fix corruption problems I've been hitting on 2.6.
> > Both bugs are present in the vanilla and suse kernels.
>=20
> Both do NOT fix the "lilo" problem.
> But mkinitrd works.
>=20

No, neither patch fixes the lilo problem with the data=3Dordered patches.=20
These two bugs were much more important to work on.  lilo fix on its
way.

-chris



