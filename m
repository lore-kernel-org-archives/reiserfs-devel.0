From: Voicu Liviu <liviu.voicu@huji.ac.il>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 15:00:37 +0200
Message-ID: <200302281500.37328.liviu.voicu@huji.ac.il>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281448.20572.liviu.voicu@huji.ac.il> <20030228135605.F24291@humilis>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12995-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030228135605.F24291@humilis>
Content-Description: clearsigned data
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
Cc: ookhoi@humilis.net, reiserfs-list@namesys.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Friday 28 February 2003 14:56, Ookhoi wrote:
> Voicu Liviu wrote (ao):
> > -----BEGIN PGP SIGNED MESSAGE-----
> > Hash: SHA1
> >
> > OK, so in this mashine I compile kde3.1 and this is the output of the
> > "top" command ( it took me 5 seconds to write top in the command line a=
nd
> > another 10 antill I saw the output...really slow )
> >
> > 35 processes: 31 sleeping, 4 running, 0 zombie, 0 stopped
> > CPU states: 99.4% user,  0.3% system,  0.0% nice,  0.0% iowait,  0.1%
> > idle Mem:   255948k av,  250540k used,    5408k free,       0k shrd, =20
> > 28344k buff 59512k active,             119096k inactive
> > Swap:  514072k av,     144k used,  513928k free                  122280k
> > cached
> >
> >   PID USER     PRI  NI  SIZE  RSS SHARE STAT %CPU %MEM   TIME COMMAND
> >   889 portage   15 -10 21508  21M  4172 R <  98.9  8.4   0:16 cc1plus
> >   890 portage    5 -10  2368 2368   752 S <   0.9  0.9   0:00 as
> >   845 liviu     15   0  1100 1100   792 R     0.1  0.4   0:00 top
> >     1 root      15   0   484  484   428 S     0.0  0.1   0:05 init
>
> In your case, there is no reason to renice the compile to -10, as there
> are no other processes which take cpu, and therefore there is nothing to
> gain.

This is CORRECT, but think, could I use XFree while some preccese has nice=
=20
value -10? I don't think so

> I still wonder what could be the reason for the bad response of the
> keyboard.

=2D --=20
Voicu Liviu

Hebrew University of Jerusalem
Rothberg International School
Assistant Programmer & Network Support
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQE+X111czD4Ii52ssMRAswZAJ9eOFo60Z5Jq+h3I6UsFqFFw9KLXACaA75y
Z3ptPsNmKnQW4hJ6lT0ee50=3D
=3Ds/rV
=2D----END PGP SIGNATURE-----

