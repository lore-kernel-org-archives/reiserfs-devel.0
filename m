From: "Xu CanHao" <xucanhao@gmail.com>
Subject: Re: Reiser4 performance bottlenecks and possible solutions
Date: Fri, 20 Jul 2007 21:09:39 +0800
Message-ID: <6ec7a4340707200609l18697bb2n199e95a56a309f9f@mail.gmail.com>
References: <20070719212617.GA9075@physik.fu-berlin.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=EGfa1tXt5RqYLWlB9j3yk2tZgG9LfmNKQ34fDBTdcgAxDIaLhmQ5Z09OGVkXGpr6vmM3CWBvgZaWq4wYj4PN9PQl0XyVe0glBsdSSV7ZjWEA3ju/JX1l6e+2UKs1o7XcXFS9jk740SCqi92vjnVq/6AwjqQ86wddgzelWSC7eMs=
In-Reply-To: <20070719212617.GA9075@physik.fu-berlin.de>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, reiserfs-devel@vger.kernel.org, Edward Shishkin <edward@namesys.com>, "Vladimir V. Saveliev" <vs@namesys.com>

Hello!

I suspect your problem of "syncing for minutes" might be:

1, Not having a mount option "noatime,nodiratime"
2, Application sync/fsync/O_SYNC... too much
3, Memory size >>>> Disk write speed(what atom_max_size matters)

You may add the mount option yourself, the patch(for
"reiser4-for-2.6.21.patch.gz") added a mount option "fsync" as said
before(the default value is 100):

"Terrible fsync() performance has been talked for a thousand times
without a full solution. I'm thinking of a temporary solution: adding
a mount option and let the user determine the fsync() frequency(yes,
you may lose data when power-fail), things like:
you may use "#mount /dev/sda1 /mnt/tmp -o fsync=10" which means "fsync
once when invoked fsync 10 times""

The "atom_max_size" mount option seemed useless, so the only way is
modify the source code and re-compile. The patch modified the default
value of 1/4 mem_size to 1/8 mem_size which means if your HDD performs
a 30MB/s in "hdparm -t" and your RAM is 512MB, you would have
theoretically maximum 2 seconds waiting for atoms writing to
disk(change the value as you wish).

At last, if you're paranoid enough for performance, use
"formatting=extents" when mkfs.reiser4. Although tailing saves 5%-10%
space, you gain more performance from do_sync_read().

Thanks!

2007/7/20, Adrian Glaubitz <glaubitz@physik.fu-berlin.de>:
> Hello,
>
> I found your posting on gmane about improvement for the reiser4-code
> to overcome some performance bottlenecks. I'm using reiser4 for my
> root-partiotion on my laptop and the disk is occasionally very
> busy with syncing for minutes. So, if possible, can you send
> me your patches to test them ?
>
>
> Adrian
>
