From: =?utf-8?B?Sm9uw6HFoSBWaWRyYQ==?= <vidra.jonas@seznam.cz>
Subject: Re: how can I list out any replayed journal entries on startup in
 reiser4 filesystem
Date: Sat, 12 Feb 2011 09:20:06 +0100
Message-ID: <op.vqr6rm2phogzsi@g17b>
References: <a97e8e36d46dfcf2ec71076c895a5d40@mail.velocitynet.com.au>
 <4D55E2D2.2070306@gmail.com>
 <a2d9ce3b9dd8baedbc543628d9c72573@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <a2d9ce3b9dd8baedbc543628d9c72573@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed	delsp=yes"
To: doiggl@velocitynet.com.au
Cc: ReiserFS mailing list <reiserfs-devel@vger.kernel.org>

Dne Sat, 12 Feb 2011 04:20:13 +0100 <doiggl@velocitynet.com.au> napsal(=
a):

> Hello,
> I ask because the activation time on /dev/sdb -> /media/disk is 130
> seconds or so with no progress on screen , so for me its helpful to s=
ee a
> progress indicator and a pass/fail at the end of journal replay proce=
ss.
> Glenn

Umount your partitions properly and use fsck if you don't. But I don't
think this is caused by a journal replay. How big is that disk? You may
consider using the "dont_load_bitmap" option =E2=80=94 just put it into=
 your
fstab or use the "-o" switch when you mount the FS.

--=20
Jon=C3=A1=C5=A1 Vidra, vidra.jonas@seznam.cz
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
