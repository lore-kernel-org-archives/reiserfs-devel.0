From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: dbench regression in 2.6
Date: Mon, 8 Sep 2003 21:05:37 +0400
Message-ID: <200309082105.37309.vs@namesys.com>
References: <3F5636F5.4060000@austin.ibm.com> <200309041138.40795.vs@namesys.com> <3F574AEE.7080402@austin.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15597-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F574AEE.7080402@austin.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Steven Pratt <slpratt@austin.ibm.com>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

Hi

On Thursday 04 September 2003 18:23, Steven Pratt wrote:
> Vladimir Saveliev wrote:
>=20
> >Hi
> >
> >On Wednesday 03 September 2003 23:04, Hans Reiser wrote:
> > =20
> >
> >>Steven Pratt wrote:
> >>
> >>   =20
> >>
> >>>Is anyone looking into the dbench multitheaded regression in 2.6 tha=
t I=20
> >>>reported here a couple of weeks ago?=20
> >>>     =20
> >>>
> >
> >Sorry, I was unable to find your report in mail archives. Could you,=20
please,=20
> >remind what is the problem?
> >
> > I don't see any change in the=20
> > =20
> >
> >>>latest trees.
> >>>
> >>>     =20
> >>>
> The problem showed up in 2.6.0-test1, and every kernel since.  The=20
> problem is that from 2.5.65 (earliest data I have) to 2.5.69 dbench on=20
> reiserfs with 16 clients got a throughput of ~200MB/sec.  In 2.5.70=20
> through 2.5.75 the score went up to ~280MB/sec, a good thing.  But in=20
> 2.6.0-test1 the throughput dropped to below 50 MB/sec.  Since then it=20
> has risen slightly but still at only around 60MB/sec.  Single client=20
> dbench showed similar, although much less dramatic changes.  No other=20
> file system exhibited a change in the 2.6.0-test1 kernel so this seems=20
> to be unique to reiserfs.
>=20
>=20
> >>>     =20
> >>>
>=20
>http://ausgsa.ibm.com/projects/l/ltcperformance/2003benchmarks/regressio=
n/results/history-graphs/dbench.reiser.throughput.plot.16.png
> > =20
> >
> >
> >Is this address right?
> >
> No, my bad.  Right address is=20
>=20
http://ltcperf.ncsa.uiuc.edu/data/history-graphs/dbench.reiser.throughput=
=2Eplot.16.png
> see also
>=20
http://ltcperf.ncsa.uiuc.edu/data/history-graphs/dbench.reiser.throughput=
=2Eplot.1.png
>=20
> Also if you go to
>=20
http://ltcperf.ncsa.uiuc.edu/data/2.6.0-test1/2.5.75-vs-2.6.0-test1/index=
=2Ehtml
> and select the results links related to dbench resierfs you can find=20
> kernel profile, sar data and lots of other system information which may=
=20
> help in isolating the problem.
>=20
> Steve
>=20

Unfortunately, I was unable to reproduce your result. On our test machine=
 (4=20
Xeons 1gb ram) results shown by reiserfs on 2.5.75 and 2.6.0-test1 are=20
comparable.

So, would be you so kind to help us to track this issue? If yes, could yo=
u ,=20
please, describe your test in more details.
0. what is version of dbench you used: 1.2, 1.3 or 2.0?
1. how many time did you run dbench 16?
2. when did you mkfs, etc, did you reboot after mkfs?
3. how much ram does machine which was running dbench have?
4. could you please try to rerun benchmark with SMP=3Doff, and with 2 and=
 4=20
cpus?
5. could you also run dbench 64 and dbench 128 for reiserfs 2.5.75 and=20
2.6.0-test1?

Thanks,
vs




>=20
>=20
>=20

