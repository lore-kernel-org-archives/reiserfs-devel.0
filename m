From: Ivan Ivanov <ivandi@vamo.orbitel.bg>
Subject: Large Partition Performance Test
Date: Thu, 11 Apr 2002 22:28:04 +0300
Sender: ivandi@idi.vamo.orbitel.bg
Message-ID: <3CB5E3C4.6A887534@vamo.orbitel.bg>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10044-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: mtfbwy_1968@yahoo.com
Cc: reiserfs-list@namesys.com

May be you have bad or very long disk cables.
I remember that some years ago I had the similar problem with one
machine.
I used Norton Disk Doctor for DOS to check the IDE drive - read/write
test.
The check speed that disk doctor shows in the begining of the drive was
more then
2 times higher then the check speed at the end of the disk.
When I replaced IDE cable with a shorter one the differense was much
lower - about 20%.


And if it is posible for you to try the same test on a smaller part of
the disks (about 20Gb for each drive).
I made my  test on 1.2GB partition in the middle of a 6GB hdd,  so the
influence of the phisical
disk geometry is lower.

Regards
Ivan



