From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 14:10:37 +0100
Message-ID: <200302281410.37562.Dieter.Nuetzel@hamburg.de>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <20030228135605.F24291@humilis> <200302281500.37328.liviu.voicu@huji.ac.il>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13004-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302281500.37328.liviu.voicu@huji.ac.il>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Voicu Liviu <liviu.voicu@huji.ac.il>
Cc: ookhoi@humilis.net, reiserfs-list@namesys.com

Am Freitag, 28. Februar 2003 14:00 schrieb Voicu Liviu:
> On Friday 28 February 2003 14:56, Ookhoi wrote:
> > Voicu Liviu wrote (ao):
> > > -----BEGIN PGP SIGNED MESSAGE-----
> > > Hash: SHA1
> > >
> > > OK, so in this mashine I compile kde3.1 and this is the output of the
> > > "top" command ( it took me 5 seconds to write top in the command line
> > > and another 10 antill I saw the output...really slow )
> > >
> > > 35 processes: 31 sleeping, 4 running, 0 zombie, 0 stopped
> > > CPU states: 99.4% user,  0.3% system,  0.0% nice,  0.0% iowait,  0.1%
> > > idle Mem:   255948k av,  250540k used,    5408k free,       0k shrd,
> > > 28344k buff 59512k active,             119096k inactive
> > > Swap:  514072k av,     144k used,  513928k free                =20
> > > 122280k cached
> > >
> > >   PID USER     PRI  NI  SIZE  RSS SHARE STAT %CPU %MEM   TIME COMMAND
> > >   889 portage   15 -10 21508  21M  4172 R <  98.9  8.4   0:16 cc1plus
> > >   890 portage    5 -10  2368 2368   752 S <   0.9  0.9   0:00 as
> > >   845 liviu     15   0  1100 1100   792 R     0.1  0.4   0:00 top
> > >     1 root      15   0   484  484   428 S     0.0  0.1   0:05 init
> >
> > In your case, there is no reason to renice the compile to -10, as there
> > are no other processes which take cpu, and therefore there is nothing to
> > gain.
>
> This is CORRECT, but think, could I use XFree while some preccese has nice
> value -10? I don't think so
>
> > I still wonder what could be the reason for the bad response of the
> > keyboard.

This has _nothing_ todo with ReiserFS.
Use kernel preemption and low latency.
Read all you can about it on l-K and try the usual Internet search engines.
Maybe you can "nice" X to "-16" with the latest O(1) scheduler to get bette=
r=20
responce. Your GCC (-10) thing is all _WRONG_. It should be "+10" or maybe=
=20
"+19" the max value like I do regularly with my heavy C/C++ compiler runs.
I can run 2 times 20 or more compiler runs in parallel on my former single =
1.0=20
GHz Athlon and now my dual Athlon MP 1900+.

Run your compiler liek this:

nice +19 make -j20.

 14:09:49  up 16 min,  1 user,  load average: 19,99, 6,00, 2,77
190 processes: 152 sleeping, 38 running, 0 zombie, 0 stopped
CPU0 states:  96,3% user   3,2% system   95,4% nice   0,0% iowait   0,0% id=
le
CPU1 states:  96,0% user   3,2% system   92,2% nice   0,0% iowait   0,0% id=
le
Mem:  1033372k av,  700216k used,  333156k free,       0k shrd,   55956k bu=
ff
        97768k active,             109132k inactive
Swap: 1028120k av,       0k used, 1028120k free                  150408k=20
cached

  PID USER     PRI  NI  SIZE  RSS SHARE WCHAN     STAT %CPU %MEM   TIME=20
COMMAND
 6540 nuetzel   39  19 20092  19M  2232           R N   8,7  1,9   0:01=20
cc1plus
 6544 nuetzel   39  19 19972  19M  2256           R N   8,7  1,9   0:01=20
cc1plus
 6697 nuetzel   39  19  8564 8564  1816           R N   8,7  0,8   0:01 cc1
 6528 nuetzel   39  19 12820  12M  2260           R N   8,5  1,2   0:01=20
cc1plus
 6536 nuetzel   39  19 22520  21M  2252           R N   8,5  2,1   0:01=20
cc1plus
 6567 nuetzel   39  19 22004  21M  2236           R N   8,5  2,1   0:01=20
cc1plus
 6830 nuetzel   39  19  7684 7684  1812           R N   8,5  0,7   0:00 cc1

Regards,
	Dieter

=2D-=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)

