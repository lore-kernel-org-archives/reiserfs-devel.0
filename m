From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: mkreiserfs and big RAID-Systems
Date: Mon, 15 Jul 2002 18:24:47 +0400
Message-ID: <200207151824.47086.vitaly@namesys.com>
References: <1026741573.30600.25.camel@pallas.IZS.FhG.de> <200207151738.02786.vitaly@namesys.com> <1026748894.30600.39.camel@pallas.IZS.FhG.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11010-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <1026748894.30600.39.camel@pallas.IZS.FhG.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Andreas Abele <aba@IZS.FhG.de>
Cc: reiserfs-list@namesys.com

> > First of all get the latest reiserfsprogs-3.6.2 from our ftp site please
> > and try again.
>
> Hi Vitaly,
>
> i have built the 3.6.2-Progs and get the following behaviour:
>
> 1.) mkreiserfs -d /dev/sdf1 180000000 (less than 720 GB)

Could you run just 
    mkreiserfs /dev/sdf1

> [root@saturn6 mkreiserfs]# ./mkreiserfs -d /dev/sdf1 180000000
> Free blocks: 179986295
> Syncing..ok
>
> =>Everything seems to be okay until now.
> 2.) => Now the following command (bigger than 720 GB):
>
> [root@saturn6 mkreiserfs]# ./mkreiserfs -d /dev/sdf1 190000000
> Free blocks: 189985990
> Blocksize: 4096
> bread: Cannot read a block # 189999999.
> Abgebrochen (core dumped)

Do you have anything related in your syslog?

-- 

Thanks,
Vitaly Fertman

