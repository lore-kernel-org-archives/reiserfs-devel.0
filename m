From: Cyrille Chepelov <cyrille@chepelov.org>
Subject: Re: [ANNOUNCE] new reiser4 snapshot released.
Date: Mon, 29 Mar 2004 07:00:47 +0200
Message-ID: <20040329050047.GB19805@chepelov.org>
References: <16484.24086.167505.94478@laputa.namesys.com> <1080321833.19218.7.camel@localhost.localdomain> <16484.29281.375363.39808@laputa.namesys.com> <40646424.7000407@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-17550-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40646424.7000407@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Hans Reiser <reiser@namesys.com>
Cc: Nikita Danilov <Nikita@Namesys.COM>, Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Le Fri, Mar 26, 2004, =C3=A0 09:11:00AM -0800, Hans Reiser a =E9crit:

> Nikita, would you confirm that the default fibration is to sort all=20
> files with '.' as the penultimate character by their last character=20
> first and then by the rest of the name in the usual lexicographic order? =

> (If that is not the default, then please make it the default.)

Wouldn't it be slightly beneficial to expand this policy to not just
look for extensions matching .*\.(?) but .*\.(.*) as well?

	-- Cyrille, needing some time to dive back into reiser4 testing

--=20
