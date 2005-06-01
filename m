From: Matthias Barremaecker <info@mh.be>
Subject: Re: Reiserfsck 1300Gig failed with following error
Date: Wed, 01 Jun 2005 15:32:44 +0200
Message-ID: <429DB8FC.40102@mh.be>
References: <1117392967.29669.ezmlm@namesys.com> <200506011513.00397.vitaly@namesys.com> <429DA9EB.9010402@mh.be> <200506011652.29577.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24263-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506011652.29577.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com, Dan Oglesby <doglesby@teleformix.com>, Valdis.Kletnieks@vt.edu

>>Situation :
>>
>>LVM with reiserfs
>>
>>2 onboard IDE controllers =3D> 8 disks
>>
>>I can't connect another disk fysicly
>=20
>=20
> perform dd_rescue'ing on another computer.
>=20
> or alternatively you can pull out a working disk out, put a=20
> new one, dd_rescue the broken one to a new one, put the new=20
> one instead of the broken one and put the pulled out disk back=20
> to its own place.

Omg omg! How I didn't think of that :) thanx.

>=20
>=20
>>system boots from a scsi disk, that has nothing to do with the LVM=20
>>except booting and mounting it .
>>
>>What should I do before I pay you to work out a solution.
>>
>>thanx.
>>
>>kind regardes,
>>
>>
>>Matthias.
>>
>>
>>
>=20
>=20

--=20
   Matthias Barremaecker, MH.BE - Arta nv
   0495 30 31 72

   http://mh.be/

   SERVER HOUSING per 1HE =E2=82=AC 50 per maand
     20Gig traffic, 100Mbit netwerk
     Center te Antwerpen.

