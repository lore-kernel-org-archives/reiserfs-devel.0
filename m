From: michael chang <thenewme91@gmail.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Tue, 6 Sep 2005 16:32:54 -0400
Message-ID: <b14e81f0050906133278ca728e@mail.gmail.com>
References: <4317FD1B.504@namesys.com>
	 <Pine.GSO.4.44L.0509021620380.23379-100000@unix2.cc.ksu.edu>
	 <b14e81f005090318046ee67d7e@mail.gmail.com>
	 <431A5E43.4060005@slaphack.com> <431A6E71.4060105@namesys.com>
	 <20050906135951.GA12333@zero>
Reply-To: thenewme91@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25879-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050906135951.GA12333@zero>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tom Vier <tmv@comcast.net>
Cc: reiserfs-list@namesys.com, Hans Reiser <reiser@namesys.com>

On 9/6/05, Tom Vier <tmv@comcast.net> wrote:
> On Sat, Sep 03, 2005 at 08:48:01PM -0700, Hans Reiser wrote:
> > This is a bit arrogant, but I believe that a user that does not know ho=
w
> > to recompile the kernel with the #define changed is not sophisticated
>=20
> I think it's pretty inconvenient to have to change that and rebuild the
> kernel (possibly voiding a vendor's warrenty) just to change the reserve =
%.
> ext2/3 has always had it tunable. As long as a reasonable % is chosen, fe=
w
> will bother to change it. What if your file server is almost full, but yo=
u
> can't get funding for more drives for a couple months? You have to rebuil=
d
> your kernel if you just want to use another 2%?
>=20
> Rebuilding a kernel is no big deal for me, but it is for others, and not
> just because of lack of ability. I'm sure there are situations where you
> can't just plop in a new kernel (company security policies, support
> contracts, etc), no matter how easy it is to build.
>=20
>=20
> My vote: put the reserve % in the superblock (if it isn't already) and
> give mkfs a sane default.
>=20

Okay, this sounds sane, but at the same time, from a implementational
point of view, how do you tell which blocks are reserved and which
arent?

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
