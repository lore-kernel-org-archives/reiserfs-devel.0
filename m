From: Hans Reiser <reiser@namesys.com>
Subject: Re: [Fwd: Re: [ogfs-dev]Re: [Linux-ha-dev] Re: GFS with MD/LVM (Was:
 Using RAID1 SCSI disks with heartbeat)]
Date: Sun, 01 Dec 2002 22:38:37 +0300
Message-ID: <3DEA653D.7070204@namesys.com>
References: <3DE833C6.3000009@emageon.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12081-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DE833C6.3000009@emageon.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Brian Tinsley <btinsley@emageon.com>
Cc: reiserfs-list@namesys.com, Alan Robertson <alanr@unix.sh>

Brian Tinsley wrote:

> Hey guys,
>
> Can someone clarify this please?
>
>
> -------- Original Message --------
> Subject: Re: [ogfs-dev]Re: [Linux-ha-dev] Re: GFS with MD/LVM (Was:=20
> Using RAID1 SCSI disks with heartbeat)
> Date: Fri, 29 Nov 2002 19:01:14 -0700
> From: Alan Robertson <alanr@unix.sh>
> Reply-To: linux-ha-dev@lists.community.tummy.com
> Organization: IBM Linux Technology Center
> To: linux-ha-dev@lists.community.tummy.com
> CC: Greg Freemyer <Greg.Freemyer@TruStorage.com>, OpenGFS=20
> <opengfs-devel@lists.sourceforge.net>
> References:=20
> <20021129211032.BZIW24110.mtiwmhc13.worldnet.att.net@TAZ2><3DE7EF45.20903=
@unix.sh>=20
> <20021130013240.Y25901@vestdata.no>
>
>
>
>Ragnar Kj=F8rstad wrote:
>> On Fri, Nov 29, 2002 at 03:50:45PM -0700, Alan Robertson wrote:
>>=20
>>>I think EVMS has (or will have soon) r/w snapshots.
>>>
>>>
>>>>WIth r/w snapshots, the process can be: snapshot, clean, mount.  I thin=
k that=20
>>>>could be done=20
>>>>with no FS support. =20
>>>
>>>The FS support is still preferred because the integrity of the volume is=
=20
>>>still better (nothing held in cache).  Some filesystems can still proces=
s=20
>>>journals on readonly filesystems.  IIRC, ReiserFS does that.
>>=20
>>=20
>> I don't think so. Reiserfs had to be patched to work with lvm snapshots
>> as well.
>
>Originally it needed patches, but I was under the impression that those=20
>patches were now in the base code.
>
>
>--=20
>     Alan Robertson=20
>
>"Openness is the foundation and preservative of friendship....  Let me cla=
im=20
>from you at all times your undisguised opinions." - William Wilberforce
>
>
>_______________________________________________________
>Linux-HA-Dev: Linux-HA-Dev@lists.community.tummy.com
>http://lists.community.tummy.com/mailman/listinfo/linux-ha-dev
>Home Page: http://linux-ha.org/
> =20
>
>
>--=20
>Brian Tinsley
>Chief Systems Engineer
>Emageon
>
Yes, chris did the snapshot patching long ago in our main code.

