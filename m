From: Oleg Drokin <green@namesys.com>
Subject: Re: Mount and file system size issue
Date: Mon, 10 Jun 2002 23:20:23 +0400
Message-ID: <20020610232023.A2470@namesys.com>
References: <3CFFB2CA.6020300@namesys.com> <001201c20d9e$73e5d070$5701a8c0@bomoon> <20020607112121.C12869@namesys.com> <000801c20e3a$df840b20$5701a8c0@bomoon> <20020607200220.A1657@namesys.com> <001601c20e41$b06afd60$5701a8c0@bomoon> <20020607232650.A2630@namesys.com> <003401c20f24$9b42a2b0$5701a8c0@bomoon> <20020609230747.A8355@namesys.com> <005d01c210a6$d28bad60$5701a8c0@bomoon>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10714-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <005d01c210a6$d28bad60$5701a8c0@bomoon>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bo <bo@sosnetwork.net>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

Hello!

On Mon, Jun 10, 2002 at 10:47:00AM -0700, bo wrote:
> > >    >reiserfs: warning:  -it is slow mode for debugging
> > >    >reiserfs:  checking transaction log(device 21:01)
> > Hm. Would it help if you turn of CONFIG_REISERFS_CHECK config item?
> I will try it later, I could not rebuild the system now.
> Are there anyway to turn it off on the command line?

No, this cannot be turned off on command line.

> > > System status at this time: from another console( run "top")
> > > ---------------------------------------------------------
> > >   1:40am  up  1:40,  2 users,  load average: 8.62, 7.71, 4.81
> > > 37 processes: 30 sleeping, 6 running, 1 zombie, 0 stopped
> > > CPU states:  0.3% user, 99.6% system,  0.0% nice,  0.0% idle
> > Ok, all the time is spent in kernel.
> > Can you capture several traces for us please?
> > ( several sysrq-p and/or sysrq-t outputs when this happens).
> Sorry! What is "sysrq"?

See Documentation/sysrq.txt in your linux kernel source.

> > >   PID USER     PRI  NI  SIZE  RSS SHARE STAT  LIB %CPU %MEM   TIME
> COMMAND
> > >     3 root      16   0     0    0     0 RW      0 34.0  0.0   7:16
> kswapd
> > >  1283 root      17   0  4956 4956   520 R       0 13.1 16.5   0:56
> > > mkreiserfs
> > Hm. Mkreiserfs? I though you expirience the promlems when you
> > try to mount 120G filesystem, no?
> Sorry I misled you!
> This problem happens most of time at "mount", but it happens sometimes at
> "mkreiserfs".

Strange. If mkreiserfs hangs, it may be that your block device driver
is unhappy.

> One more strange thing is "failed to generate UUID" as follow;

Do you have /dev/urandom?

Bye,
    Oleg
