From: Andi Kleen <ak@suse.de>
Subject: Re: SPAM: Re: XFS corruption during power-blackout
Date: 30 Jun 2005 01:11:03 +0200
Message-ID: <p73irzw3gjc.fsf@verdi.suse.de>
References: <20050629001847.GB850@frodo.suse.lists.linux.kernel>
	<200506290453.HAA14576@raad.intranet.suse.lists.linux.kernel>
	<556815.441dd7d1ebc32b4a80e049e0ddca5d18e872c6e8a722b2aefa7525e9504533049d801014.ANY@taniwha.stupidest.org.suse.lists.linux.kernel>
	<42C2E0BC.8040508@xfs.org.suse.lists.linux.kernel>
	<254889.27725ab660aa106eb6acc07307d71ef1fbd5b6fd366aebef9e2f611750fbcb467e46e8a4.IBX@taniwha.stupidest.org.suse.lists.linux.kernel>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24820-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: ak@suse.de
In-Reply-To: <254889.27725ab660aa106eb6acc07307d71ef1fbd5b6fd366aebef9e2f611750fbcb467e46e8a4.IBX@taniwha.stupidest.org.suse.lists.linux.kernel>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Wedgwood <cw@f00f.org>
Cc: Al Boldi <a1426z@gawab.com>, 'Nathan Scott' <nathans@sgi.com>, linux-xfs@oss.sgi.com, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com

Chris Wedgwood <cw@f00f.org> writes:

> If caching is enabled I still lose data.  Linux does have a concept of
> write barriers but these are presently not implemented for XFS right
> now.

I implemented them some time ago for log writes in XFS. Not for fsync though,
although fsync usually does a log write afterwards so it should work
in practice too. fdatasync might not.

Don't know if the code hasn't bit rotted away and it also was a bit
dumb. It was definitely there at some point.

But then a lot of ATA disks and SCSI don't support barriers. Or at least
the IDE barrier tests fails on several of my machines.

-Andi
