From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: SUSE 9.1 with ReiserFS
Date: Thu, 15 Jul 2004 17:06:46 +0400
Message-ID: <200407151706.46557.vitaly@namesys.com>
References: <40F67547.E5373623@bmw.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-19632-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40F67547.E5373623@bmw.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Rudolf Boerner <Rudolf.Boerner@partner.bmw.de>, reiserfs-list@namesys.com

Hello,

On Thursday 15 July 2004 16:15, Rudolf Börner wrote:
> Hi,
>
> ok , i've nothing done ;-)
>
> I've never had any problems with ReiserFS. But now.
> SUSE 9.1
> 2 Disks with 3 x RAID 1 partitions
>
> Boot --> please use fsck manualy on /

what version of reiserfsck are you using? please update 
reiserfsprogs to the latest one from our ftp site. 

> I use reiserfsck --check /dev/md0 --> no corrption
> I use reiserfsck --fix-fixable /dev/md0 --> no corrption
>
> init 6 --> please use fsck manualy on /
> I use reiserfsck --rebuild-tree /dev/md0 --> no corrption
>
> init 6 --> please use fsck manualy on /
>
> I can bring up the system step by step but not automaticly
> mount /dev/md0 -o remount;rw
> mount -a
> init 1 ..... 5
>
> What i missing is the hostname ?
>
> Have anybody an idea?
>
> Regards
>
> rb
> --
> Rudolf BЖrner

-- 
Thanks,
Vitaly Fertman

