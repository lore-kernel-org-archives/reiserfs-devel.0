From: Billy Transue <bill@black9.net>
Subject: Hard drive gone bad w/ reiserfs on it...
Date: 22 May 2002 20:58:15 -0500
Message-ID: <1022119095.2088.126.camel@threshold>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10404-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I had one of those terrible IBM Deskstar drives, its gone bad, when I
boot my bios warns me about the S.M.A.R.T. monitoring not responding and
that it might fail soon (thanks for telling me AFTER bios).  Anyway, its
a reiserfs partitions for /, /home, and most importantly my /media.  All
my mp3s are on media, about 19 gigs, I'll pay pal anyone about $20 if
they can help me recover it.  I'm willing to do just about anything. 
Inclosed are the error messages for various commands I've tried.  I'm
running 2.4.18 and was running 2.4.17 when this all went down.  Thanks
for any help or insight any of you guys can provide.



threshold:~# mount /dev/hdd5 /mnt/temp/
/dev/hdd5: Input/output error
mount: you must specify the filesystem type

threshold:~# mount -t reiserfs /dev/hdd5 /mnt/temp/
mount: wrong fs type, bad option, bad superblock on /dev/hdd5,
       or too many mounted file systems

threshold:~# reiserfsck /dev/hdd5

<-------------reiserfsck, 2002------------->
reiserfsprogs 3.x.1b

Will read-only check consistency of the filesystem on /dev/hdd5
Will put log info to 'stdout'

Do you want to run this program?[N/Yes] (note need to type Yes):Yes
reiserfs_open: bread failed reading block 16
reiserfs_open: neither new nor old reiserfs format found on /dev/hdd5

reiserfsck: could not open filesystem on "/dev/hdd5"


Aborted

Thanks in advance all!

--
Billy Transue
bill@black9.net

Open Source, Open Standards, Open Minds

