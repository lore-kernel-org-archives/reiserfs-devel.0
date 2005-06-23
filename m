From: "M." <vo.sinh@gmail.com>
Subject: Re: reiser4 plugins
Date: Thu, 23 Jun 2005 23:54:31 +0200
Message-ID: <f0cc385605062314543a25019e@mail.gmail.com>
References: <42BAC304.2060802@slaphack.com>
	 <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl>
	 <20050623221222.33074838.reiser4@blinkenlights.ch>
	 <200506232249.47302.michael.dreher@uni-konstanz.de>
Reply-To: "M." <vo.sinh@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24518-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200506232249.47302.michael.dreher@uni-konstanz.de>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org
Cc: reiserfs-list@namesys.com

I think we are talking about reiser4, not reiser3..

Michele

On 6/23/05, Michael Dreher <michael.dreher@uni-konstanz.de> wrote:
> >>>                                                 Not everyone will wan=
t
> >>> to reformat at once, but as the reiser4 code matures and proves itsel=
f
> >>> (even more than it already has),
> >>
> >> I for one have seen mainly people with wild claims that it will make
> >> their machines much faster, and coming back later asking how they can
> >> recover their thrashed partitions...
> >
> > Then please show us some Links/Message-IDs to such postings.
> > I'd like to read them.
>=20
> Here you are....
>=20
> The following happened to me with reiserfs as it was shipped with
> suse 9.1:
>=20
> ------------------------------------------------------------------
> dreher@euler03:~/mytex/konstanz/wohnung> ls
> auto          makler2.aux  makler2.log  makler2.tex  makler.aux  makler.l=
og
> swk.eps      unilogo.eps
> briefkpf.tex  makler2.dvi  makler2.ps   makler3.tex  makler.dvi  makler.t=
ex
> unikopf.tex
> dreher@euler03:~/mytex/konstanz/wohnung> rm *.aux *.log
> rm: cannot remove `makler2.log': No such file or directory
> dreher@euler03:~/mytex/konstanz/wohnung> ls
> auto  briefkpf.tex  makler2.dvi  makler2.ps  makler2.tex  makler3.tex
> makler.dvi  makler.tex  swk.eps  unikopf.tex  unilogo.eps
> dreher@euler03:~/mytex/konstanz/wohnung> uname -a
> Linux euler03 2.6.5-7.108-smp #1 SMP Wed Aug 25 13:34:40 UTC 2004 i686 i6=
86
> i386 GNU/Linux
> dreher@euler03:~/mytex/konstanz/wohnung> date
> Tue Sep 21 13:15:45 CEST 2004
> ----------------------------------------------------------
>=20
> Note the line "rm: cannot remove `makler2.log': No such file or directory=
"
>=20
> There was no data loss, but such a bug should not happen.
> I never had similar experiences with ext3.
>=20
> Unfortunately, I cannot reproduce this behavior.
>=20
> >  Powerloss, unpluging the Disk while writing, full filesystem,
> >  heavy use : No problems with reiser4.. It *is* stable.
>=20
> My impression: reiser3 is not 100% stable, but quite stable,
> written by someone who asks for "review by benchmark".
>=20
> Michael
> -
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" i=
n
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
