From: Domenico Andreoli <cavok@tiscali.it>
Subject: how manage this? (was: Bug#304342: /sbin/mkreiserfs: created a filesystem with mkreiserfs -b 1024 ...)
Date: Wed, 27 Apr 2005 16:48:45 +0200
Message-ID: <20050427144845.GA1727@raptus.dandreoli.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23929-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: Miernik <miernik@ffii.org>, 304342@bugs.debian.org

hi,

  which advice i can give to those users finding these absurd and
obviously buggy behaviours? thanks.

cheers
domenico

----- Forwarded message from Miernik <miernik@ffii.org> -----

Date: Tue, 12 Apr 2005 16:26:33 +0200
From: Miernik <miernik@ffii.org>
Subject: Bug#304342: /sbin/mkreiserfs: created a filesystem with
    mkreiserfs -b 1024 and it hangs anything trying to write to it

Package: reiserfsprogs
Version: 1:3.6.19-1
Severity: normal
File: /sbin/mkreiserfs

I created a partition made of 2618595 sectors (~1.3 GB) /dev/hda6 and
created a filesystem on it with

mkreiserfs -b 1024 -l /var/cache/wwwoffle /dev/hda6

Anything trying to write on the filesystem (tried mc and touch) hangs
completely, shows about 60% to 65% CPU usage in top and is unkillable,
even with -9. After 20 minutes of such state I rebooted it with
<Alt>+<SysRq> b 
as nothing else would stop it. 
Then I tried "touch t1" on the filesystem, with the same result. 
<Alt>+<SysRq> b again. 
reboot won't work, as the partition would not unmount. 

-- System Information:
Debian Release: 3.1
Architecture: i386 (i586)
Kernel: Linux 2.6.11-1-386
Locale: LANG=en_US.UTF-8, LC_CTYPE=en_US.UTF-8 (charmap=UTF-8)

Versions of packages reiserfsprogs depends on:
ii  libc6                       2.3.2.ds1-20 GNU C Library: Shared libraries an
ii  libuuid1                    1.37-1       universally unique id library


----- End forwarded message -----


-----[ Domenico Andreoli, aka cavok
 --[ http://people.debian.org/~cavok/gpgkey.asc
   ---[ 3A0F 2F80 F79C 678A 8936  4FEE 0677 9033 A20E BC50
