From: Bodo Eggert <7eggert@elstempel.de>
Subject: Re: [PATCH] reiserfs: fix handling of device names with /'s in them
Date: Fri, 14 Jul 2006 18:10:49 +0200
Message-ID: <E1G1QFx-0001IO-K6@be1.lrz>
References: <6xQ4C-6NB-43@gated-at.bofh.it> <6xQea-6ZX-13@gated-at.bofh.it>
Reply-To: 7eggert@gmx.de
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29005-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Eric Dumazet <dada1@cosmosbay.com>, Jeff Mahoney <jeffm@suse.com>, ReiserFS List <reiserfs-list@namesys.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@osdl.org>

Eric Dumazet <dada1@cosmosbay.com> wrote:
> On Wednesday 12 July 2006 18:42, Jeff Mahoney wrote:

>>  On systems with block devices containing slashes (virtual dasd, cciss,
>>  etc), reiserfs will fail to initialize /proc/fs/reiserfs/<dev> due to
>>  it being interpreted as a subdirectory. The generic block device code
>>  changes the / to ! for use in the sysfs tree. This patch uses that
>>  convention.
>>
>>  Tested by making dm devices use dm/<number> rather than dm-<number>
>=20
> Your patch handles at most one slash. But the description mentions 'slash=
es'
> (ie several slashes)

Besides that, there is no reason to prevent the user from using many slashe=
s.
OTOH, I'd prefer propper quoting, but having each driver do this would be
insane.

> Maybe you need a loop
>=20
> while (s) {
[...]

s =3D bdev;
while (s =3D strchr(s, '/'))
        *s =3D '!';
--=20
Ich danke GMX daf=FCr, die Verwendung meiner Adressen mittels per SPF
verbreiteten L=FCgen zu sabotieren.

http://david.woodhou.se/why-not-spf.html
