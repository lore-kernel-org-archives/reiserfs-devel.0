From: Zeljko Brajdic <zorz@iskon.hr>
Subject: Quota support for UID >65534
Date: 15 Jul 2002 12:11:40 +0200
Message-ID: <1026727900.18163.61.camel@max>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11002-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS-list <reiserfs-list@namesys.com>

Hello,

I've applied quota patches for vanilla kernel-2.4.18 found at
ftp://ftp.suse.com/pub/people/mason/patches/reiserfs/quota-2.4/2.4.18/
Everything works perfectly except for checking quota with command `quota
-v username' if username have UID >65534. Interesting is that `repquota'
doesn't have that problem and showing.

This is output of `quota':

root@led 12:02 (/usr/src/linux) > quota -v bureq
quota: Error while getting quota from /dev/sda4 for 200000: Invalid argument
Disk quotas for user bureq (uid 200000): none


Strace output is (last few lines):

stat64("/dev/sda4", {st_mode=S_IFBLK|0660, st_rdev=makedev(8, 4), ...}) = 0
getuid32()                              = 0
quotactl(0xd00 /* Q_??? */|USRQUOTA, "/dev/sda4", 0, {0, 0, 2, 0, 0, 2538116, 0, 0}) = 0
quotactl(0x900 /* Q_??? */|USRQUOTA, "/dev/sda4", 0, {604800, 604800, 0, 2476, 0, 2475, 3221224236, 134536589}) = 0
geteuid32()                             = 0
quotactl(0xd00 /* Q_??? */|USRQUOTA, "/dev/sda4", 200000, {1073780232, 1073821628, 1073823040, 1, 0, 0, 0, 0}) = -1 EINVAL (Invalid argument)
write(2, "quota: ", 7quota: )                  = 7
write(2, "Error while getting quota from /"..., 70Error while getting quota from /dev/sda4 for 200000: Invalid argument
) = 70
fstat64(1, {st_mode=S_IFCHR|0600, st_rdev=makedev(136, 0), ...}) = 0
old_mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x40014000
write(1, "Disk quotas for user bureq (uid "..., 46Disk quotas for user bureq (uid 200000): none
) = 46
munmap(0x40014000, 4096)                = 0
_exit(0)                                = ?


-- 
v            ,   v  v
Zeljko Brajdic - Zorz

