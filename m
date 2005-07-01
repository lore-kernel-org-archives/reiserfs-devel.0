From: "Flora Dru" <dru@dicts.mak.ac.ug>
Subject: Re: Filesystem repair and Data Recovery
Date: Fri, 01 Jul 2005 19:36:25 +0300
Message-ID: <20050701163625.1C533A069@mail.mak.ac.ug>
References: <20050701112954.B2F849FF0@mail.mak.ac.ug>
            <1120220361.3603.62.camel@tribesman.namesys.com>
            <20050701130616.2D2FCA04E@mail.mak.ac.ug>
            <1120226737.3603.85.camel@tribesman.namesys.com>
            <20050701143553.57D5BA02C@mail.mak.ac.ug>
            <1120230853.3603.97.camel@tribesman.namesys.com>
            <20050701153254.F285AA07E@mail.mak.ac.ug>
            <1120234546.3603.111.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24903-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1120234546.3603.111.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

> 
> Please umount and try
> mount /dev/sdc1 /mnt -t reiserfs 
> 
> if it mounts: ls -l /mnt

It fails with
mount: /dev/sdc1 already mounted or /mnt busy

>> 
> If it is umounted, and mount -o ro /dev/sdc1 /mnt fails
> try dmesg to see what did kernel say why it could not mount it.

This also fails with /dev/sdc1 already mounted or /mnt busy 

dmesg has no error related with mount see what it returns (where else cld 
the kernel be logging?) 

SuSE-FW-ACCEPT IN=eth0 OUT= MAC=00:02:a5:42:34:cb:00:10:dc:2b:f2:45:08:00 
SRC=81.199.17.2 DST=81.199.17.15 LEN=48 TOS=0x00 PREC=0x00 TTL=127 ID=56613 
DF PROTO=TCP SPT=4507 DPT=80 WINDOW=16384 RES=0x00 SYN URGP=0 OPT 
(020405B401010402)
SuSE-FW-ACCEPT IN=eth0 OUT= MAC=00:02:a5:42:34:cb:00:0a:41:11:c4:07:08:00 
SRC=212.88.98.164 DST=81.199.17.15 LEN=60 TOS=0x00 PREC=0x00 TTL=60 ID=61303 
DF PROTO=TCP SPT=53804 DPT=25 WINDOW=5840 RES=0x00 CWR ECE SYN URGP=0 OPT 
(020405B40402080A16C4D74E0000000001030300) 

 

