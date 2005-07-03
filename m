From: "Flora Dru" <dru@dicts.mak.ac.ug>
Subject: Re: Filesystem repair and Data Recovery
Date: Sun, 03 Jul 2005 17:35:12 +0300
Message-ID: <20050703143512.C778CA0F5@mail.mak.ac.ug>
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
            <20050702101916.31F449FEA@mail.mak.ac.ug>
            <1120395556.4219.13.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24927-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1120395556.4219.13.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com


Hi
> 
> Lets try to find whether there is anything on /dev/sdc1 which looks like
> reiserfs. 
> 
> Please compile the attached program 
> make myscan 
> 
> and run it
> ./myscan /dev/sdc1

it returns  -- failed to read block 16394634 


> This program will look for reiserfs formatted nodes reiserfsck can try
> to re-build filesystem of.
> If you see a lot of lines like:
> block 34640 is reiserfs leaf
> block 34654 is reiserfs leaf
> block 34672 is reiserfs leaf 
> 
> then you should make a copy of /dev/sdc1 and do:
> reiserfsck --rebuild-sb /dev/copy
> reiserfsck --rebuild-tree /dev/copy 
> 
> 
> Please also try this program on a backup you made over ssh and let us
> know the result.

failed to read block 8942372 

>> 
>> Mount returns
>> /dev/sda1 on / type reiserfs (rw)
>> proc on /proc type proc (rw)
>> devpts on /dev/pts type devpts (rw,mode=0620,gid=5)
>> /dev/sda2 on /boot type reiserfs (rw)
>> /dev/sda9 on /data type reiserfs (rw)
>> /dev/sda8 on /opt type reiserfs (rw)
>> /dev/sda6 on /usr type reiserfs (rw)
>> /dev/sda7 on /var type reiserfs (rw)
>> shmfs on /dev/shm type shm (rw)
>> /dev/sdc1 on /mnt type ext2 (rw)  
>> 
> 
> If you are sure that /dev/sdc1 is reiserfs, you should have umounted it
> already. 
> 
I mounted before i checked this. 

regards
Florence 

