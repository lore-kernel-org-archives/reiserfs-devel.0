From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: 2.6.9-mm1
Date: Sun, 24 Oct 2004 02:47:40 +0200 (MEST)
Message-ID: <Pine.LNX.4.53.0410240246510.31537@yvahk01.tjqt.qr>
References: <20041023165712.GR26192@nysv.org> <417B1574.4090406@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22148-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <417B1574.4090406@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: David Masover <ninja@slaphack.com>
Cc: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

>| Stupid question, why have small keys at all?
>|
>| Someone said once that he didn't want to use large keys because they add=
ed
>| no value to him and small keys wasted less space. If there are people li=
ke
>| this around, burying it is not cool, but if there aren't, maybe small ke=
ys
>| should be ripped out?
>|
>Some people don't care about speed but need space.  I'd leave them in on
>general principle, even if no one wants them now.

How much space would be gained after all on, say, a 200 GB partition?



Jan Engelhardt
--=20
Gesellschaft f=FCr Wissenschaftliche Datenverarbeitung
Am Fassberg, 37077 G=F6ttingen, www.gwdg.de
