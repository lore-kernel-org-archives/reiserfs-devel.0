From: Jose R R <jose.r.r@metztli.com>
Subject: Re: 2 minutes for a reiser4 filesystem to mount.
Date: Thu, 22 Oct 2015 23:41:06 -0700
Message-ID: <CAM12Q5Rwja+qYO1AfcYmBsCWOfk+8_Y_VgtLn4zBJ17GiP5row@mail.gmail.com>
References: <n0b6ql$6t4$1@ger.gmane.org>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <n0b6ql$6t4$1@ger.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Georgios Tsalikis <georgios@tsalikis.net>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Niltze!

On Thu, Oct 22, 2015 at 10:38 AM, Georgios Tsalikis
<georgios@tsalikis.net> wrote:
> The filesystem is 1.7GB large, lies in a GPT patition and is formated with
> -o node=node41
In this test machine(s) my partitions are not GPT

> without any other override. The kernel is 4.2.3 with the
> 4.2.2 patch.
I am running similar combination; mount time of ~60GB & ~50GB
partitions (at least one previously formatted: -o create=reg40) with
*existing data*  is under 8 seconds.

> I tried the same on a 250MB partition and it mounts instantly. dmesg shows
> nothing special
> Any ideas?

Tried formatting a ~24GB non-GPT partition with options as you
specified; the mount time was under 3 seconds for the newly formatted
partition:
https://pbs.twimg.com/media/CR-zkQtVAAA5D_G.png:large

I have no idea if GPT makes a difference.
> Thanks in advance. :)
>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
