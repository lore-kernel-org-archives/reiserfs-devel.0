From: Rene Rebe <rene@rocklinux-consulting.de>
Subject: mkfs.reiser4 on PowerPC [RESEND]
Date: Sat, 26 Jun 2004 09:11:57 +0200 (CEST)
Message-ID: <20040626.091157.336485524.rene@rocklinux-consulting.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19407-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi all,

I just wanted to give the Reiser4 progress a try on PowerPC.

Unfortunately the userspace tools already have a problem to create a
large key filesystem:

mkfs.reiser4 -o key=3Dkey_large /dev/discs/disc0/part2
kdebugfs.reiser4 /dev/discs/disc0/part2 | grep key
key policy:     SHORT

Hm ...

mkfs.reiser4 -o key=3Dkey_short /dev/discs/disc0/part2
kdebugfs.reiser4 /dev/discs/disc0/part2 | grep key
key policy:     SHORT

This happens with both reiser4progs  0.5.4 and 0.5.5

...

Of course my large key (the default) kernel (2.6.7+a recent
autosnapshot) does not like to mount this filesystem ...

Jun 23 23:26:46 idefix kernel: reiser4[mount(22229)]: try_init_format40=
 (fs/reiser4/plugin/disk_format/disk_format40.c:281)[nikita-3228]:
Jun 23 23:26:46 idefix kernel: WARNING: Key format mismatch. Only large=
 keys are supported.

Sincerely yours,
  Ren=E9 Rebe
    - ROCK Linux stable release maintainer

--  =

Ren=E9 Rebe - Europe/Germany/Berlin
  rene@rocklinux.org rene@rocklinux-consulting.de
http://www.rocklinux.org http://www.rocklinux-consulting.de

