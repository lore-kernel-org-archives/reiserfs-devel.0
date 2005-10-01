From: michael chang <thenewme91@gmail.com>
Subject: Re: Trouble with reiserfs.
Date: Sat, 1 Oct 2005 14:10:55 -0400
Message-ID: <b14e81f00510011110x1153eeaah550eab25233e7910@mail.gmail.com>
References: <f28212bb0509301357i58986a3em52525c99d8cfb53d@mail.gmail.com>
	 <b14e81f00509301433j64e1e88cgf7cc395cab99869@mail.gmail.com>
	 <f28212bb0510010108j3b2f6aa3y2174bdb7756e6fac@mail.gmail.com>
Reply-To: michael chang <thenewme91@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26369-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <f28212bb0510010108j3b2f6aa3y2174bdb7756e6fac@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jonson Player <jonsonplayer@gmail.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Where is the image located?

Also, reiserfs 3 or resier4?

On 10/1/05, Jonson Player <jonsonplayer@gmail.com> wrote:
> Hello Mike,
> is a file image (e.g. hard1.img) and is exactly equal size like broken ha=
rd
> drive aprox. 20GB, and also is same FS (reiserfs).
>
> Thank you.
>
>
> On 10/1/05, michael chang <thenewme91@gmail.com> wrote:
> > On 9/30/05, Jonson Player <jonsonplayer@gmail.com> wrote:
> > >  i just made an img copy with dd_rescue from a broken software raid
> system
> > > (mirror style). I obtained an img from one of hard drive and i wanted=
 to
> > > check this img with reiserfs tool, but he told me the following messa=
ge:
> >
> > >  0%Not enough allocable blocks, checking bitmap...there are 0 allocab=
le
> > > blocks, btw
> > >
> > >  out of disk space
> > >  Aborted
> >
> > Are you checking from a read-write medium (HD) or are you checking an
> > image on e.g. a read-only medium such as a CD/DVD?  Also, is the image
> > bigger than the original partition, or exactly the same size, or
> > smaller (and same for FS size compared to image size).
> >
> > --
> > ~Mike
> > - Just my two cents
> > - No man is an island, and no man is unable.
> >
>
>


--
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
