From: Dieter =?iso-8859-15?q?N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: udpated data logging available
Date: Thu, 26 Jun 2003 13:42:08 +0200
Message-ID: <200306261342.08725.Dieter.Nuetzel@hamburg.de>
References: <1055764071.24111.650.camel@tiny.suse.com> <200306260216.41204.christian.mayrhuber@gmx.net> <1056592066.20899.10.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14705-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1056592066.20899.10.camel@tiny.suse.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Chris Mason <mason@suse.com>, Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

Am Donnerstag, 26. Juni 2003 03:47 schrieb Chris Mason:
> On Wed, 2003-06-25 at 20:16, Christian Mayrhuber wrote:
> > Am Mittwoch, 25. Juni 2003 21:15 schrieb Chris Mason:
> > > Thanks for giving things a try.  I just uploaded io-stalls-7.diff,
> > > which should do better at fixing latency during heavy io.
> > >
> > > -chris
> >
> > My feeling is that io-stalls-6 is where standard 2.4.21 was if it comes
> > down to latency. But io-stalls-7 makes a big improvement for me during
> > heavy io. The directory listing in Konqueror, including image preview,
> > appears nearly immedeately even during heavy io.
>
> Great to hear, thanks for giving it a try.  io-stalls-6 helped most when
> you've got multiple devices and a streaming write to one was slowing
> down all the others.  -7 added in a tweaked form of Andrea's elevator
> latency fixes, and they make a big difference when there's a lot of
> writes to the drive you're trying to read from.

So, does it apply to 2.4.21-aa1 (latest is 2.4.21rc8aa1) cleanly? ;-)

Setting HZ=1000 (from 100) in linux/include/asm/param.h give me very 
impressive latency boost. 2.4.21-rc1-jam1 (-rc1aa1)
Would you have some latencytest0.42-png numbers?

But ACPI will not shut down my SMP system (same with HZ=100) most of the time. 
I had it accidentally set to HZ=1024 and it power down all the time...;-)

> Hopefully we'll be able to hash out something suitable for 2.4.22-pre.

2.4.22-pre1 is out form some days...

Regards,
	Dieter

