From: Richard Sharpe <rsharpe@richardsharpe.com>
Subject: Re: Reiserfs with Samba vs NetApp Filer (purely performance)
Date: Sat, 14 Dec 2002 18:09:29 -0800 (PST)
Message-ID: <Pine.LNX.4.33.0212141800290.2681-100000@ns.aus.com>
References: <20021215001126.J2727@vestdata.no>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12166-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021215001126.J2727@vestdata.no>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>
Cc: Hans Reiser <reiser@namesys.com>, darren <teodarren@myrealbox.com>, 'Russell Coker' <bofh@coker.com.au>, reiserfs-list@namesys.com

On Sun, 15 Dec 2002, Ragnar Kj=F8rstad wrote:

> On Sat, Dec 14, 2002 at 02:34:06PM -0800, Richard Sharpe wrote:
> > If those are your choices, then I would rank them:
> >=20
> >   NetApp F870, Linux with ReiserFS and Samba, Win2K
> >=20
> > John Terpstra has done some testing with a modified cifs_bm which confi=
rms=20
> > that Linux with EXT2/3 or ReiserFS outperforms Win2K on the same hardwa=
re.
> >=20
> > However, my testing of the NetApp suggests it will outperform the other=
=20
> > two choices.
>=20
> What kind of benchmarks, and what were the results?

I was using cifs_bm, in both cases. We presented results at CIFS2002, and=20
you can find the papers on the web. Also look for John Terpstra's paper at =

Sambaxp in Germany in April 2002. We tested a bunch of things, but we did=20
not focus on comparative performance. cifs_bm is based around the=20
NetBench-like tests from smbtorture.=20

There is a CIFS benchmarking effort going on as part of SNIA, as well. We=20
are working on something like SPECsfs for CIFS.
=20
> > If you choose to use Samba, you will want to make sure that the sendfil=
e=20
> > stuff is implemented. Unfortunately, the directory indexing in Reiser d=
oes=20
> > not help that much a lot of the time because Samba is forced to do=20
> > directory scans because it has to implement case-independent=20
> > lookups/searches.
>=20
> Isn't that an configuration-option?

Well, yes it is, but if you want to be more like a Windows server, then=20
you need to do it correctly.

> As a sidenote, I think it wouldn't be too hard to make reiserfs
> optionally case-insensitive, but still able to use indexes. Perhaps it
> would even be possible to have two virtual directories pr traditional
> directory? one that has a regular index and one that has a
> case-insensitive index. Of course this is not relevant for the
> right-here right-now choice of fileservers, but....

The namecache is system-wide. So, you will have to do it in the name cache =

code. One of the guys who worked for Quantum seems to have done some mods=20
for XFS for that, and they added a lookup entry in the dcache ops table,=20
it seems. This would allow a loadable file system to hook that entry and=20
provide case independent lookups. There are some curly problems with=20
negative entries. You would also want to make it a process settable=20
feature, esp if you run NFS as well (guess who wants to do that :-)

Finally, if your goal is semantic equivalence with Windows, you will want=20
two indexes in ReiserFS or EXT2/3 with the dirindex stuff anyway, since=20
Windows actually has two name spaces (long names and 8.3 names) and you=20
have to search both name spaces for at least some operations, and to=20
ensure that you do the correct thing in the presence of names that differ=20
only by the case of some characters, you must create 8.3 names on file=20
creation (which is pretty much what NetApp do).

Regards
-----
Richard Sharpe, rsharpe[at]ns.aus.com, rsharpe[at]samba.org,=20
sharpe[at]ethereal.com, http://www.richardsharpe.com

