From: Francesco Biscani <frbiscani@jumpy.it>
Subject: Re: reiser4 crash
Date: Mon, 26 Jul 2004 17:03:56 +0200
Message-ID: <200407261703.56278.frbiscani@jumpy.it>
References: <200407241827.54674.frbiscani@jumpy.it> <20040725074108.GR4990@nysv.org> <200407252137.26653.frbiscani@jumpy.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19816-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407252137.26653.frbiscani@jumpy.it>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com
Cc: Markus =?iso-8859-1?q?T=F6rnqvist?= <mjt@nysv.org>

On Sunday 25 July 2004 21:37, Francesco Biscani wrote:
> On Sunday 25 July 2004 09:41, Markus T=F6rnqvist wrote:
> > On Sat, Jul 24, 2004 at 06:27:54PM +0200, Francesco Biscani wrote:
> > >Hope this is useful. I'll be glad to give more details is asked to.
> > >Regards,
> >
> > Try patching in
> > http://mjt.nysv.org/reiser/log-write-readpage-releasepage-2.diff.gz
> >
> > Then recompile the kernel with debugging and assertions (printing was
> > iirc not required) turned on and try to reproduce it.
>
> Well, I'll try to do something but it'll be difficult. On the laptop I ha=
ve
> reiser4 on /, and I cannot afford to break it. I could try on the
> workstation at home where I have a test partition for reiser4, but I'll be
> away until the next weekend. Maybe some other Gentoo user could help
> (Redeeman are you listening? :))
>


Mmmhh.. I was think that the bug could pop up also by just installing the=20
binary version of openoffice. I did not see any strange command in the ebui=
ld=20
and I've never had problems with emerge+reiser4 before. Is anyone brave=20
enough to try that?
