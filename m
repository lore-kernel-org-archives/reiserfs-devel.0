From: Voicu Liviu <liviu.voicu@huji.ac.il>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Sat, 1 Mar 2003 20:03:43 +0200
Message-ID: <200303012003.44194.liviu.voicu@huji.ac.il>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <3E5F91BE.5050707@suse.com> <008501c2e008$de05afb0$0302a8c0@karavelov>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-13036-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <008501c2e008$de05afb0$0302a8c0@karavelov>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Saturday 01 March 2003 17:40, Vladimir Karavelov wrote:
> Hi all,
> Does anybody remember that P4 CPUs has a weird thing inside them which
> slows down the CPU when it overheats? P4 at 1.5 GHz was for a very little
> time in the market and as far as I remember it was mainly as tray, not a
> boxed product  (i.e. without original Intel cooler).
> I think you must get a trip to the PC and check cooling.
> Moths ago I had a problem with P4 PC with stopped cooler. Symptoms was
> almost the same.

This is what I'm talking about baby :-)
Now I have converted my Pentium2 300Mhz to ReiserFS and all goes just sweet=
,=20
works like a charm....no matter what value I give to "nice" it doesn't lock=
=20
me out of the box.

>
> Regards
> Vladimir Karavelov
>
> ----- Original Message -----
> From: "Jeff Mahoney" <jeffm@suse.com>
> To: "Voicu Liviu" <liviu.voicu@huji.ac.il>
> Cc: <ookhoi@humilis.net>; <reiserfs-list@namesys.com>
> Sent: Friday, February 28, 2003 6:43 PM
> Subject: Re: ReiserFS causes CPU high usage?!
>
> > Voicu Liviu wrote:
> > > -----BEGIN PGP SIGNED MESSAGE-----
> > > Hash: SHA1
> > >
> > > OK, so in this mashine I compile kde3.1 and this is the output of the
>
> "top"
>
> > > command ( it took me 5 seconds to write top in the command line and
>
> another
>
> > > 10 antill I saw the output...really slow )
> > >
> > > 35 processes: 31 sleeping, 4 running, 0 zombie, 0 stopped
> > > CPU states: 99.4% user,  0.3% system,  0.0% nice,  0.0% iowait,  0.1%
>
> idle
>
> > If ReiserFS were causing your CPU utilization problems, it would look
> > more like this:
> >
> > CPU0 states:  0.5% user, 28.1% system,  0.0% nice, 70.3% idle
> > CPU1 states:  0.3% user, 28.1% system,  0.0% nice, 71.0% idle
> >
> > This is the result when I start a stress.sh -n 50 run, which starts 50
> > processes all copying a directory to a ReiserFS filesystem. [dual p3
> > 733] The numbers vary, but the system number is usually higher than just
> > a few percent.
> >
> > Your system time is only 0.3%, but your user time is 99.4%. It's your
> > userland that's taking all your CPU time. There's a large number of  -10
> > nice'd processes in there: The result is that those processes get
> > scheduler priority, and things that you're looking for interactive
> > response from won't get it.
> >
> > I noticed that someone further down the list mentioned that your
> > slowdown may be sshd not getting enough CPU time. This seems much more
> > likely.
> >
> > To answer your other question about ReiserFS on a p2 300: I have a
> > closet server running with a few hundred GB of ReiserFS filesystems on
> > it, acting as an NFS/Samba server, handling internal web traffic, etc..
> > It's got cycles to spare, and it's only a Celeron 300A.
> >
> > -Jeff
> >
> > > Mem:   255948k av,  250540k used,    5408k free,       0k shrd, =20
> > > 28344k
>
> buff
>
> > >         59512k active,             119096k inactive
> > > Swap:  514072k av,     144k used,  513928k free                =20
> > > 122280k cached
> > >
> > >   PID USER     PRI  NI  SIZE  RSS SHARE STAT %CPU %MEM   TIME COMMAND
> > >   889 portage   15 -10 21508  21M  4172 R <  98.9  8.4   0:16 cc1plus
> > >   890 portage    5 -10  2368 2368   752 S <   0.9  0.9   0:00 as
> > >   845 liviu     15   0  1100 1100   792 R     0.1  0.4   0:00 top
> > >     1 root      15   0   484  484   428 S     0.0  0.1   0:05 init
> > >     2 root      15   0     0    0     0 SW    0.0  0.0   0:00 keventd
> > >     3 root      34  19     0    0     0 SWN   0.0  0.0   0:00
>
> ksoftirqd_CPU0
>
> > >     4 root      15   0     0    0     0 SW    0.0  0.0   0:00 kswapd
> > >     5 root      15   0     0    0     0 SW    0.0  0.0   0:00 bdflush
> > >     6 root      15   0     0    0     0 RW    0.0  0.0   0:00 kupdated
> > >     9 root      15   0     0    0     0 SW    0.0  0.0   0:00
> > > kreiserfsd 33 root      15   0   888  888   592 S     0.0  0.3   0:00
> > > devfsd 3612 root      15   0   564  564   488 S     0.0  0.2   0:00
> > > metalog 3614 root      15   0   460  460   416 S     0.0  0.1   0:00
> > > metalog 3729 root      15   0  1252 1252  1128 S     0.0  0.4   0:00
> > > sshd 3740 root      15   0   412  412   356 S     0.0  0.1   0:00
> > > agetty 3741 root      15   0   412  412   356 S     0.0  0.1   0:00
> > > agetty 3742 root      15   0   412  412   356 S     0.0  0.1   0:00
> > > agetty 3743 root      15   0   412  412   356 S     0.0  0.1   0:00
> > > agetty 3744 root      15   0   412  412   356 S     0.0  0.1   0:00
> > > agetty 3745 root      15   0   412  412   356 S     0.0  0.1   0:00
> > > agetty 12092 root      15   0  1220 1220   836 S     0.0  0.4   0:00
> > > screen 12093 root      15   0  1316 1316  1044 S     0.0  0.5   0:00 =
sh
> > > 12099 root      10  -5  5492 5492  1896 S <   0.0  2.1   0:07 python2=
=2E2
> > > 31549 portage   10 -10   376  376   312 S <   0.0  0.1   0:00 sandbox
> > > 31550 portage   10 -10  1172 1172   900 S <   0.0  0.4   0:00 ebuild.=
sh
> > > 31557 portage    5 -10   472  472   396 S <   0.0  0.1   0:00 tee 315=
77
> > > liviu     15   0  1316 1316  1060 S     0.0  0.5   0:00 bash 300
> > > portage   10 -10   796  796   556 S <   0.0  0.3   0:00 make 699
> > > portage   10 -10   832  832   576 S <   0.0  0.3   0:00 make 700
> > > portage   10 -10  1052 1052   836 S <   0.0  0.4   0:00 sh 701 portag=
e=20
> > >   6 -10  1552 1552   576 S <   0.0  0.6   0:00 make 886 portage    6
> > > -10   640  640   440 S <   0.0  0.2   0:00 g++ -----BEGIN PGP
> > > SIGNATURE-----
> > > Version: GnuPG v1.2.1 (GNU/Linux)
> > >
> > > iD8DBQE+X1qUczD4Ii52ssMRAso7AJ0bAlC3YbXjax28nVe9NbI6/+cJ/ACfX9Lx
> > > O+fZu4gbCPjqSDraeWrYbbk=3D
> > > =3DuWh1
> > > -----END PGP SIGNATURE-----
> >
> > --
> > jeffm@suse.com
> > jeffm@csh.rit.edu

=2D --=20
Voicu Liviu

Hebrew University of Jerusalem
Rothberg International School
Assistant Programmer & Network Support
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+YPX/czD4Ii52ssMRAvTwAJ9ozCwnZOdMnxp48Dnsd1A62dbufwCgo1+M
EnflF/A2X7ZCLg9WiovAb2Y=3D
=3DCCsc
=2D----END PGP SIGNATURE-----

