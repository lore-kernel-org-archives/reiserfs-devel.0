From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: [ANNOUNCE] new reiser4 snapshot released.
Date: Tue, 30 Mar 2004 11:24:12 +0400
Message-ID: <1080631451.16246.106.camel@tribesman.namesys.com>
References: <16484.24086.167505.94478@laputa.namesys.com>
	 <1080321833.19218.7.camel@localhost.localdomain>
	 <16484.29281.375363.39808@laputa.namesys.com>
	 <40646424.7000407@namesys.com> <20040329050047.GB19805@chepelov.org>
	 <40684CAC.3030702@namesys.com>  <20040330050415.GA15017@chepelov.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17589-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040330050415.GA15017@chepelov.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Cyrille Chepelov <cyrille@chepelov.org>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello

On Tue, 2004-03-30 at 09:04, Cyrille Chepelov wrote:
> Le Mon, Mar 29, 2004, =C3  08:19:56AM -0800, Hans Reiser a =E9crit:
>=20
>=20
> > >Wouldn't it be slightly beneficial to expand this policy to not just
> > >look for extensions matching .*\.(?) but .*\.(.*) as well?
>=20
> > I thought about that, but other than compiles I don't know of an=20
> > application that would benefit from this performance wise, and compiles=
=20
> > usually have . as the penultimate character in their fileset filenames.=
 =20
> > I would actually much like to get feedback from others on this.
>=20
> I see. A little question on the importanceness of solving this right up
> front: is it possible to change the fibration policy of a mounted and act=
ive
> file system?

Changing fibration policy applies only to empty directory

>  Does such a change affect the repacker (as in: swapping the
> fibration policy causes the repacker to start shuffling things around
> according to the new policy)?=20

repacker does not get affected

> If that's the case, then I guess there's some
> wiggle room for imperfection...
>=20
> (in fact, on second thought, my request wouldn't necessarily cause the be=
st
> performance to happen. Norton Defrag used to have a "sort by type" option
> ca. 1994, and I remember that on my PC, it didn't give the best
> performance).=20
>=20
> Just out of curiosity, is it possible to create a fibration policy based =
on=20
> atime/mtime/ctime?
>=20
> 	-- Cyrille

