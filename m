From: "Flora Dru" <dru@dicts.mak.ac.ug>
Subject: Re: Filesystem repair and Data Recovery
Date: Sat, 02 Jul 2005 13:19:16 +0300
Message-ID: <20050702101916.31F449FEA@mail.mak.ac.ug>
References: <20050701112954.B2F849FF0@mail.mak.ac.ug>
            <1120220361.3603.62.camel@tribesman.namesys.com>
            <20050701130616.2D2FCA04E@mail.mak.ac.ug>
            <1120226737.3603.85.camel@tribesman.namesys.com>
            <20050701143553.57D5BA02C@mail.mak.ac.ug>
            <1120230853.3603.97.camel@tribesman.namesys.com>
            <20050701153254.F285AA07E@mail.mak.ac.ug>
            <1120234546.3603.111.camel@tribesman.namesys.com>
            <20050701163625.1C533A069@mail.mak.ac.ug>
            <1120239440.10316.119.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24914-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1120239440.10316.119.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Good morning
> ok, you said earlier that you can umount it.
> Please umount and run
> reiserfsck /dev/sdc1
> and let us know what it says. 
> 
> PS: I have to leave now. Let continue later. I am not sure when I will
> be at work. Maybe tomorrow, maybe on sunday. 
> 
> Can you backup /dev/sdc1 locally? I am not sure that ssh corrupthost dd
> if=/dev/sdc1 > sdc1.img works as it is supposed to. 
> 
reiserfsck /dev/sdc1 returns
Do you want to run this program?[N/Yes] (note need to type Yes):Yes
reiserfs_open: neither new nor old reiserfs format found on /dev/sdc1
reiserfsck: could not open filesystem on "/dev/sdc1" 

Aborted 

Mount returns
/dev/sda1 on / type reiserfs (rw)
proc on /proc type proc (rw)
devpts on /dev/pts type devpts (rw,mode=0620,gid=5)
/dev/sda2 on /boot type reiserfs (rw)
/dev/sda9 on /data type reiserfs (rw)
/dev/sda8 on /opt type reiserfs (rw)
/dev/sda6 on /usr type reiserfs (rw)
/dev/sda7 on /var type reiserfs (rw)
shmfs on /dev/shm type shm (rw)
/dev/sdc1 on /mnt type ext2 (rw) 


Thanks again
Florence Dru 

 


