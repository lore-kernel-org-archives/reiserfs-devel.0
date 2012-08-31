From: <doiggl@velocitynet.com.au>
Subject: Re: reiser4 patch and formatting partitions
Date: Fri, 31 Aug 2012 14:05:18 +1000
Message-ID: <8a02fe7a19b065bf0a2b411df2db1e20@mail.velocitynet.com.au>
References: <ffc5fb825e3c08c0f37e9696d3025d65@mail.velocitynet.com.au> <5040588D.10501@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <5040588D.10501@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On Fri, 31 Aug 2012 08:24:13 +0200, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> On 08/31/2012 05:19 AM, doiggl@velocitynet.com.au wrote:
>> Hello,
>> Is the reiser4 patch with the [kernel 3.1 stuff by Marcin Baczy=C5=84=
ski]
>> available somewhere to try out.
>> - Can the patch be accessed from [1] when it is released.
>=20
>=20
> This is not yet reviewed/tested.
>=20
>=20
>> - Should I use the format option -o "formatting=3Dextents" when crea=
ting
a
>> partition e.g
>> mkfs.reiser4 -o create=3Dccreg40,formatting=3Dextents /dev/sdaX
>=20
>=20
> No.
> Cryptcompress file plugin doesn't use extents. It uses
> tail packing technique, which uses the buggy balance primitive.
>=20
>=20
>>
>> Information from this thread [2]
>>
>> Thanks
>> Glenn
>>
>> [1]
http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-2.6/
>> [2] http://www.spinics.net/lists/reiserfs-devel/msg03216.html
>>



>> - Should I use the format option -o "formatting=3Dextents" when crea=
ting
a
>> partition e.g
>> mkfs.reiser4 -o create=3Dccreg40,formatting=3Dextents /dev/sdaX
>=20
> No.
> Cryptcompress file plugin doesn't use extents. It uses
> tail packing technique, which uses the buggy balance primitive.

Hello,

Question:
Have you got an example on how to format a reiser4 partition please, wh=
at
would be safe to use ?
=20
mkfs.reiser4 -o XXXXX /dev/sda
where XXXXX =3D ??? options

Thanks Glenn

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
