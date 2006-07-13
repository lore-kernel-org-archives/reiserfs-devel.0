From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: 2.6.18-rc1-mm1: reiser4 panicked cowardly nikita-1936
Date: Fri, 14 Jul 2006 00:01:07 +0200
Message-ID: <44B6C2A3.3000008@free.fr>
References: <44B5529A.7050601@free.fr> <1152800175.6353.141.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-28995-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1152800175.6353.141.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com


Le 13.07.2006 16:16, Vladimir V. Saveliev a =E9crit :
> Hello
>=20
> On Wed, 2006-07-12 at 21:50 +0200, Laurent Riffard wrote:
>> Hello reiser4 maintainers,
>>
>> I've been hit a few times by a reiser4 panic, namely nikita-1936.=20
>>
>> The box was running 2.6.18-rc1-mm1 + hot-fixes +=20
>> reiser4-generic_file_read-fix.patch (from Edward Shishkin).=20
>> .config is attached.
>>
>> What should I do ?
>> - fsck ?
>=20
> You should fsck from time to time. I do not think that this panic
> indicates any corruptions in a filesystem, though.

Yes, you're right. I fsck'd this FS, but there were no corruptions.
=20
>> - send a debugfs.reiser4 -P output before fsck ?
>=20
> no
>=20
>> - comment out this assertion ?
>=20
> no
>=20
>> - wait for a fix ?
>>
>=20
> can you reproduce the problem? How to do that, if yes?
> can you please try to find whether previous kernel you used can also be
> crashed that way? What is that kernel?

This FS is my working area for compiling kernels. Reiser4 panicked twice=20
yesterday during a compilation. But today, all proceeded correctly.

I think - not sure - 2.6.18-rc1-mm1 is the first kernel with those problems=
.=20
I was hit by many other (unrelated to reiser 4) problems in 2.6.18-mm* and =

maybe one of those panic happened, but I can't remember. The problem is, if=
=20
I start X and if such a panic happens, the box is frozen and I can't see an=
y=20
message. I have to work with a character terminal (not a graphical one) to =

see the panic's output message.

--=20
laurent
