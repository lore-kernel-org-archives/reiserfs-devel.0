From: Rene Rebe <rene@rocklinux-consulting.de>
Subject: reiser4 on big-endian system (e.g. PowerPC) [RESEND]
Date: Sat, 26 Jun 2004 09:12:08 +0200 (CEST)
Message-ID: <20040626.091208.861042315.rene@rocklinux-consulting.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19408-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi all,

as I wrote in my last mail (not yet on the list maybe due to
subscription address mismatch) I decided to try reiser4 on PowerPC.

As I wrote in my other mail (just as reference if the other does not
make it onto the list):

Unfortunately the userspace tools already have a problem to create a
large key filesystem:

mkfs.reiser4 -o key=3Dkey_large /dev/discs/disc0/part2
kdebugfs.reiser4 /dev/discs/disc0/part2 | grep key
key policy:     SHORT

Hm ...

mkfs.reiser4 -o key=3Dkey_short /dev/discs/disc0/part2
kdebugfs.reiser4 /dev/discs/disc0/part2 | grep key
key policy:     SHORT

Jun 23 23:26:46 idefix kernel: WARNING: Key format mismatch. Only large=
 keys are supported.

I reviewed parts of the code and indeed the kernel uses d??tocpu where
the userspace tools do not do this for at least some fields. After I
fixed the flags, and so was able to get further during my mount
attempt I got this:

Jun 24 01:36:42 idefix kernel: WARNING: Error for inode 720575940379279=
360 (-2)

I hope this information allows to you improve the big-endian support,
unfortunately my TODO is already far too long to help with it :-(

Sincerely yours,
  Ren=E9 Rebe
    - ROCK Linux stable release maintainer

--  =

Ren=E9 Rebe - Europe/Germany/Berlin
  rene@rocklinux.org rene@rocklinux-consulting.de
http://www.rocklinux.org http://www.rocklinux-consulting.de

