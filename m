From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: 2.6.16-rc6-mm2: reiser4 BUG when unmounting fs
Date: Tue, 21 Mar 2006 21:38:00 +0100
Message-ID: <44206428.1080005@free.fr>
References: <20060318044056.350a2931.akpm@osdl.org> <442061C0.4020702@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28307-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <442061C0.4020702@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andrew Morton <akpm@osdl.org>
Cc: Kernel development list <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com


Le 21.03.2006 21:27, Laurent Riffard a =E9crit :
> Le 18.03.2006 13:40, Andrew Morton a =E9crit :
>=20
>>ftp://ftp.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.16-rc6/=
2.6.16-rc6-mm2/
>=20
> =20
> Hello,=20
>=20
> This BUG is 100% reproducible. Simply boot to runlevel 1 and then=20
> unmount a reiser4 fs:

Oops! Somebody already reported it: http://lkml.org/lkml/2006/3/21/88.

Sorry for the noise...
--=20
laurent
