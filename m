From: Laurent Riffard <laurent.riffard@free.fr>
Subject: Re: Slowdown is gone & apt-get works with updated reiser4. So nevermind...
Date: Sun, 13 Nov 2005 13:18:25 +0100
Message-ID: <43772F11.7090907@free.fr>
References: <200511111359.39715.jgilmore@glycou.com> <b14e81f00511111907l3c159ff7rd2e0de5f9e6a0aa7@mail.gmail.com> <43758E00.4000601@namesys.com> <200511120906.39109.jgilmore@glycou.com> <43765E8D.7030104@namesys.com> <43768EEA.90307@ursynow.2a.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26915-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43768EEA.90307@ursynow.2a.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Cc: John Gilmore <jgilmore@glycou.com>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

Le 13.11.2005 01:55, Artur Mak=F3wka a =E9crit :
> Hans Reiser wrote:
>=20
>> John Gilmore wrote:
>>
[snip]
>>> =20
>>> Oh, BTW. "The slowdown" as I called it is still there. I guess I
>>> spoke to soon. The specific symptom is that the effected process
>>> locks for a time, usually just a second or two, but sometimes a
>>> minute or two and and at least once for many many minutes. I think
>>> that the crash (soft lockup) that I reported earlier is related as
>>> well. And it sounds like the comment that rvalles had about lockups
>>> with mmaped files, except that it doesn't lock up permanently. Just
>>> for a second or three usually.
>>>
>>> =20
>>>
>> zam, please comment.
>>
>=20
> one more thing im pretty sure of - the 2.6.13mm3 without any reiser4
> additional patches (just clean 2.6.13mm3 as it has reiser4 already
> built) is working fine.
>=20
> i mean, im not sure if this bug still exists here, but im 100% sure i
> can write vim files easy without any downtime, so this is big difference.
>=20
> so for everyone with this bug - try clean 2.6.13mm3 from kernel.org. It
> worked for me. i will wait with this kernel for a patch to stable line.
>=20
> Also - i will test it a little more tomorrow to be sure that this
> version is bug free.
>=20

Hello,

It seems that fsync could be really slow when there is a lot of
activity on the FS.

I've done the following test :
- on a reiser4 FS, unpack a fresh kernel tarball and start a compilation
- open a new terminal, wait 1 minute and start editing a file on the
same FS with vi.
- hit ":w" and wait...

$ strace -T vi foo 2>strace_vi.log
$ grep fsync strace_vi.log
fsync(3)                                =3D 0 <30.923808>
$

My computer is a desktop with an Athlon XP 1600 and 512 Mb RAM.
Write cache is disabled on the disk (hdparm -W0 /dev/hda).

~~
laurent



