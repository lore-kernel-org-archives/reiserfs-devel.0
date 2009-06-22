From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser3: data=journal causes panic in 2.6.29.4
Date: Mon, 22 Jun 2009 15:22:23 +0200
Message-ID: <4A3F858F.7060505@gmail.com>
References: <19003.42003.291323.769232@fisica.ufpr.br>	<alpine.DEB.2.01.0906202254510.6439@bogon> <19006.20057.249908.171552@fisica.ufpr.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <19006.20057.249908.171552@fisica.ufpr.br>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Carlos Carvalho <carlos@fisica.ufpr.br>
Cc: reiserfs-devel@vger.kernel.org

Carlos Carvalho wrote:
> Christian Kujau (lists@nerdbynature.de) wrote on 20 June 2009 23:07:
>  >On Fri, 19 Jun 2009, Carlos Carvalho wrote:
>  >> Putting data=journal in the options in fstab makes the kernel stop at
>  >> boot complaining it couldn't get a lock.
>  >
>  >AFAIK there is no data= mount option for reiserfs. Where did you see this 
>  >documented?
>
>   

Reiserfs has mount options "data=journal", "data=ordered", data=writeback,
which have the same meaning as in the case of ext3.
Description of all reiserfs mount options can be found here:
http://web.archive.org/web/20061113154827/www.namesys.com/mount-options.html

> It's not in the man page; it's mentioned in some posts. Clearly, it's
> recognized by mount and passed to the kernel, otherwise there'd be no
> panic. Also, after it's mounted we can use
> mount -o remount,data=journal. In a freshly mounted partition it seems
> to work; there are no hangs, and creating/removing/changing files
> works. On a busy fs it hangs.
>
>  >> What's the status of data journaling in reiser3?
>   

It should work.

Are you sure that your system hangs on reiserfs?
If yes, then please, let's start with checking your
partition with reiserfsck.

Thanks,
Edward.

>  >
>  >In which regard?
>
> Does it work? Should it work? Is there any relation to the recent
> changes with locking?
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

