From: michael chang <thenewme91@gmail.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Thu, 1 Sep 2005 10:08:14 -0400
Message-ID: <b14e81f0050901070823982419@mail.gmail.com>
References: <20050901134604.31ddd297@SiRiUS.home>
	 <4316F9CC.2090904@namesys.com> <20050901150507.3d6f53c7@SiRiUS.home>
	 <200509011513.36586.marcel@hilzinger.hu>
	 <20050901151545.5f393cd0@SiRiUS.home>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25790-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050901151545.5f393cd0@SiRiUS.home>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thomas Kuther <gimpel@sonnenkinder.org>
Cc: reiserfs-list@namesys.com

On 9/1/05, Thomas Kuther <gimpel@sonnenkinder.org> wrote:
> On Thu, 1 Sep 2005 15:13:36 +0200
> Marcel Hilzinger <marcel@hilzinger.hu> wrote:
>=20
> > Am Donnerstag, 1. September 2005 15:05 schrieb Thomas Kuther:
> > > On Thu, 01 Sep 2005 16:53:32 +0400
> > >
> > > "Vladimir V. Saveliev" <vs@namesys.com> wrote:
> > > > reiser4 reserves 5% of disk space for its internal needs.
> > >
> > > Ah OK, that computes. So i'll go with reiserfs on that big one (11
> > > GB for internal stuff is too much i have to admit).
> >
> > If I remember well, you can adjust this value in the code.
> >
> aha! OK. now the question would be: what is a good number for reiser4
> to work properly. how much does it need from a 233GB disk? or are the
> 5% chosen 'cause it's the "healthy" value?
>=20

I'd assume it depends on the way the FS is used; sort of like how you
assign the max number of inodes you can have on ext2/3.  I could be
wrong.

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
