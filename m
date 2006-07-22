From: Dirk <noisyb@gmx.net>
Subject: Re: serious Reiser4 fsck problem
Date: Sat, 22 Jul 2006 12:33:56 +0200
Message-ID: <44C1FF14.7040504@gmx.net>
References: <44C1F93A.9090109@gmx.net> <op.tc248azkd4os1z@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29133-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.tc248azkd4os1z@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-2?Q?=A3ukasz_Mierzwa?= <prymitive@pcserwis.net>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

=A3ukasz Mierzwa wrote:
> Dnia Sat, 22 Jul 2006 12:08:58 +0200, Dirk <noisyb@gmx.net> napisa=B3:
>=20
>> Hello,
>> will using
>>
>> fsck.reiser4 --build-fs
>>
>> result in data loss? I mean to fix the partition - NOT to lose the data
>> on it..
>>
>> The manual page is also not very specific about if data will be lost or
>> not when using this option...
>>
>> Using --fix resulted in a message that I should use --build-fs to remove
>> corruption...
>=20
>=20
> You will probably end up with some amount of files in lost&found dir,=20
> those will be the files that fsck can't recognize from what dir are
> coming  and what are named, depending on what corruption You have there
> can always  be some files that You won't get back. As always, backups
> are a must have  on any fs.
>=20
>=20

The hdd was full and a process was still trying to write and create new
files... So I guess those files might end up in lost+found...

Just want to make sure that --build-fs will not build a _new_ fs,
meaning formatting the fs by formatting it?!? That wasn't very clear
from what I'd read in the manual...

Dirk
