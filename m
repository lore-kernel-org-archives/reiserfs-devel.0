From: Chris Mason <mason@suse.com>
Subject: Re: udpated data logging available
Date: 26 Jun 2003 08:53:47 -0400
Message-ID: <1056632026.20899.39.camel@tiny.suse.com>
References: <1055764071.24111.650.camel@tiny.suse.com>
	 <200306260216.41204.christian.mayrhuber@gmx.net>
	 <1056592066.20899.10.camel@tiny.suse.com>
	 <200306261342.08725.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14711-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306261342.08725.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Dieter =?ISO-8859-1?Q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Cc: Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com

On Thu, 2003-06-26 at 07:42, Dieter N=FCtzel wrote:

> > Great to hear, thanks for giving it a try.  io-stalls-6 helped most when
> > you've got multiple devices and a streaming write to one was slowing
> > down all the others.  -7 added in a tweaked form of Andrea's elevator
> > latency fixes, and they make a big difference when there's a lot of
> > writes to the drive you're trying to read from.
>=20
> So, does it apply to 2.4.21-aa1 (latest is 2.4.21rc8aa1) cleanly? ;-)
>=20

No, io-stalls-7 is mostly in rc8aa1 already.  The major difference is
that andrea changed blk_finished_io and I added a new func to keep
compatibility for external drivers.  There are a few areas where he and
I chose different ways of doing things, if you're interested in helping
add some measurements to our debate, I can make you a patch against aa1.

> > Hopefully we'll be able to hash out something suitable for 2.4.22-pre.
>=20
> 2.4.22-pre1 is out form some days...

Yes.  Almost all my latency testing was done on data logging + the jh-2
patch, so I'm much more confident now in that code.  Hopefully the
merging will start shortly, Oleg has a queue of things he wants to get
in, and we're trying to keep the rate of changes at something
manageable.

(quick clarification, io-stalls-7 is entirely unrelated to reiserfs, I
posted it here because I thought there might be some willing testers ;-)

-chris



