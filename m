From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 15:56:04 +0300
Message-ID: <3E5F5C64.7080408@namesys.com>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281439.24760.liviu.voicu@huji.ac.il> <20030228133836.D24291@humilis> <200302281448.20572.liviu.voicu@huji.ac.il>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12992-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302281448.20572.liviu.voicu@huji.ac.il>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Voicu Liviu <liviu.voicu@huji.ac.il>
Cc: ookhoi@humilis.net, reiserfs-list@namesys.com

Voicu Liviu wrote:

>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>OK, so in this mashine I compile kde3.1 and this is the output of the "top" 
>command ( it took me 5 seconds to write top in the command line and another 
>10 antill I saw the output...really slow )
>
>35 processes: 31 sleeping, 4 running, 0 zombie, 0 stopped
>CPU states: 99.4% user,  0.3% system,  0.0% nice,  0.0% iowait,  0.1% idle
>Mem:   255948k av,  250540k used,    5408k free,       0k shrd,   28344k buff
>        59512k active,             119096k inactive
>Swap:  514072k av,     144k used,  513928k free                  122280k 
>cached
>
>  PID USER     PRI  NI  SIZE  RSS SHARE STAT %CPU %MEM   TIME COMMAND
>  889 portage   15 -10 21508  21M  4172 R <  98.9  8.4   0:16 cc1plus
>  890 portage    5 -10  2368 2368   752 S <   0.9  0.9   0:00 as
>  845 liviu     15   0  1100 1100   792 R     0.1  0.4   0:00 top
>    1 root      15   0   484  484   428 S     0.0  0.1   0:05 init
>    2 root      15   0     0    0     0 SW    0.0  0.0   0:00 keventd
>    3 root      34  19     0    0     0 SWN   0.0  0.0   0:00 ksoftirqd_CPU0
>    4 root      15   0     0    0     0 SW    0.0  0.0   0:00 kswapd
>    5 root      15   0     0    0     0 SW    0.0  0.0   0:00 bdflush
>    6 root      15   0     0    0     0 RW    0.0  0.0   0:00 kupdated
>    9 root      15   0     0    0     0 SW    0.0  0.0   0:00 kreiserfsd
>   33 root      15   0   888  888   592 S     0.0  0.3   0:00 devfsd
> 3612 root      15   0   564  564   488 S     0.0  0.2   0:00 metalog
> 3614 root      15   0   460  460   416 S     0.0  0.1   0:00 metalog
> 3729 root      15   0  1252 1252  1128 S     0.0  0.4   0:00 sshd
> 3740 root      15   0   412  412   356 S     0.0  0.1   0:00 agetty
> 3741 root      15   0   412  412   356 S     0.0  0.1   0:00 agetty
> 3742 root      15   0   412  412   356 S     0.0  0.1   0:00 agetty
> 3743 root      15   0   412  412   356 S     0.0  0.1   0:00 agetty
> 3744 root      15   0   412  412   356 S     0.0  0.1   0:00 agetty
> 3745 root      15   0   412  412   356 S     0.0  0.1   0:00 agetty
>12092 root      15   0  1220 1220   836 S     0.0  0.4   0:00 screen
>12093 root      15   0  1316 1316  1044 S     0.0  0.5   0:00 sh
>12099 root      10  -5  5492 5492  1896 S <   0.0  2.1   0:07 python2.2
>31549 portage   10 -10   376  376   312 S <   0.0  0.1   0:00 sandbox
>31550 portage   10 -10  1172 1172   900 S <   0.0  0.4   0:00 ebuild.sh
>31557 portage    5 -10   472  472   396 S <   0.0  0.1   0:00 tee
>31577 liviu     15   0  1316 1316  1060 S     0.0  0.5   0:00 bash
>  300 portage   10 -10   796  796   556 S <   0.0  0.3   0:00 make
>  699 portage   10 -10   832  832   576 S <   0.0  0.3   0:00 make
>  700 portage   10 -10  1052 1052   836 S <   0.0  0.4   0:00 sh
>  701 portage    6 -10  1552 1552   576 S <   0.0  0.6   0:00 make
>  886 portage    6 -10   640  640   440 S <   0.0  0.2   0:00 g++
>-----BEGIN PGP SIGNATURE-----
>Version: GnuPG v1.2.1 (GNU/Linux)
>
>iD8DBQE+X1qUczD4Ii52ssMRAso7AJ0bAlC3YbXjax28nVe9NbI6/+cJ/ACfX9Lx
>O+fZu4gbCPjqSDraeWrYbbk=
>=uWh1
>-----END PGP SIGNATURE-----
>
>
>
>  
>
Voicu, I think you have your nice directions confused, and you want to 
nice your compile to +10 not -10.  Probably Unix should reverse the 
directions, but....

-- 
Hans


