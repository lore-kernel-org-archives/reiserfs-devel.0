From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Comparison of notail and notail,iicache(14)  2.4.19-pre7
Date: Sat, 27 Apr 2002 00:00:49 +0200
Message-ID: <200204270000.50274.Dieter.Nuetzel@hamburg.de>
References: <200204260657.32516.Dieter.Nuetzel@hamburg.de> <200204261845.45178.Dieter.Nuetzel@hamburg.de> <3CC9C4F6.2090508@mb.tu-ilmenau.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10190-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CC9C4F6.2090508@mb.tu-ilmenau.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>
Cc: "Yury Yu. Rupasov" <yura@yura.polnet.botik.ru>, reiserfs-list <reiserfs-list@namesys.com>

On Friday 26 April 2002 23:21, Manuel Krause wrote:
> On 04/26/2002 06:45 PM, Dieter N=FCtzel wrote:
> > On Friday 26 April 2002 13:41, Yury Yu. Rupasov wrote:
> >>Dieter N=FCtzel wrote:
> >>>Manuel Krause wrote:
> >>>
> >>>[-]

[-]

> > Had that before but Chris and Oleg gave me advice.
> > I tried it this way:
> >
> > /* lock the current transaction */
> > inline static void lock_journal(struct super_block *p_s_sb) {
> >   PROC_INFO_INC( p_s_sb, journal.lock_journal );
> >   debug_lock_break(1);
> >   conditional_schedule();
> >   down(&SB_JOURNAL(p_s_sb)->j_lock);
> > }
> >
> > /* unlock the current transaction */
> > inline static void unlock_journal(struct super_block *p_s_sb) {
> >   up(&SB_JOURNAL(p_s_sb)->j_lock);
> > }
> >
> > But then it seems to be _NOT_ preempt (+lock-break) save.
> > System lock up (nothing in the logs, SysRq key didn't work) during
> > latencytest0.42-png write test. Read test worked.
> >
> > Thanks,
> > 	Dieter
>
> Mmh, I made this adjustment in the patch, too, since the first speedup
> patches had been posted. I really don't know how serious this could be
> in this code context.
>
> I had random hard locks,too, but blamed it to my degenerating hardware
> so far.

I think it is hardly hardware related.
Try without lock-break (only disable it during make xconfig).

> Could anyone else advise on preempt+lock-break-awareness here?

Yura, Chris, Oleg or at least Robert Love :-)
But Robert hasn't updated the lock-break stuff for some time. He will do it=
=20
soon.

> The linux-2.4.19p6-compound-speedup.patch seems to be another measurable
> tick faster than Olegs first patchset. Maybe, I'll post some values on
> my setup over the weekend. I've had one faster run so far but it locked
> up without log hints... ;-))

Ha, ha,...:-)

Then I have one more for you:

Page coloring patch.
It gave ~10% speedup on my 1 GHz Athlon II SlotA (0,18=B5m, L2 512K) for me=
mory=20
intensive apps. But be aware, it locks up randomly. The maintainer is looki=
ng=20
for SMP testers 'cause it has something to-do with SMP -> preemption.
My system is stable but lockup from time to time with the page_color module=
=20
loaded during "heavy" C and C++ compilations (~40 processes running in=20
parallel).

Have a nice weekend.

-Dieter

BTW I'm working on Win VFAT disk recovery. Two damaged IBM IC35L060AVER07-0=
=20
costomer disks. One with only a single partition and one with three=20
partitions. Any advice if I should try with dd on the whole disk or every=20
partition?
