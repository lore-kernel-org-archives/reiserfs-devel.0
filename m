From: Edward Shishkin <edward@namesys.com>
Subject: Re: reiserfs for bkbits.net?
Date: Wed, 11 Feb 2004 19:44:23 +0300
Sender: edward
Message-ID: <402A5BE7.583D9D68@namesys.com>
References: <200402111523.i1BFNnOq020225@work.bitmover.com> <20040211161358.GA11564@favonius>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16761-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sander@humilis.net, Larry McVoy <lm@bitmover.com>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Sander wrote:
> 
> Larry McVoy wrote (ao):
> > We're moving openlogging back to our offices and I'm experimenting
> > with filesystems to see what gives the best performance for BK usage.
> > Reiserfs looks pretty good and I'm wondering if anyone knows any
> > reasons that we shouldn't use it for bkbits.net. Also, would it help
> > if the journal was on a different disk?

Not much if you mean performance: here is results for standard journal vs
journal relocated to NVRAM, everything in data logging journal mode:
http://thebsh.namesys.com/benchmarks/journal_relocation_to_NVRAM.html
Edward.

 Most of the bkbits traffic is
> > read so I doubt it.
> >
> > Please cc me, I'm not on the list.
> 
> I've cc'ed the Reiserfs mailinglist.
> 
> IME Reiserfs is a fast and stable fs. If you have the time to benchmark
> ext3, reiserfs, jfs and xfs (and ..) with bk then you would know first
> hand which fs is best for you. It might be worth the time.
> 
> With kind regards, Sander
> 
> --
> Humilis IT Services and Solutions
> http://www.humilis.net
