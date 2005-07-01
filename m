From: "Flora Dru" <dru@dicts.mak.ac.ug>
Subject: Re: Filesystem repair and Data Recovery
Date: Fri, 01 Jul 2005 16:06:16 +0300
Message-ID: <20050701130616.2D2FCA04E@mail.mak.ac.ug>
References: <20050701112954.B2F849FF0@mail.mak.ac.ug>
            <1120220361.3603.62.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24893-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1120220361.3603.62.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com


>> 
>> our reiserfs partition that holds our institutions mails got corrupted 
>> (27GB).
> 
> Can you please provide more details? Does it refuse to mount? Do you get
> kernel warnings when you try to access files on it? Did it get
> unreadable blocks? 
> 
It failed to mount the first time after a on normal shutdown and  reboot 
that is when my colleague tried to repair using rebuild-tree it failed (i 
unfortunately dont know what the errors were). This is when he modified the 
fstab, set fs as ext2, rebooted and it worked however some of the files and 
folders were corrupted with changed strange permissions and owners. See 
below: 

?--xr-S-wx  25390 1701015401 574452853 1747074414 Jul  1  2025 
admin.mak.ac.ug
?r--rw--w-  14641 741476913 173227333 1162692948 Jun  3  1975 
agric.mak.ac.ug
?--xr----t  29295 543258944 1933339936 1869572193 Oct 23  2030 
bookshop.mak.ac.ug
br-srw-r--  17418 925986415 959925040  54,  54 Jan  1  2018 mak.ac.ug 


> 
> Please run 
> reiserfsck /dev/sda2
> and let us know what does it say.
> please make sure that you have the most recent reiserfsck with
> reiserfsck -V. If it is not 3.6.19 - please upgrade:
> ftp://ftp.namesys.com/pub/reiserfsprogs/reiserfsprogs-3.6.19.tar.gz 
> 
reiserfsck /dev/sdc1 failed when i tried it (thought it was bse the partion 
is now read as ext2), unfortunately i cant umount the partition because it 
is on a production server and i cant reboot it now. But i will owrk on that 
in the nite and post error message. 

My kernel is linux 2.4.19 and reiserfsprogs-3.6.19.tar.gz is recommended for 
kernels 2.4.30 or later. Which one would your recommend for my kernel? 


Thanks again
Florence 

