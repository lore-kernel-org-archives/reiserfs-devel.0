From: "evilninja@gmx.net" <evilninja@gmx.net>
Subject: Re: Reiser3 bug in 2.6.11.11
Date: Thu, 17 Nov 2005 00:36:59 +0100
Message-ID: <437BC29B.3060704@gmx.net>
References: <43791A03.9030305@muenning.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26994-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43791A03.9030305@muenning.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-15?Q?Konstantin_M=FCnning?= <konstantin@muenning.com>
Cc: reiserfs-list@namesys.com

Konstantin M=FCnning schrieb:
> init started and first system startup messages appeared. But then a
> bunch of oopses appeared fast so I was not able to find which part of
> the kernel was causing the first error and then the keyboard stops
> responding so I couldn't scrollback. At that point only powering down
> was possible. I can't tell if it happens while fs was RO or when/after
> it was remounted RW. And as there was no network or disk access at that
> point recovering some information was not possible.

can you reproduce the oopses and redirect the errors/oops message to a=20
serial console or netconsole? does the error go away with a current=20
kernel? perhaps some reiserfs guru can decode them....

--=20
BOFH excuse #293:

You must've hit the wrong any key.
