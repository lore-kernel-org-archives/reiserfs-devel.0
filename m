From: Dieter =?iso-8859-1?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: udpated data logging available
Date: Thu, 26 Jun 2003 19:19:58 +0200
Message-ID: <200306261919.58508.Dieter.Nuetzel@hamburg.de>
References: <1055764071.24111.650.camel@tiny.suse.com> <200306261342.08725.Dieter.Nuetzel@hamburg.de> <1056632026.20899.39.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-14719-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1056632026.20899.39.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Chris Mason <mason@suse.com>
Cc: Christian Mayrhuber <christian.mayrhuber@gmx.net>, reiserfs-list@namesys.com

Am Donnerstag, 26. Juni 2003 14:53 schrieb Chris Mason:
> On Thu, 2003-06-26 at 07:42, Dieter N=FCtzel wrote:
> > > Great to hear, thanks for giving it a try.  io-stalls-6 helped most
> > > when you've got multiple devices and a streaming write to one was
> > > slowing down all the others.  -7 added in a tweaked form of Andrea's
> > > elevator latency fixes, and they make a big difference when there's a
> > > lot of writes to the drive you're trying to read from.
> >
> > So, does it apply to 2.4.21-aa1 (latest is 2.4.21rc8aa1) cleanly? ;-)
>
> No, io-stalls-7 is mostly in rc8aa1 already.  The major difference is
> that andrea changed blk_finished_io and I added a new func to keep
> compatibility for external drivers.  There are a few areas where he and
> I chose different ways of doing things, if you're interested in helping
> add some measurements to our debate, I can make you a patch against aa1.

Yes, please.
Should I start with rc8aa1 or does Andrea have something newer?

=2DDieter

