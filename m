From: David Masover <ninja@slaphack.com>
Subject: can't compile with reiser4
Date: Fri, 30 Apr 2004 18:10:09 -0500
Message-ID: <4092DCD1.6000107@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18341-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

glibc) on my system now either fail to install, continue trying to
install forever (make caught in an infinite loop), or install but don't
work later.  My / is reiser4, with separate mountpoints for /boot, /sys,
/proc, /dev, /dev/pts, and /dev/shm.  So this doesn't make sense...

I think I've figured out one reason it's failing, though:  I've found a
certain place where if I do something like 'make foo.o', it builds foo.o
just fine (out of foo.c), but foo.c gets its mtime updated right along
with foo.o -- making foo.o out of date.  This is not just defeating the
purpose of 'make' (being able to rebuild a selective portion of a
program and not the whole thing, based on mtimes) but causes at least
one program (sudo) to not install properly.

The way that works is that 'make' is called once for the build, with all
the paths (including --sysconfdir) set to their ultimate destinations in
/, and then 'make install' is called again, with these paths set to the
same thing, but inside the install tree -- so instead of /etc, we get
/var/tmp/portage/sudo-1.6.7/install//etc
(I may not have those versions or paths right.)

This is fine, because 'make install' is usually just copying files
around, so we want the files copied to that temporary install directory
(so we can do an atomic merge).  But because so many .c files are just
as new as the .o files, so much (if not everything) must be rebuilt
during 'make install' -- which means sudo becomes hardcoded to look for
its config file somewhere in /var/tmp.

More details if you want them...
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQJLcz3gHNmZLgCUhAQLrPQ//YfhmVydF0P38dKUpNC8BUQQK022FeuP1
aWwaPl7re7R+WDGcWI8cwwbIzDtjDih213GFAYklzXENMbtgyQXsGUSHWFBa9CdL
XFCUW+p2CjMtkgw+1lJVjslujx3n4PRAdmPSfVpi9BYAtmxZralZtzL/1X8LcEbu
SRw6OxeLlXwG/eqqHYoD3yMfYjabVXGZU5OpZ+zMYOuya04LDCTdy3rLA4YXMRo1
DwwV+Fzl/lIgAyTYMURJ1Ht1NepmjYeU9aqjeBJ0hO9dhkPvf5FSBd7VXODdBbLw
n41IANiXkllO+BLt2bTPfPa7bbLMLgefS+YFFO+HBP6zAzP4kEwuecQbOma/Tfg1
/o9Ey/2FUfHYIwAwwYz7Qc0pP7HmEywx7YLXpvgBdCXadAwcpJdtLJkjjA0/1Ued
HbPw8T6nDr4IB85YWAKX+Y8iejE4YJ5L6PMABxsFCF6RbeZJ9qXU5L1CGlDiMR1F
QT25gxjfiwdR9p7y6BCfSxsqvoYNVnBpAzp58aNJUMlfWOrZU6TtnPCMFgqPhu2s
/IPpgiUpEzs/WKbf9PhEqQW0yuRKQpARvSpEd+VFnheyuQL9Py2QPH34hefAiBmY
UdDAYr1EQsKLh6g9q32GMX0O19w9mMTxiMoErKUaD+oktCRCa5LJa0bzEia3M5ek
MSAaZiHM+Uc=
=E5St
-----END PGP SIGNATURE-----
