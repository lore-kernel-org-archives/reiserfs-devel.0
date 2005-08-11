From: michael chang <thenewme91@gmail.com>
Subject: Re: Distributions with out-of-the-box Reiser4 support?
Date: Wed, 10 Aug 2005 22:41:08 -0400
Message-ID: <b14e81f005081019411bf1b3e8@mail.gmail.com>
References: <194f6255050810094849b3164e@mail.gmail.com>
	 <b14e81f005081010125d5a6fa4@mail.gmail.com>
	 <42FA6E54.5090200@slaphack.com>
	 <b14e81f00508101434444027d6@mail.gmail.com>
	 <42FA7BB1.1080801@slaphack.com>
	 <b14e81f00508101609627b0636@mail.gmail.com>
	 <42FA9ADF.9050602@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-25401-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42FA9ADF.9050602@slaphack.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

On 8/10/05, David Masover <ninja@slaphack.com> wrote:
> > So, to date, we have yet to see any recently released operating
> > systems with native out-of-the-box root Reiser4 support, it seems...
>=20
> Wasn't there something about yoper?

Yeah, there was, although someone discounted it for being a year old
release... [compared to Debian Sarge, that's pretty new...].

> > *sigh* Oh well... I guess we won't see it until we see it in vanilla
> > kernel and/or when the recompressor and/or resizer are ready... or
> > someone takes an initiative.
>=20
> If I was running a distro, I'd put big fat warnings around a non-default
> option for Reiser4, until the repacker was done.  Then I'd make it the

This is what the Kernel Config does -- so no one will build with it
[they're scared it'll break something].

> default FS, and mark ext3 as "legacy" ;)

Then I'd have to modify the installer and the kernel now.  And again
every time Reiser4 makes a major leap.  [Not to mention I've yet to
see one person singlehandedly do a full distro -- a livecd /maybe/,
but probably not.]  Logically, the maintainers will wait until
something is reasonably stable, and put it in when they're nice and
ready.  *shrugs*  Besides, how many of them are on a release cycle
anyways?  But yeah, ext3 could be marked as legacy.  That said, I'm
not going to go as far as to remove it from my kernel. [What if I want
to put my kernel on a ext2/3 boot partition?]  ^^

--=20
~Mike
 - Just my two cents
 - No man is an island, and no man is unable.
