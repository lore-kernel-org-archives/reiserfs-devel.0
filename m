From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: Comparison of notail and notail,iicache(14)  2.4.19-pre7
Date: Fri, 26 Apr 2002 18:45:45 +0200
Message-ID: <200204261845.45178.Dieter.Nuetzel@hamburg.de>
References: <200204260657.32516.Dieter.Nuetzel@hamburg.de> <3CC93CF4.AEC9C69@yura.polnet.botik.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-10188-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <3CC93CF4.AEC9C69@yura.polnet.botik.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "Yury Yu. Rupasov" <yura@yura.polnet.botik.ru>
Cc: Manuel Krause <manuel.krause@mb.tu-ilmenau.de>, ReiserFS List <reiserfs-list@namesys.com>

On Friday 26 April 2002 13:41, Yury Yu. Rupasov wrote:
> Dieter N=FCtzel wrote:
> > Manuel Krause wrote:
> >
> > [-]
> >
> > > What's really unclear is the problem with my
> > > failing Netscape files on the living iicache-mounted FS...
> >
> > I had one outlier with iicache-new-13 here, too.
> >
> > /etc/cups/ppds.dat
> >
> > couldn't be accessed. I reported back but got no response.

[-]

> > Next thing could be linux-2.4.19p6-compound-speedup.patch.
> > Any version for -pre7 ready?
>
> This patch should work with linux-2.4.19-pre7 as well.

Yes, Yura.
I tried it today and got one rejection with preempt+lock-break.
fs/reiserfs/journal.c.rej

***************
*** 576,592 ****
  /* lock the current transaction */
  inline static void lock_journal(struct super_block *p_s_sb) {
    PROC_INFO_INC( p_s_sb, journal.lock_journal );
-   while(atomic_read(&(SB_JOURNAL(p_s_sb)->j_wlock)) > 0) {
-     PROC_INFO_INC( p_s_sb, journal.lock_journal_wait );
-     sleep_on(&(SB_JOURNAL(p_s_sb)->j_wait)) ;
-   }
-   atomic_set(&(SB_JOURNAL(p_s_sb)->j_wlock), 1) ;
  }
 =20
  /* unlock the current transaction */
  inline static void unlock_journal(struct super_block *p_s_sb) {
-   atomic_dec(&(SB_JOURNAL(p_s_sb)->j_wlock)) ;
-   wake_up(&(SB_JOURNAL(p_s_sb)->j_wait)) ;
  }
 =20
  /*
--- 579,590 ----
  /* lock the current transaction */
  inline static void lock_journal(struct super_block *p_s_sb) {
    PROC_INFO_INC( p_s_sb, journal.lock_journal );
+   down(&SB_JOURNAL(p_s_sb)->j_lock);
  }
 =20
  /* unlock the current transaction */
  inline static void unlock_journal(struct super_block *p_s_sb) {
+   up(&SB_JOURNAL(p_s_sb)->j_lock);
  }
 =20
  /*

Had that before but Chris and Oleg gave me advice.
I tried it this way:

/* lock the current transaction */
inline static void lock_journal(struct super_block *p_s_sb) {
  PROC_INFO_INC( p_s_sb, journal.lock_journal );
  debug_lock_break(1);
  conditional_schedule();
  down(&SB_JOURNAL(p_s_sb)->j_lock);
}

/* unlock the current transaction */
inline static void unlock_journal(struct super_block *p_s_sb) {
  up(&SB_JOURNAL(p_s_sb)->j_lock);
}

But then it seems to be _NOT_ preempt (+lock-break) save.
System lock up (nothing in the logs, SysRq key didn't work) during=20
latencytest0.42-png write test. Read test worked.

Thanks,
	Dieter
