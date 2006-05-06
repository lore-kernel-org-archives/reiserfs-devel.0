From: "Joseph Landers" <josephlanders@hotmail.com>
Subject: Reiser4 2.6.16.2 / 2.6.17-rc3-mm1 WARNING: out of memory?
Date: Sat, 06 May 2006 16:14:26 +0100
Message-ID: <BAY23-F20FBA411B5A04A1F6588E0A7AA0@phx.gbl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28578-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: reiserfs-list@namesys.com
Cc: laurent.riffard@free.fr, esprout@gmail.com

Thanks for the patch, I still get the same (first post) error message, as=20
before, only when  booting into the reiser4 partition, although now the=20
system stays up a bit longer before dying, I am able to execute commands an=
d=20
run programs for a few minutes before the system halting/becoming=20
unresponsive

booting on ext3 and mounting the reiser4 wseems to be fine, it's just=20
peculiar, or maybe I am not using the reiser4 partition enough to make the =

memory problem significant?

I have tried 2.6.16 to check if any bugs were introduced since then and tha=
t=20
has the same problem, so I will just have to wait for a patch to fix this=20
now

I think the problem is in /fs/inode.c which is the kernel inode file, not=20
reiser4s inode file, maybe reiser4 is sending the wrong delete inode comman=
d=20
to it?

It only seems to segfault once which is peculiar too?

_________________________________________________________________
FREE pop-up blocking with the new MSN Toolbar =96 get it now!=20
http://toolbar.msn.click-url.com/go/onm00200415ave/direct/01/

