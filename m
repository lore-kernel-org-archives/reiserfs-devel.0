From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: corrupted filesystem
Date: Wed, 26 Feb 2003 19:45:06 +0300
Message-ID: <200302261945.06647.vitaly@namesys.com>
References: <1046275575.11015.82.camel@cjk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12939-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1046275575.11015.82.camel@cjk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Didelot Loic <ldidelot@luxadmin.org>, reiserfs-list@namesys.com

On Wednesday 26 February 2003 19:06, Didelot Loic wrote:
> hi, it seems that my filesystem is corupted. I have a whol folder i can
> not cp or ls
>
> i have only one partition / but reiserfsk tells me that the hdd needs to
> be mounted readonly.
>
> now my question is, how can i do this? anyway to do it remotely?
>
>
> thanks in advance

you can check a partiton if it is mounted readonly. If a partition needs to 
be fixed, you should umount it first.

If you have a space on your device to create a rescue partition on it, so 
after that you can boot from there and fsck the problem partition. Othewise,
reiserfsck could be changed to recover readonly mounted filesystems and you 
will need to put it on tmpfs (or not the same fs), kill all processes which 
prevent / from being remounted readonly, fsck the partition, reboot.

-- 

Thanks,
Vitaly Fertman
