From: <doiggl@velocitynet.com.au>
Subject: Re: how can I list out any replayed journal entries on startup in reiser4 filesystem
Date: Sun, 13 Feb 2011 01:06:21 +1100
Message-ID: <3f7c92853e755d5e74db17f2885f41dd@mail.velocitynet.com.au>
References: <a97e8e36d46dfcf2ec71076c895a5d40@mail.velocitynet.com.au> <4D55E2D2.2070306@gmail.com> <a2d9ce3b9dd8baedbc543628d9c72573@mail.velocitynet.com.au> <op.vqr6rm2phogzsi@g17b>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <op.vqr6rm2phogzsi@g17b>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?UTF-8?Q?Jon=C3=A1=C5=A1_Vidra?= <vidra.jonas@seznam.cz>
Cc: ReiserFS mailing list <reiserfs-devel@vger.kernel.org>

On Sat, 12 Feb 2011 09:20:06 +0100, Jon=C3=A1=C5=A1 Vidra <vidra.jonas@=
seznam.cz>
wrote:
> Dne Sat, 12 Feb 2011 04:20:13 +0100 <doiggl@velocitynet.com.au>
napsal(a):
>=20
>> Hello,
>> I ask because the activation time on /dev/sdb -> /media/disk is 130
>> seconds or so with no progress on screen , so for me its helpful to =
see
a
>> progress indicator and a pass/fail at the end of journal replay
process.
>> Glenn
>=20
> Umount your partitions properly and use fsck if you don't. But I don'=
t
> think this is caused by a journal replay. How big is that disk? You m=
ay
> consider using the "dont_load_bitmap" option =E2=80=94 just put it in=
to your
> fstab or use the "-o" switch when you mount the FS.

> How big is that disk?
1.7Terabyte | 1.1T used | 600 GB free |371,987 files,  all on one
partition

Is this the correct format for dont_load_bitmap in /etc/fstab ?

/dev/sdb /media/disk reiser4 defaults,dont_load_bitmap 0 0




--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
