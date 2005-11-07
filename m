From: =?UTF-8?B?RnJpZWRlciBCw7xyemVsZQ==?= <linux-stuff@arcor.de>
Subject: 2.6.14-rc5-mm1/2.6.14-mm1 reiser4-update-for-2.6.14-rc5-mm1-1 still
 get lockups
Date: Mon, 07 Nov 2005 14:38:01 +0100
Message-ID: <436F58B9.6040105@arcor.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26795-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: reiserfs-list@namesys.com

Hi,

i=C2=B4ve tried the new update-patch reiser4-update-for-2.6.14-rc5-mm1-1 wi=
th
2.6.14-rc5-mm1/2.6.14-mm but it locks if I run a script that try to=20
untar/cp/rm
stuff on that partition:


this messages I got:

<4>reiser4[ktxnmgrd:hda1:r(4321)]: disable_write_barrier=20
(fs/reiser4/wander.c:233)[zam-1055]:
WARNING: disabling write barrier

or this

<4>reiser4[tar(21136)]: disable_write_barrier=20
(fs/reiser4/wander.c:233)[zam-1055]:
WARNING: disabling write barrier


with the reiser4 patch from 20.10.2005 + reiser4-fix-livelock-2.patch +=20
reiser4-spinlock-cleanup-2.patch
all works fine

Thx for your time
