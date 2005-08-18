From: Danny <dannydaemonic@gmail.com>
Subject: Re: another warning
Date: Thu, 18 Aug 2005 13:25:14 -0700
Message-ID: <9625752b0508181325433fabb@mail.gmail.com>
References: <9625752b05081802523a45dde6@mail.gmail.com>
	 <43045D7C.6070907@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25562-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43045D7C.6070907@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: Reiserfs-List@namesys.com

Thanks for the reply.  Hope I'm not crying wolf.  Someone was setting
up nfsd, perhaps that caused this.

On 8/18/05, Vladimir V. Saveliev <vs@namesys.com> wrote:
> Hello
>=20
> Danny wrote:
> > A couple days ago I got another warning.  This one sounds more
> > serious, and I'm not low on free space anymore.
> >
> > Aug 16 20:21:18 [kernel] reiser4[mount(16045)]: _init_read_super
> > (fs/reiser4/init_super.c:180)[nikita-2608]:
> > Aug 16 20:21:18 [kernel] WARNING: loop0: wrong master super block magic=
.
> >
> > Bad magic number?  Does that mean something important was overwritten?
> >
>=20
> This looks like it tried to mount loop0 device as reiser4 and the device =
was not formatted as reiser4.
>=20
>
