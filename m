From: Jeremy West <jkwest@gmail.com>
Subject: Re: reiser4 and reiserfs co-existence?
Date: Tue, 9 Nov 2004 13:08:14 -0500
Message-ID: <b28a88610411091008d18868f@mail.gmail.com>
References: <b28a886104110808555d3f59dc@mail.gmail.com>
	 <1099933755.13138.4.camel@localhost>
	 <b28a886104110823161fe3a30d@mail.gmail.com>
	 <1099997754.1373.72.camel@tribesman.namesys.com>
	 <b28a886104110907416476fb50@mail.gmail.com>
	 <662c77ee04110909473d0f6dd3@mail.gmail.com>
	 <b28a886104110909531ee7d29a@mail.gmail.com>
	 <20041109175753.GE26192@nysv.org>
Reply-To: Jeremy West <jkwest@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22330-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041109175753.GE26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Reiserfs Mailinglist <reiserfs-list@namesys.com>

I've enabled all the reiser4 debugging options (assertions, dirtying,
memory copying, node consistency, node zeroing, tracing, log events,
statistics, and printing)


On Tue, 9 Nov 2004 19:57:54 +0200, Markus T=F6rnqvist <mjt@nysv.org> wrote:
> On Tue, Nov 09, 2004 at 12:53:41PM -0500, Jeremy West wrote:
> >Funny thing is I did what you suggested, enabling all the debugging,
> >but it still freezes.  Not immediately, but it still hangs.  First I
> >get a segfault on any command I type into the console.  After 10 secs
> >or so of this, It will freeze up.  How in the world did you save that
> >stack trace.  I've seen the same thing on my machine, but can't figure
> >out how to save it, because my filesystem doesn't respond.
>=20
> Exactly which debug options?
>=20
> --
> mjt
>=20
>=20


--=20
Jeremy West
//---------------------------
"I had a life once... now I have a computer and DSL"
