From: "bo" <bo@sosnetwork.net>
Subject: Re: Mount and file system size issue
Date: Mon, 10 Jun 2002 10:47:00 -0700
Message-ID: <005d01c210a6$d28bad60$5701a8c0@bomoon>
References: <8287102CFE5C31418556A13A4E5BEE91E95A77@sphynx.git.compgen.com> <3CFFB2CA.6020300@namesys.com> <001201c20d9e$73e5d070$5701a8c0@bomoon> <20020607112121.C12869@namesys.com> <000801c20e3a$df840b20$5701a8c0@bomoon> <20020607200220.A1657@namesys.com> <001601c20e41$b06afd60$5701a8c0@bomoon> <20020607232650.A2630@namesys.com> <003401c20f24$9b42a2b0$5701a8c0@bomoon> <20020609230747.A8355@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10712-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Hi ,

> On Sat, Jun 08, 2002 at 12:42:21PM -0700, bo wrote:
>
> >    >reiserfs: warning: CONFIG_REISERFS_CHECK is set On
> >    >reiserfs: warning:  -it is slow mode for debugging
> >    >reiserfs:  checking transaction log(device 21:01)
>
> Hm. Would it help if you turn of CONFIG_REISERFS_CHECK config item?
>

I will try it later, I could not rebuild the system now.
Are there anyway to turn it off on the command line?

> > ???   It took 2-3 seconds(1 out of 5), or 3-4 munites(1 out of 5)
> >         or forever(3 out of 5) to complete.
>
> All of that on the same filesystem (with same contents)?
>

I mean it fails(hang) most of time when I try to mount the reiserfs with
120G size after "mkreiserfs".
As you notice in the system status below, the CPU is occupied by the system
by 99.6(8) %.
I do not know why?

> > System status at this time: from another console( run "top")
> > ---------------------------------------------------------
> >   1:40am  up  1:40,  2 users,  load average: 8.62, 7.71, 4.81
> > 37 processes: 30 sleeping, 6 running, 1 zombie, 0 stopped
> > CPU states:  0.3% user, 99.6% system,  0.0% nice,  0.0% idle
>
> Ok, all the time is spent in kernel.
> Can you capture several traces for us please?
> ( several sysrq-p and/or sysrq-t outputs when this happens).
>

Sorry! What is "sysrq"?

> > Swap: 262576K av,   4204K used, 258372K free                  4160K
cached
> >   PID USER     PRI  NI  SIZE  RSS SHARE STAT  LIB %CPU %MEM   TIME
COMMAND
> >     3 root      16   0     0    0     0 RW      0 34.0  0.0   7:16
kswapd
> >  1283 root      17   0  4956 4956   520 R       0 13.1 16.5   0:56
> > mkreiserfs
>
> Hm. Mkreiserfs? I though you expirience the promlems when you
> try to mount 120G filesystem, no?
>

Sorry I misled you!
This problem happens most of time at "mount", but it happens sometimes at
"mkreiserfs".

One more strange thing is "failed to generate UUID" as follow;

-------------
root@praetorian:/# mkreiserfs  /dev/hdg1

<-------------mkreiserfs, 2002------------->
reiserfsprogs 3.x.1b

mkreiserfs: Guessing about desired format..
mkreiserfs: Kernel 2.4.5-rmk4 is running.
failed to genetate UUID
<----------------------Why????
Format 3.6 with standard journal
Count of blocks on the device: 30015208
Number of blocks consumed by mkreiserfs formatting process: 9127
Blocksize: 4096
Hash function used to sort names: "r5"
Journal Size 8193 blocks (first block 18)
Journal Max transaction length 1024
inode generation number: 0
UUID: 00000000-0000-0000-0000-000000000000
------------------------

Do you have any clue from it?

Thanks,

Bo

