From: jp.guillemin@free.fr
Subject: Re: 2.6.13.2 + reiser4 system hangs and poor performance
Date: Wed, 12 Oct 2005 11:08:55 +0200
Message-ID: <1129108135.434cd2a7f2e08@imp5-g19.free.fr>
References: <623652d50510110922j319d5325i@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-26500-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <623652d50510110922j319d5325i@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Bainbridge <chris.bainbridge@gmail.com>
Cc: reiserfs-list@namesys.com


Hi,

I can confirm this problem :

Process or System hang during depmod -> need hard shutdown to get out.

Tested on 2.6.13, 2.6.13.2 , 2.6.13.3.

No problem with 2.6.13mm3.

How to reproduce it : Install the latest Nvidia driver.

No logs.

Best regards

JP


Selon Chris Bainbridge <chris.bainbridge@gmail.com>:

> Hi,
>
> Since updating to 2.6.13.2 last week I've had a couple of system hangs
> which required a poweroff. I can now reproduce a bad performance +
> can't reboot situation. I'm using gentoo with a reiser4 root
> partition. I've only tested this on my own system, so if another
> 2.6.13.2 + reiser4 gentoo user could try this that would be useful.
>
> Under 2.6.12.5, do 'time emerge =sun-jdk-1.5.0.05'. Total time is 2
> minutes 10 seconds.
> Under 2.6.13.2, do 'time emerge =sun-jdk-1.5.0.05'. Total time is 6
> minutes 51 seconds. Will appear to hang at the "gzipping man page:
> unpack200.1" but eventually finishes. After this, attempting to
> shutdown will result in a system hang.
>
> Like I said, this happens every time I emerge that package. Probably
> it causes some pattern of disk I/O that triggers a bug in reiser4.
> During the hang time, the pdflush process is taking up most of the
> cpu, and there is almost no disk i/o. I tested with a non-preempt
> kernel, and get the same. With 2.6.12.5, everything is okay.
>


