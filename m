From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfsprogs 3.6.5 release
Date: Tue, 25 Mar 2003 16:42:23 +0300
Message-ID: <200303251642.23944.vitaly@namesys.com>
References: <200303251108.11938.Dieter.Nuetzel@hamburg.de> <200303251422.25804.vitaly@namesys.com> <200303251335.06542.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-13377-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200303251335.06542.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dieter =?utf-8?q?N=C3=BCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

> SunWave1 /home/nuetzel# /database/db3/sbin/reiserfsck -V
>
> <-------------reiserfsck, 2002------------->
> reiserfsprogs 3.6.5
>
> SunWave1 /home/nuetzel# /database/db3/sbin/reiserfsck -a /dev/sda3
> Reiserfs super block in block 16 on 0x803 of format 3.6 with standard
> journal Blocks (total/free): 26105/6638 by 4096 bytes
> Filesystem is NOT cleanly umounted
> Partition /dev/sda3 is mounted w/ write permissions, cannot check it <==
> !!!!!
>
> >>> Haaa, is this the wrong thing? <<<
>
> SunWave1 /home/nuetzel# mount
> /dev/sda3 on / type reiserfs (rw,noatime,notail)

as you can see it is right, it is mounted with rw permitions.

Could you run reiserfsck -a/-p on some unmounted or mounted ro partition 
which does not get mounted on boot due to this "flush_buffers: device 
is not specified". It is interesting to get the same not on boot time.

-- 

Thanks,
Vitaly Fertman


