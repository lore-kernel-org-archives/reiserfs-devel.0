From: Cyrille Chepelov <cyrille@chepelov.org>
Subject: Re: [ANNOUNCE] new reiser4 snapshot released.
Date: Tue, 30 Mar 2004 07:04:15 +0200
Message-ID: <20040330050415.GA15017@chepelov.org>
References: <16484.24086.167505.94478@laputa.namesys.com> <1080321833.19218.7.camel@localhost.localdomain> <16484.29281.375363.39808@laputa.namesys.com> <40646424.7000407@namesys.com> <20040329050047.GB19805@chepelov.org> <40684CAC.3030702@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17588-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40684CAC.3030702@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>
Cc: Nikita Danilov <Nikita@Namesys.COM>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Le Mon, Mar 29, 2004, =C3=A0 08:19:56AM -0800, Hans Reiser a =E9crit:


> >Wouldn't it be slightly beneficial to expand this policy to not just
> >look for extensions matching .*\.(?) but .*\.(.*) as well?

> I thought about that, but other than compiles I don't know of an=20
> application that would benefit from this performance wise, and compiles=20
> usually have . as the penultimate character in their fileset filenames.  =

> I would actually much like to get feedback from others on this.

I see. A little question on the importanceness of solving this right up
front: is it possible to change the fibration policy of a mounted and active
file system? Does such a change affect the repacker (as in: swapping the
fibration policy causes the repacker to start shuffling things around
according to the new policy)? If that's the case, then I guess there's some
wiggle room for imperfection...

(in fact, on second thought, my request wouldn't necessarily cause the best
performance to happen. Norton Defrag used to have a "sort by type" option
ca. 1994, and I remember that on my PC, it didn't give the best
performance).=20

Just out of curiosity, is it possible to create a fibration policy based on=
=20
atime/mtime/ctime?

	-- Cyrille

--=20
