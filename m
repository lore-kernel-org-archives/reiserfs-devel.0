From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Subject: Re: XFS corruption during power-blackout
Date: Fri, 1 Jul 2005 23:10:06 +0200
Message-ID: <20050701211006.GA13311@wohnheim.fh-wedel.de>
References: <OF23DC8299.F6F2200B-ON88257031.005B3A9B-88257031.00650D8F@us.ibm.com> <42C5A06F.40906@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24911-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <42C5A06F.40906@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: David Masover <ninja@slaphack.com>
Cc: Bryan Henderson <hbryan@us.ibm.com>, Ric Wheeler <ric@emc.com>, Al Boldi <a1426z@gawab.com>, Chris Wedgwood <cw@f00f.org>, linux-fsdevel@vger.kernel.org, linux-xfs@oss.sgi.com, Steve Lord <lord@xfs.org>, 'Nathan Scott' <nathans@sgi.com>, reiserfs-list@namesys.com

On Fri, 1 July 2005 14:58:39 -0500, David Masover wrote:
> Bryan Henderson wrote:
> [...]
> >What you'd really like is to fsync a multi-file unit of work (transactio=
n)=20
> >-- and not just among open files.  You'd like to open, write, and close =

> >1000 files in a single transaction and then commit that transaction, wit=
h=20
> >no syncing due to timers in the meantime.  If you're really greedy, you'=
d=20
> >also ask for complete rollback if the system fails before the commit.
>=20
> Both of these are planned for Reiser4.  Or is it 4.1?

Both are pretty trivial to implement for a tree-based fs like
reiserfs.  Non-trivial is the user interface.  Not sure if sys_reiser
is the answer to that.

J=F6rn

--=20
When people work hard for you for a pat on the back, you've got
to give them that pat.
-- Robert Heinlein
