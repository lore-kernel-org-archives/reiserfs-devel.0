From: Erik =?ISO-8859-1?Q?B=E5gfors?= <erik@bagfors.nu>
Subject: crashing FS.. please help
Date: 20 Jun 2002 12:53:51 +0200
Message-ID: <1024570431.1143.29.camel@detrius>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10768-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Hi all.

I'm just joined this list because I really really need help.

Today my home-computer didn't start up like it should, one filesystem
wasn't mounted. I discovered this when I was at work (like I still am)
and could log in to the computer to try to check the fs.

This is a mandrake 8.1 system that's pretty much default.

[root@egon /]# mount /bigdisk
mount: wrong fs type, bad option, bad superblock on /dev/hdb1,
       or too many mounted file systems

[root@egon /]# mount -t reiserfs /dev/hdb1 /bigdisk/
mount: wrong fs type, bad option, bad superblock on /dev/hdb1,
       or too many mounted file systems

[root@egon /]# reiserfsck /dev/hdb1
reiserfsck, 2001 - reiserfsprogs 3.x.0j
Will read-only check consistency of the partition
Will put log info to 'stderr'
Do you want to run this program?[N/Yes] (note need to type Yes):Yes
reiserfs_open: bread failed reading bitmap #1 (32768)
reiserfs_open: bread failed reading bitmap #2 (65536)
reiserfs_open: bread failed reading bitmap #4 (131072)
reiserfs_open: bread failed reading bitmap #5 (163840)
reiserfs_open: bread failed reading bitmap #6 (196608)
reiserfs_open: bread failed reading bitmap #8 (262144)
reiserfs_open: bread failed reading bitmap #9 (294912)
reiserfs_open: bread failed reading bitmap #10 (327680)
reiserfs_open: bitmap 18 was marked free



At this point the login to the machine stopped so I really can't do
anything else until I'm home.

Is there anyway to save this filesystem??  I really don't care if I can
access the whole fs I just want to get my digital pictures back.  There
are 1000s of pictures on that disk that i NEED.

I'll do anything to get them back, patching kernels and running
experimental tools is no problem as long as I can save that disk.

Maybe running reiserfsck with some flag will fix the problem???

I've been running reiserfs for about 2 years and this is the first time
I've run into problems.

I'm VERY grateful for any help.

Regards,
Erik
--=20
Erik B=E5gfors               | erik@bagfors.nu
Supporter of free software | GSM +46 733 279 273
fingerprint: 6666 A85B 95D3 D26B 296B 6C60 4F32 2C0B 693D 6E32
