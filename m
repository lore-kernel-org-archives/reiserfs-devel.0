From: Moritz Angermann <moritz.angermann@gmx.net>
Subject: problems with patching.
Date: 18 Jul 2002 15:52:42 +0200
Sender: Moritz Angermann <cone@caos.mine.nu>
Message-ID: <1027000362.734.14.camel@prototype>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11049-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

o.k. i tryed to patch my 2.4.18 kernel with the patches from 
ftp://ftp.namesys.com/pub/reiserfs-for-2.4/2.4.18.pending
as sugested...
but a few of them fail to work.

for a few i had to link /usr/src/linux to /usr/src/linux-2.4.18 and to
/usr/src/linux-2.4.18.o
a few were trying to patch 2.4.9-pre* .. or s.th.
one was trying to patch 'a' and one was trying to patch a SuSE kernel.

erm guys. this is no way user friendly ...
and really confusing.

i just wonder if i now made my kernel more safe or if i broke it...

i'll now do a recompiling, but first switching on ramdisk support,

than rebootig and running mkrescue, on my debian box. as the debian ppl
told me in #debian on OPN.
i'll put the reiserfs tools on my secound partition. so i can have /
unmounted and still have access to the reiserfsprogs.

so any final sugestions ?#

thanks,
-moritz
