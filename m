From: "Ivan Ivanov" <ivandi@vamo.bg>
Subject: tests to see how ext3 reiserfs 3.6 and jfs survive disk errors.
Date: Wed, 31 Mar 2004 14:44:00 +0300 (EEST)
Message-ID: <32823.193.110.218.57.1080733440.squirrel@mail.vamo.bg>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-17618-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ext3-users@redhat.com
Cc: reiserfs-list@namesys.com

I made some tests to see how ext3 reiserfs 3.6 and jfs survive disk
errors.

The test is simple:
format a partition, copy the kernel source, unmount and and do ?dd
if=/dev/zero of=/dev/hdd bs=512 count=100000 seek=30000? to simulate a
disk surface damage and then run fsck.

seek=30000 ? this must be the second half of journal in reiserfs and
ext3, for jfs I don't know

Result:

jfs:
----
total data loss, can't mount, fsck didn't helps

reiserfs:
---------
doing ?reiserfsck ?rebuild-tree? moves all recovered data in lost+found,
but information is almost unusable

ext3:
-----
after ?fsck.ext3 -f -y? almost everything was usable, directory
structure was untouched, some files was moved in lost+found, but in
general
everything was usable.

My opinion:
I can't use anything but ext2/3 in a system where there is no RAID ? 99%
of desktops and most of web and mail servers.

Cheers
Ivan




