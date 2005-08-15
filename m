From: michael chang <thenewme91@gmail.com>
Subject: Re: Reiser4 and ACLs
Date: Mon, 15 Aug 2005 19:37:03 -0400
Message-ID: <b14e81f00508151637be3d229@mail.gmail.com>
References: <42FEC9F1.9040709@perkel.com>
	 <b14e81f005081405316a06995c@mail.gmail.com>
	 <17151.17921.996376.693013@gargle.gargle.HOWL>
	 <87k6in5dri.fsf@evinrude.uhoreg.ca>
	 <17152.63727.435377.223362@thebsh.namesys.com>
	 <1124138041.11626.4.camel@localhost>
	 <17152.65201.525419.283987@gargle.gargle.HOWL>
	 <43010157.1030107@perkel.com> <43012440.8020804@slaphack.com>
	 <43012598.7080207@perkel.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25508-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43012598.7080207@perkel.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Marc Perkel <marc@perkel.com>
Cc: reiserfs-list@namesys.com

On 8/15/05, Marc Perkel <marc@perkel.com> wrote:
> It seems to me that getting in the Kernel is the most important thing.

This is because nothing else can happen because no one will know it
exists.  Everything else will happen *as soon as* Reiser4 gets in.=20
Otherwise, it's practically useless.

> Then getting it compatible with existing standards. Then you build up

But then you're basically rewriting ext2 or 3.  There's no point in that.

> the user based (addicts) and then you add the innovative stuff.

You do this first, because it's what sets you appart.  Otherwise,
people won't convert away from EXT2/3.  Priorities first.

> Otherwise people are going to use Ext3 because it has ACLs and Reiser4
> doesn't. That's where I'm at. If it doesn't do ACLs it doesn't work. I
> need acls.

So why fix something that isn't broken?  Just because one person who
uses ACLs doesn't use Reiser4 right away doesn't mean he won't use it
later.  Compare the number of people who use Ubuntu Linux (who won't
support Reiser4 until it's vanilla) and other Vanilla kernels, to the
number of ACL users.  The numbers matter.

> The way I see it - and I may well be missing something - s that the
> current API is just a way of talking to the security layer. So why not
> support multiple ways to talk to it?

There is nothing wrong with this idea.  It's just time consuming.=20
It's not done, yet (for Reiser4).  If someone is willing to pay the
time/sweat or the money to get it done, it will be done.  Otherwise,
it won't.  Simple as that.

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
