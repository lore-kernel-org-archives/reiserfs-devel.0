From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: [BK] ReiserFS file write bug fix for 2.4
Date: Wed, 11 Sep 2002 21:37:22 +0200
Message-ID: <200209112137.22422.Dieter.Nuetzel@hamburg.de>
References: <3D7F7783.6030804@namesys.com> <200209111934.11373.Dieter.Nuetzel@hamburg.de> <20020911215310.A1504@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-11426-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020911215310.A1504@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Oleg Drokin <green@namesys.com>
Cc: Linux Kernel List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Wednesday 11 September 2002 19:53, Oleg Drokin wrote:
> Hello!
>
> On Wed, Sep 11, 2002 at 07:34:11PM +0200, Dieter N?tzel wrote:
> > On Wednesday 11 September 2002 19:04, Hans Reiser wrote:
> > > Well, at least getting the new file write code into pre6 found this b=
ug
> > > for us....  please apply.
> >
> > What is the "right" way to get the new block allocation going?
>
> use 2.4.19-pre2+ and it is in there ;)

You meant 2.4.20-pre2, didn't you?

> > The mount option (-o alloc=3Dprealloc min=3D4:preallocsize=3D9) only or=
 better
> > a "reformat"?
>
> Those mount options are no longer needed starting from 2.4.20-pre6.
> They are default. Reformat is not needed, but all the blocks allocated by
> old allocator will remain at their old places of course.
>
> Bye,
>     Oleg

--=20
Dieter N=FCtzel
Graduate Student, Computer Science

University of Hamburg
Department of Computer Science
@home: Dieter.Nuetzel at hamburg.de (replace at with @)

