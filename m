From: Oleg Drokin <green@namesys.com>
Subject: Re: Mount and file system size issue
Date: Sun, 9 Jun 2002 23:07:47 +0400
Message-ID: <20020609230747.A8355@namesys.com>
References: <8287102CFE5C31418556A13A4E5BEE91E95A77@sphynx.git.compgen.com> <3CFFB2CA.6020300@namesys.com> <001201c20d9e$73e5d070$5701a8c0@bomoon> <20020607112121.C12869@namesys.com> <000801c20e3a$df840b20$5701a8c0@bomoon> <20020607200220.A1657@namesys.com> <001601c20e41$b06afd60$5701a8c0@bomoon> <20020607232650.A2630@namesys.com> <003401c20f24$9b42a2b0$5701a8c0@bomoon>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10699-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <003401c20f24$9b42a2b0$5701a8c0@bomoon>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bo <bo@sosnetwork.net>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Hello!

On Sat, Jun 08, 2002 at 12:42:21PM -0700, bo wrote:

>    >reiserfs: warning: CONFIG_REISERFS_CHECK is set On
>    >reiserfs: warning:  -it is slow mode for debugging
>    >reiserfs:  checking transaction log(device 21:01)

Hm. Would it help if you turn of CONFIG_REISERFS_CHECK config item?

> ???   It took 2-3 seconds(1 out of 5), or 3-4 munites(1 out of 5)
>         or forever(3 out of 5) to complete.

All of that on the same filesystem (with same contents)?

> System status at this time: from another console( run "top")
> ---------------------------------------------------------
>   1:40am  up  1:40,  2 users,  load average: 8.62, 7.71, 4.81
> 37 processes: 30 sleeping, 6 running, 1 zombie, 0 stopped
> CPU states:  0.3% user, 99.6% system,  0.0% nice,  0.0% idle

Ok, all the time is spent in kernel.
Can you capture several traces for us please?
( several sysrq-p and/or sysrq-t outputs when this happens).

> Swap: 262576K av,   4204K used, 258372K free                  4160K cached
>   PID USER     PRI  NI  SIZE  RSS SHARE STAT  LIB %CPU %MEM   TIME COMMAND
>     3 root      16   0     0    0     0 RW      0 34.0  0.0   7:16 kswapd
>  1283 root      17   0  4956 4956   520 R       0 13.1 16.5   0:56
> mkreiserfs

Hm. Mkreiserfs? I though you expirience the promlems when you
try to mount 120G filesystem, no?

Bye,
    Olet
