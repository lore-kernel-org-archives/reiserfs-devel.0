From: <system_lists@nullzone.org>
Subject: RE: reiser4 data journalling?
Date: Fri, 29 Aug 2003 23:56:23 +0200
Message-ID: <008201c36e78$63425bd0$0202a8c0@main>
References: <3F4FC8FD.1050303@namesys.com>
Reply-To: <system_lists@nullzone.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-15500-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F4FC8FD.1050303@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'Reiserfs List' <reiserfs-list@namesys.com>


> -----Mensaje original-----
> De: Hans Reiser [mailto:reiser@namesys.com]
> Enviado el: viernes, 29 de agosto de 2003 23:43
> Para: Nikita Danilov
> CC: Oleg Drokin; Mike Fedyk; Tom Vier; Reiserfs List
> Asunto: Re: reiser4 data journalling?
>=20
> Nikita Danilov wrote:
>=20
> >Hans Reiser writes:
> > > Oleg Drokin wrote:
> > >
> > > >Hello!
> > > >
> > > >On Thu, Aug 28, 2003 at 06:23:22PM -0700, Mike Fedyk wrote:
> > > >
> > > >
> > > >
> > > >>So you can have one 5k memory area that spans two pages, and it =
will
> act on
> > > >>them atomically?  Or does that mean that the utils are already =
page
> aligned
> > > >>by other kernel mechanisims?  Or that they'll have to use the =
reiser
> API to
> > > >>do some of the above (other than the op grouping)?
> > > >>
> > > >>
> > > >
> > > >Data does not need to be page aligned for atomic operations.
> > > >
> > > >Bye,
> > > >    Oleg
> > > >
> > > >
> > > >
> > > >
> > > in reiser4
> >
> >Why?
> >
> >
> >
> Because atomicity in ext3 basically consists of guaranteeing that the
> filesystem is consistent, and due to the disk drive implementation 4k
> blocks are written atomically.  So, if you span more than one block, =
it is
> not guaranteed to be atomic.
>=20
> Someone should correct me if I got it wrong, as ext3 is not my
> specialty....
>=20

I think that is right.


