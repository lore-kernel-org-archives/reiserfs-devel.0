From: "Masthan, Dudekula (STSD)" <dudekula.masthan@hp.com>
Subject: RE: Maximum number of subdirectories
Date: Wed, 17 May 2006 14:42:30 +0530
Message-ID: <4EEB5A4713E61F49A759A504BECCBC0A0232AD4E@bgeexc01.asiapacific.cpqcorp.net>
References: <5502B4E900B1A04AAA35CB57979B8C9A2472A8@spi-mail2003.spitech.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28636-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-class: urn:content-classes:message
In-Reply-To: <5502B4E900B1A04AAA35CB57979B8C9A2472A8@spi-mail2003.spitech.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Sinang, Danny" <D.Sinang@spi-bpo.com>, "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com


Hi All,

It is pertaining to Reiser4=20

On Reiser4 the limit is 2^32 where as on ReiserFS (v3.x) the limit is
64,536 ( not sure)=20


Regards,
Masthan=20

-----Original Message-----
From: Sinang, Danny [mailto:D.Sinang@spi-bpo.com]=20
Sent: Wednesday, May 17, 2006 2:37 PM
To: Vladimir V. Saveliev
Cc: reiserfs-list@namesys.com
Subject: RE: Maximum number of subdirectories

Hi Vladimir,

By current limit, are you pertaining to ReiserFS (v3.x) or Reiser4 ?

Regards,
Danny=20

-----Original Message-----
From: Vladimir V. Saveliev [mailto:vs@namesys.com]
Sent: Wednesday, May 17, 2006 4:46 PM
To: Sinang, Danny
Cc: reiserfs-list@namesys.com
Subject: Re: Maximum number of subdirectories

Hello

On Tue, 2006-05-16 at 23:25 +0800, Sinang, Danny wrote:
> Hello,
> =20
> Am a newbie to ReisferFS / Reiser4.=20
> =20
> I've been searching the archives and Google for a definite answer as=20
> to what the maximum number of subdirectories under a directory is. A=20
> Dec, 2003 article ( http://everything2.com/index.pl?node_id=3D510028 ) =

> says it's 64,536. Is this still true ?
> =20
no, that was for old format of reiserfs.

> If not, then what is the current limit for both ReiserFS and Reiser4 ?

current limit for both is 2^32.

> =20
> Regards,
> Danny
> =20
> =20

