From: Ookhoi <ookhoi@humilis.net>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 13:56:05 +0100
Message-ID: <20030228135605.F24291@humilis>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281439.24760.liviu.voicu@huji.ac.il> <20030228133836.D24291@humilis> <200302281448.20572.liviu.voicu@huji.ac.il>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12993-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200302281448.20572.liviu.voicu@huji.ac.il>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Voicu Liviu <liviu.voicu@huji.ac.il>
Cc: ookhoi@humilis.net, reiserfs-list@namesys.com

Voicu Liviu wrote (ao):
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> OK, so in this mashine I compile kde3.1 and this is the output of the "top" 
> command ( it took me 5 seconds to write top in the command line and another 
> 10 antill I saw the output...really slow )
> 
> 35 processes: 31 sleeping, 4 running, 0 zombie, 0 stopped
> CPU states: 99.4% user,  0.3% system,  0.0% nice,  0.0% iowait,  0.1% idle
> Mem:   255948k av,  250540k used,    5408k free,       0k shrd,   28344k buff
>         59512k active,             119096k inactive
> Swap:  514072k av,     144k used,  513928k free                  122280k 
> cached
> 
>   PID USER     PRI  NI  SIZE  RSS SHARE STAT %CPU %MEM   TIME COMMAND
>   889 portage   15 -10 21508  21M  4172 R <  98.9  8.4   0:16 cc1plus
>   890 portage    5 -10  2368 2368   752 S <   0.9  0.9   0:00 as
>   845 liviu     15   0  1100 1100   792 R     0.1  0.4   0:00 top
>     1 root      15   0   484  484   428 S     0.0  0.1   0:05 init

In your case, there is no reason to renice the compile to -10, as there
are no other processes which take cpu, and therefore there is nothing to
gain.

I still wonder what could be the reason for the bad response of the
keyboard.
