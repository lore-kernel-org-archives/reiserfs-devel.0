From: "Fred -- Speed Up --" <speedup@free.fr>
Subject: Reiser4 installation & kernel patching
Date: Thu, 19 Jun 2003 07:11:00 +0200
Message-ID: <000e01c33621$2ced8490$0200a8c0@xpstation>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000B_01C33631.F0285BA0"
Return-path: <reiserfs-list-return-14618-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS ML <reiserfs-list@namesys.com>

------=_NextPart_000_000B_01C33631.F0285BA0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello !

I just downloaded the 2.5.72 kernel sources and applied the -mm1 patch, =
now I'd want to include Reiser4 in my kernel. I tried to compile the =
reiserprogs sources from the bk repositery, but autoconf and then =
./configure failed.
I don't really know how to patch the kernel though ... do I simply have =
to copy the reiser4 folder in the kernel's /fs folder, and then apply =
the linux-[...].patch ? This one does not work on my kernel, and I don't =
know if it's the right way to go.
I'd just like you to make a little howto to merge reiser4 into an =
existing kernel (I don't want to download the whole Reiser4 kernel tree =
...) and then correctly compile the reiser4progs.

Thank you in advance,
Fred

PS : What are the lilo and grub patches in the reiserprogs source tree =
for ? Do they bring boot support for reiser4 partitions, so that grub =
for instance will be able to fetch its menu.lst file from a reiser4 =
partition ?
------=_NextPart_000_000B_01C33631.F0285BA0--

