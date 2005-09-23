From: Gherald <gherald@gmail.com>
Subject: reiser4 100% CPU
Date: Fri, 23 Sep 2005 18:44:02 -0500
Message-ID: <a112e5bc05092316441d22bff5@mail.gmail.com>
Reply-To: Gherald <gherald@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26264-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

A snipet from htop:

PID  USER     PRI  NI  VIRT   RES   SHR S CPU% MEM%   TIME+  Command
66   root      25   0     0     0     0 R 50.0  0.0  1h21:53 pdflush
3235 root      25   0     0     0     0 R 49.5  0.0 33:50.45 ent:hda6!

uname -a :
Linux mu 2.6.14-rc1-mm1 #1 PREEMPT Tue Sep 20 16:02:39 CDT 2005 i686
Intel(R) Pentium(R) M processor 1200MHz GenuineIntel GNU/Linux

This is my first and only reiser4 filesystem, and has not been used
with any other kernels.

fsck.reiser4 didn't seem to find anything, and the problem reoccured
after reboot

-Gherald (off list, CC me)
