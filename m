From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: Mount and file system size issue
Date: Wed, 12 Jun 2002 11:33:31 -0400
Message-ID: <200206121133.31763.kuba@mareimbrium.org>
References: <8287102CFE5C31418556A13A4E5BEE91E95A77@sphynx.git.compgen.com> <20020609230747.A8355@namesys.com> <005d01c210a6$d28bad60$5701a8c0@bomoon>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10724-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <005d01c210a6$d28bad60$5701a8c0@bomoon>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: bo <bo@sosnetwork.net>
Cc: reiserfs-list@namesys.com

On poniedzia=B3ek 10 czerwiec 2002 01:47 pm, bo wrote:
> Hi ,
>
> > On Sat, Jun 08, 2002 at 12:42:21PM -0700, bo wrote:
> > >    >reiserfs: warning: CONFIG_REISERFS_CHECK is set On
> > >    >reiserfs: warning:  -it is slow mode for debugging
> > >    >reiserfs:  checking transaction log(device 21:01)
> >
> > Hm. Would it help if you turn of CONFIG_REISERFS_CHECK config item?
>
> I will try it later, I could not rebuild the system now.
> Are there anyway to turn it off on the command line?
>
> > > ???   It took 2-3 seconds(1 out of 5), or 3-4 munites(1 out of 5)
> > >         or forever(3 out of 5) to complete.
> >
> > All of that on the same filesystem (with same contents)?
>
> I mean it fails(hang) most of time when I try to mount the reiserfs with
> 120G size after "mkreiserfs".
> As you notice in the system status below, the CPU is occupied by the syst=
em
> by 99.6(8) %.
> I do not know why?
>
> > > System status at this time: from another console( run "top")
> > > ---------------------------------------------------------
> > >   1:40am  up  1:40,  2 users,  load average: 8.62, 7.71, 4.81
> > > 37 processes: 30 sleeping, 6 running, 1 zombie, 0 stopped
> > > CPU states:  0.3% user, 99.6% system,  0.0% nice,  0.0% idle
> >
> > Ok, all the time is spent in kernel.
> > Can you capture several traces for us please?
> > ( several sysrq-p and/or sysrq-t outputs when this happens).
>
> Sorry! What is "sysrq"?

It's a key on your keyboard, I hope.

# echo 1 > /proc/sys/kernel sysrq
# cat /usr/src/linux/Documentation/sysrq.txt

Cheers, Kuba Ober
