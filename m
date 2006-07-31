From: Sarath Menon <sarathmenon@gmail.com>
Subject: Re: metadata plugins (was Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion)
Date: Tue, 1 Aug 2006 03:35:07 +0530
Message-ID: <200608010335.07308.sarathmenon@gmail.com>
References: <200607281402.k6SE245v004715@laptop13.inf.utfsm.cl> <44CE286F.6000700@slaphack.com> <op.tdj9mnrnd4os1z@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29342-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <op.tdj9mnrnd4os1z@localhost>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: =?iso-8859-2?q?=A3ukasz_Mierzwa?= <prymitive@pcserwis.net>

On Monday 31 July 2006 21:35, =A3ukasz Mierzwa wrote:
> I gues that extens are much harder to reuse then normal inodes so when You
> have something as big as portage tree filled with nano files wich are
> being modified all the time then You just can't keep performance all the
> time. You can always tar, rm -fr /usr/portage, untar and You will probably
> speed things up a lot.

I agree here. On my home system this gave me a visible improvement in the s=
ync=20
process. I blew up my portage tree and I rebuilt it, and it gave me around=
=20
~10% improvement -  this was around 6 months ago. I am not all that greedy,=
=20
so i didn't do this do this than once :-)

Sarath
