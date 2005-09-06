From: michael chang <thenewme91@gmail.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Tue, 6 Sep 2005 16:41:43 -0400
Message-ID: <b14e81f0050906134132591dde@mail.gmail.com>
References: <4317FD1B.504@namesys.com>
	 <Pine.GSO.4.44L.0509021620380.23379-100000@unix2.cc.ksu.edu>
	 <b14e81f005090318046ee67d7e@mail.gmail.com>
	 <431A5E43.4060005@slaphack.com> <431A6E71.4060105@namesys.com>
	 <20050906135951.GA12333@zero>
	 <e692861c0509061336530f30a@mail.gmail.com>
Reply-To: thenewme91@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25882-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <e692861c0509061336530f30a@mail.gmail.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: gmaxwell@gmail.com
Cc: Tom Vier <tmv@comcast.net>, reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>

On 9/6/05, Gregory Maxwell <gmaxwell@gmail.com> wrote:
> On 9/6/05, Tom Vier <tmv@comcast.net> wrote:
> > My vote: put the reserve % in the superblock (if it isn't already) and
> > give mkfs a sane default.
>=20
> Looking at the code it appears it would be easier to make it a mount
> option that defaults to 5%. Would that work okay for you?
>=20

I dunno about him, but I think it's okay -- provided that it doesn't
screw up too bad.  That said, more people are likely to fiddle with
/etc/fstab than with fstune options... but that's an opinion.  Either
way, it would likely be good to mark it as a potentially dangerous or
performance-deterring thing.  And you don't want to reduce it so much
that there's no room for metadata or space to write in order to delete
if full.

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
