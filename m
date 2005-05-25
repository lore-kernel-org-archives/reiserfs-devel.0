From: btinsley <btinsley@gmail.com>
Subject: Re: online fsck
Date: Tue, 24 May 2005 22:02:20 -0500
Message-ID: <263a8b35050524200220eff78b@mail.gmail.com>
References: <263a8b350505231124758be936@mail.gmail.com>
	 <42930542.1000407@namesys.com> <4293B817.5030906@accessplus.com.au>
Reply-To: btinsley <btinsley@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24134-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4293B817.5030906@accessplus.com.au>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

What i'm looking for is a check on a reiserfs filesystem that is
mounted read-write. Many modern filesystems, especially those on NAS
devices, can run periodic background consistency checks on filesystems
with almost zero impact on performance. Some devices are reportedly
running these checks constantly, possibly correcting errors without
user intervention... even a notification to a sysadmin would be a good
feature.


On 5/24/05, marco <marco@accessplus.com.au> wrote:
>=20
>=20
> E.Gryaznova wrote:
>=20
> > Hello.
> > reiserfsck can check reiserfs filesystem mounted read-only.
>=20
> Running 'fsck.reiserfs --check -y </dev/part>' will do the trick.  The
> equivalent for ext3 and other filesystems is
> 'fsck -n </dev/part>', the ext3 version detects that it is mounted rw,
> and does a readonly check.
>=20
> What I wonder is if we can get fsck.reiser[fs,4] to honour option
> processing in a manner more consistant with
> the other fscks, so that adding reiserfs to a list of user choosable
> filesystems is not going to cause a nightmare
> of an overhead of filesystem detection, command option re-mapping and
> other related headaches.....
>=20
> >
> > Thanks,
> > Lena
> >
> > btinsley wrote:
> >
> >> Is there or was there a plan to support running reiserfsck on a
> >> mounted v3 filesystem (just a check, not a fix or rebuild)? I seem to
> >> remember this being mentioned here at some point in time, but I was
> >> unable to find it in the mailing list archive.
> >>
> >> Thanks!
> >>
> >>
> >>
> >>
> >
> >
> >
> >
> >
>=20
> --
>  Marco Grigull  www.accessplus.com.au  AccessPlus Internet Solutions
> Ph +61 7 5451 1146  Fax +61 7 5451 1945 Email marco@accessplus.com.au
>=20
>
