From: Matthias Barremaecker <info@mh.be>
Subject: Re: Reiserfsck 1300Gig failed with following error
Date: Wed, 01 Jun 2005 12:57:31 +0200
Message-ID: <429D949B.5@mh.be>
References: <1117392967.29669.ezmlm@namesys.com> <429C7E46.9090507@teleformix.com> <429D5A16.5030701@mh.be> <200506011406.57415.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24256-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506011406.57415.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com, Dan Oglesby <doglesby@teleformix.com>, Valdis.Kletnieks@vt.edu

Hi,

> the key (which is in the tree already and supposed to be correct) is=20
> completely corrupted, no one key component is correct. data could be=20
> corrupted in the memory or on read/write -- bad cable, controller,=20
> dying harddrive, etc.=20
>=20
>=20
>>Anyone any suggestions ?
>=20
>=20
> running fsck with the list of bad blocks is useful when you have the=20
> known fixed number of bad blocks, you know that the number will not=20
> change soon, in other words other blocks are relable.=20
>=20
> first of all you even have not complete badblocks run, so you cannot=20
> be sure you know the full bad block list.=20
>=20
> and the second, if your hardware is dying you need to fix it before=20
> running fsck on it.

How do you sugest I swap a hd in a LVM raid with already data on it ?

thanx.

kind regardes,

Matthias.



--=20
   Matthias Barremaecker, MH.BE - Arta nv
   0495 30 31 72

   http://mh.be/

   SERVER HOUSING per 1HE =E2=82=AC 50 per maand
     20Gig traffic, 100Mbit netwerk
     Center te Antwerpen.

