From: Preston Lord <webmaster@t2.net>
Subject: Need some help on reiserfs failure
Date: 25 Oct 2002 10:12:31 -0600
Message-ID: <1035562356.3711.30.camel@preston>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11779-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi List,

On my home pc I am running SuSE 8 Pro.
I have my root partition using reiserfs.
When I woke up this morning the computer was frozen and after rebooting
it tells me there is no root partition defined. I pulled the hdd from
the machine and slaved it into another SuSE 8 pc. If I use Yast2-
Partition Utilities I can see the partitions are defined and the fs is
still being listed as reiserfs on the failed root on the home hdd.

I tried using reiserfsck as follows:

resiserfsck --check /dev/hda4

 reiserfs_open: bread failed reading block 2
 reiserfs_open: bread failed reading block 16
 reiserfs_open: neither new nor old reiserfs format found on /dev/hda4
 reiserfsck: could not open filesystem on "/dev/hda4"

reiserfsck --rebuild-sb --rebuild-tree /dev/hda5

 reiserfs_open: bread failed reading block 16
 reiserfs_open: neither new nor old reiserfs format found on /dev/hda5
 reiserfsck: could not open filesystem on "/dev/hda5"

reiserfsck --fix-fixable /dev/hd5

 reiserfsck: could not open filesystem on "/dev/hd5"


Of course when I try to mount I get the dreaded:
 mount: wrong fs type, bad option, bad superblock on /dev/hda5,
        or too many mounted file systems


Please tell me there is hope?

Thanks in advance.

-- 

Regards

Preston Lord
Programmer/Developer
Network Specialist
_______________
General Manager
Double T Computer Services
Sask, Canada
1.306.773.2054
http://www.t2.net

