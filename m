From: Pierre Etchemaite <petchema@concept-micro.com>
Subject: Re: reiserfs3, rsync and hardlinks
Date: Sun, 6 Feb 2005 22:55:39 +0100
Message-ID: <20050206225539.0c2d0c10@polo.concept-micro.com>
References: <20050206034102.3956432d@polo.concept-micro.com>
	<42066D9C.8030908@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42066D9C.8030908@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com

Le dim 06 f=E9v 2005 13:18:52 CET, David Masover <ninja@slaphack.com> a =E9=
crit
:

> Go to XFS or Reiser4.  Unless someone is about to correct me, reiserfs3
> still has problems with hash collisions.  The rest of it *should* be
> stable.... ;-)

I read this recently, but never had problems with hash collisions since I
use reiserfs 3 (don't remember the exact time, but probably around '98), as
far as I can tell.

> If it's mission-critical, you probably want XFS -- reiser4 still has at
> least one performance issue to iron out, and it doesn't have the years
> of public testing that XFS does.

I use reiser4 on my home box, it's fine, but I won't use it for that
server... yet, at least.

Because trustiness isn't the only parameter. The problem with either XFS or
Reiser4, is that they're probably more CPU intensive than reiserfs 3, and on
that server that's starting to age, it could be a problem.

So, no solution with reiserfs 3 ?

