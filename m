From: Ookhoi <ookhoi@humilis.net>
Subject: Re: Crash again!
Date: Wed, 22 Jan 2003 06:57:12 +0100
Message-ID: <20030122065712.D5575@humilis>
References: <20030118080941.B5575@humilis> <20030118115142.B21932@namesys.com> <20030118100157.C5575@humilis> <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115142.B21932@namesys.com> <20030117221535.GA945@Kadath> <20030118080941.B5575@humilis> <20030118115724.GA946@Kadath> <20030121213336.GA6756@hell.mine.nu>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12451-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030121213336.GA6756@hell.mine.nu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francois-Rene Rideau <fare@tunes.org>
Cc: reiserfs-list@namesys.com

Francois-Rene Rideau wrote (ao):
> After the hardware crash, the software crash!
> 
> I added RAM to my workstation and rebooted.
> Big mistake: I had stopped the machine with swsusp instead of a plain
> halt. By the time I realized it, it was too late.
> swsusp recover failed because the RAM size didn't match.
> Now the reiserfs partition is half-unmounted,
> and trying to mount results in an endless loop
> as reiserfs tries to replay the journal.
> 
> Is the partition recoverable? Can the data be retrieved?
> Should I try reiserfsck or not?

That would be the first thing to try :-)

> Should I try to get swsusp to recover the same state and do its thing,
> or is it too late?

This will not do anything good to your filesystem.

> Should I run to the shop where I sent my previous hardware-crashed
> disk so that they don't actually send the disk back to manufacturer
> for exchange?

A shop will be of no help in this case (or at least here; the shop
people have exactly zero clue; yours could be better though). There is a
very good change that you will be able to solve this yourself. Run the
latest reiserfsck (in this case, I would run the latest -pre, as I
didn't read bad things about it on the list and it is already 7 weeks
old).

Good luck!

PS, in cases like these, I notice a nice warm feeling when I hug my
backups. You should try it too. You might never need them, but then
again, _if_ you need them, they suddenly mean much more to you than you
could have ever thought a bunch of zipped files would do.
