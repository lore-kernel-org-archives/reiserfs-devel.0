From: "bo" <bo@sosnetwork.net>
Subject: Re: Mount and file system size issue
Date: Sat, 8 Jun 2002 12:42:21 -0700
Message-ID: <003401c20f24$9b42a2b0$5701a8c0@bomoon>
References: <8287102CFE5C31418556A13A4E5BEE91E95A77@sphynx.git.compgen.com> <3CFFB2CA.6020300@namesys.com> <001201c20d9e$73e5d070$5701a8c0@bomoon> <20020607112121.C12869@namesys.com> <000801c20e3a$df840b20$5701a8c0@bomoon> <20020607200220.A1657@namesys.com> <001601c20e41$b06afd60$5701a8c0@bomoon> <20020607232650.A2630@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10687-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>, Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Hello,

I have more information on this issue as folow;

System:  ARM9, 32M RAM, IDE, debian_arm_linux2.4.5
filesystem size = 120 G
When to happen:

   > mkreiserfs /dev/hdf1
   or
   >mount -t reiserfs /dev/hdf1 /mnt/hdf1

  The cosole message:

   >reiserfs: warning: CONFIG_REISERFS_CHECK is set On
   >reiserfs: warning:  -it is slow mode for debugging
   >reiserfs:  checking transaction log(device 21:01)

???   It took 2-3 seconds(1 out of 5), or 3-4 munites(1 out of 5)
        or forever(3 out of 5) to complete.

System status at this time: from another console( run "top")
---------------------------------------------------------
  1:40am  up  1:40,  2 users,  load average: 8.62, 7.71, 4.81
37 processes: 30 sleeping, 6 running, 1 zombie, 0 stopped
CPU states:  0.3% user, 99.6% system,  0.0% nice,  0.0% idle
Mem:   30020K av,  28852K used,   1168K free,      0K shrd,  14132K buff
Swap: 262576K av,   4204K used, 258372K free                  4160K cached

  PID USER     PRI  NI  SIZE  RSS SHARE STAT  LIB %CPU %MEM   TIME COMMAND
    3 root      16   0     0    0     0 RW      0 34.0  0.0   7:16 kswapd
 1283 root      17   0  4956 4956   520 R       0 13.1 16.5   0:56
mkreiserfs
  328 jskim     15   0   612  536   536 R       0 11.5  1.7   6:50 top
----------------------------------------

Any sugestions?

Thanks,

Bo




----- Original Message -----
From: "Oleg Drokin" <green@namesys.com>
To: "bo" <bo@sosnetwork.net>
Cc: <reiserfs-list@namesys.com>
Sent: Friday, June 07, 2002 12:26 PM
Subject: Re: [reiserfs-list] Mount and file system size issue


> Hello!
>
> On Fri, Jun 07, 2002 at 09:38:01AM -0700, bo wrote:
>
> > one is RAM shortage for bitmap, another is to use Linux2.4.13 or above
for
> > ARM platform.
> > Could it be both?
>
> It is unclear.
>
> > Could you help me what( or how) I need to investigate?
>
> First try 2.4.18, if the symptoms are the same, try to profile a kernel
> (man readprofile).
>
> BTW, what kind of ARM system do you have?
>
> Bye,
>     Oleg
>

