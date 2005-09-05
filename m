From: michael chang <thenewme91@gmail.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Mon, 5 Sep 2005 08:16:16 -0400
Message-ID: <b14e81f005090505162a15723a@mail.gmail.com>
References: <4317FD1B.504@namesys.com>
	 <Pine.GSO.4.44L.0509021620380.23379-100000@unix2.cc.ksu.edu>
	 <b14e81f005090318046ee67d7e@mail.gmail.com>
	 <431A5E43.4060005@slaphack.com> <431A6E71.4060105@namesys.com>
	 <194f6255050904022932ca34ea@mail.gmail.com>
	 <431B23ED.7070505@slaphack.com>
Reply-To: thenewme91@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25863-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <431B23ED.7070505@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: linuxhippy@gmail.com, reiserfs-list@namesys.com

On 9/4/05, David Masover <ninja@slaphack.com> wrote:
> Clemens Eisserer wrote:
> > Well, it sounds a bit like a microsoft manager explaining why XP-Home
> > has no terminal server features ;-)
> >
> > I think an mkfs-option would be best, with a warning if the value
> > given by the user is nonsence (3-8% ok?).
>=20
> Is there a reason we need to specify this at mkfs time?  What about a
> mount option?

When maybe we'd need to change the metadata.  Even in ext2/3 you can
only modify this by "tuning" the fs.

> >>This is a bit arrogant, but I believe that a user that does not know ho=
w
> >>to recompile the kernel with the #define changed is not sophisticated
> >>enough to know how much he is going to hurt his performance by going
> >>from 95% to 99% space used, and a user who does not want to bother with
> >>recompiling is not going to study the topic enough to realize he is
> >>making a mistake 80% of the time.  It is important to know when
> >>designing a product when your users intuitions are going to be wrong
> >>80%of the time, and while one should always be slow to reach such a
> >>conclusion, I think this is such a case.

I agree here, and anyone who disagrees is either weird, or lacks
common sense.  The arrogance is just part of your personality, Hans,
it's nothing to worry about.  We know not to take it as an insult. :P

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
