From: Chris Mason <mason@suse.com>
Subject: Re: mongo_copy: cp: cannot stat `/mnt/testfs/testdir0-0-0/f92':
	Input/output error
Date: Thu, 05 Aug 2004 09:38:29 -0400
Message-ID: <1091711734.22138.19.camel@watt.suse.com>
References: <20040804065840.17C7915C7C@mail03.powweb.com>
	 <4110A0FA.3030007@namesys.com> <4110A38E.6070905@namesys.com>
	 <4110A561.9050200@namesys.com> <4110DBD6.7010904@namesys.com>
	 <20040804183801.GU1284@nysv.org>  <41115962.1030407@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-20021-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41115962.1030407@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>
Cc: Markus =?ISO-8859-1?Q?T=F6rnqvist?= <mjt@nysv.org>, "Vladimir V. Saveliev" <vs@namesys.com>, David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

On Wed, 2004-08-04 at 17:47, Hans Reiser wrote:
> Markus T=F6rnqvist wrote:
>=20
> >On Wed, Aug 04, 2004 at 04:51:34PM +0400, Vladimir V. Saveliev wrote:
> > =20
> >
> >>>If it is due to 4k stacks,
> >>>     =20
> >>>
> >>No, I do not think it is.
> >>   =20
> >>
> >
> > =20
> >
> >>reiser4 now refuses to compile if 4k stack is on.
> >>   =20
> >>
> >
> >WTF, Redeeman at least runs Reiser4 with 4k stacks...
> >
> >What's this about?
> >
> > =20
> >
> V4 likes stack.  If someone can convince me that kmalloc is as efficient =

> as stack, I'd like to hear it, because I know I lack expertise on the top=
ic.

The FS lives in a universe where it shares the computer with other
components.  Using kmalloc allows it to share better, improving the
performance of the system as a whole instead of hogging resources,
especially low memory resources on 32 bit systems.

So, it's likely the switch to kmalloc would increase your overall cpu
usage (very) slightly, and unlikely this switch will be detectable on io
bound workloads.  If it is detectable, then it's a reason to fix
kmalloc, not a reason to avoid it ;-)

-chris


