From: Gyimesi Akos <gyim@freemail.hu>
Subject: illegal seek - unable to umount device
Date: Mon, 23 Jun 2003 19:44:57 +0200
Message-ID: <200306231944.57478.gyim@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14674-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi,

I have just encountered a problem (?) with reiserfs on Linux 2.4.20. I wrot=
e=20
the following (shortened) python code which produced an unkillable process:

#!/usr/bin/python

file=3Dopen("terabyte_length_file", "w")
file.seek(1024*1024*1024*1024)
file.write("%c" % 0)
file.close()

On ext2, this code produced a file which had the (nominal) length of 1=20
terabyte and the real size of 16k. I ran this script on a reiserfs partitio=
n=20
as a normal user, and it

1. produced an unkillable process with 100% CPU usage
2. i was unable to kill it anyway, and i was unable to unmount the filesyst=
em.
   (Illegal seek, Device or resource busy). So finally i rebooted the syste=
m.
   Of course, the rebooting process also got stuck as init couldn't umount
   the device either.

Naturally, i was not really surprised that this code didn't work on reiserf=
s,=20
but i was quite astonished by the fact that this dirty program could=20
practically "kill" the machine as a normal user - in a meaning that running=
=20
it several times consumes its CPU resouces and makes it impossible to unmou=
nt=20
the filesystem.

Additional information about the system:

CPU:           Pentium III (Coppermine)
Linux:         2.4.20-ptrace_lnat (gcc version 2.95.4)
Distribution:  Debian woody
Disks:         4x40GB (as might be expected, i don't have an
               1 terabyte disk :))
...
(what else do you need?)

- Akosh
ps. i haven't subscribed to the list, so please "cc" me your answers.

--=20
  .~.
  /V\        Gyimesi =C1kos
 // \\   <Gyim@email.piar.hu>
/(   )\
 ^`~'^

