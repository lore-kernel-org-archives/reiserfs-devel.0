From: =?ISO-8859-15?Q?Konstantin_M=FCnning?= <konstantin@muenning.com>
Subject: Re: Reiser3 bug in 2.6.11.11
Date: Thu, 17 Nov 2005 11:19:58 +0100
Message-ID: <437C594E.3030000@muenning.com>
References: <43791A03.9030305@muenning.com> <437BC29B.3060704@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26974-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <437BC29B.3060704@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: "evilninja@gmx.net" <evilninja@gmx.net>

Hi!

evilninja@gmx.net wrote:
> Konstantin M=FCnning schrieb:
>=20
>> init started and first system startup messages appeared. But then a
>> bunch of oopses appeared fast so I was not able to find which part of
>> the kernel was causing the first error and then the keyboard stops
>> responding so I couldn't scrollback. At that point only powering down
>> was possible. I can't tell if it happens while fs was RO or when/after
>> it was remounted RW. And as there was no network or disk access at that
>> point recovering some information was not possible.
>=20
>=20
> can you reproduce the oopses and redirect the errors/oops message to a
> serial console or netconsole? does the error go away with a current
> kernel? perhaps some reiserfs guru can decode them....

Sorry I had no time to play as it is an "in-production" laptop and had
to be functional fast so I currently have no way to reproduce the fault.
 Redirecting output would require another kernel and the device has no
serial or network port :-(.

Maybe extracting metadata (debugreiserfs -p) would have been good for
debugging but at that point I had nowhere to store it. If this happens a
second time I will find a way to save it.

As there were only a few fs errors reported by fsck probably looking
over range/overflow checks in the code regarding used space/block size
might give a hint...

Have a nice day,
--=20
Konstantin M=FCnning
