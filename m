From: Chris Mason <mason@suse.com>
Subject: Re: 2.5.46: SCSI and/or ReiserFS v3.6 broken? Kernel panic
Date: 05 Nov 2002 18:12:17 -0500
Message-ID: <1036537937.24354.337.camel@tiny>
References: <200211060006.10425.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11922-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200211060006.10425.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Linux Kernel List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Tue, 2002-11-05 at 18:06, Dieter N=FCtzel wrote:
> VFS: Cannot open root device "803" or 08:03
> Please append a correct "root=3D" boot option
> Kernel panic: VFS: unable to mount root fs on 08:03
>=20
> With and without HugeTLB file system support.
> With and without ACPI, APIC.
>=20
> Worked all the time before.

Is aic7xxx still in your config?  I'm using 2.5.45 here without
problems.

-chris


