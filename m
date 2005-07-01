From: "Flora Dru" <dru@dicts.mak.ac.ug>
Subject: Re: Filesystem repair and Data Recovery
Date: Fri, 01 Jul 2005 17:35:53 +0300
Message-ID: <20050701143553.57D5BA02C@mail.mak.ac.ug>
References: <20050701112954.B2F849FF0@mail.mak.ac.ug>
            <1120220361.3603.62.camel@tribesman.namesys.com>
            <20050701130616.2D2FCA04E@mail.mak.ac.ug>
            <1120226737.3603.85.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24897-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1120226737.3603.85.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com


> please do
> cat /proc/mounts 
> and let us know what did it say.

cat /proc/mounts returns 

rootfs / rootfs rw 0 0
/dev/root / reiserfs rw 0 0
proc /proc proc rw 0 0
devpts /dev/pts devpts rw 0 0
/dev/sda2 /boot reiserfs rw 0 0
/dev/sda10 /home reiserfs rw 0 0
/dev/sda9 /data reiserfs rw 0 0
/dev/sda8 /opt reiserfs rw 0 0
/dev/sda6 /usr reiserfs rw 0 0
/dev/sda7 /var reiserfs rw 0 0
/dev/sdd1 /home/popmail reiserfs rw 0 0
shmfs /dev/shm shm rw 0 0
/dev/sdb5 /home/popmail/tech.mak.ac.ug reiserfs rw 0 0
/dev/sdb6 /home/popmail/agric.mak.ac.ug reiserfs rw 0 0
/dev/sdb7 /home/popmail/educ.mak.ac.ug reiserfs rw 0 0
/dev/sdc1 /mnt ext2 rw 0 0 

The corrupted partition /dev/sdc1. 

> Which partition contains reiserfs which got corrupted? Is it root
> filesystem now?

It was initially a reiserfs as i told you and he remounted it as ext2. It is 
not a root filesystem it is a storage partition 

>> > Please run 
>> > reiserfsck /dev/sda2
>> > and let us know what does it say.
>> > please make sure that you have the most recent reiserfsck with
>> > reiserfsck -V. If it is not 3.6.19 - please upgrade:
>> > ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.19.tar.gz
>> > 

Meanwhile I've run reiserfsck /dev/loop0 (an image of the corrupted 
filesystem that we transfered to another host) to which i get the error
Bad root block 4294967295. (--rebuild-tree did not complete) 

And reiserfsck  --rebuild-tree /dev/loop0 fails with No reiserfs metadata 
found 

thanks again 


