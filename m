From: Chris Mason <mason@suse.com>
Subject: Re: v3 logging speedups for 2.6
Date: Mon, 12 Jan 2004 09:57:12 -0500
Message-ID: <1073919431.32706.843.camel@tiny.suse.com>
References: <1071166228.11147.122.camel@tiny.suse.com>
	 <2652990.fVlIM9mB2a@spamfreemail.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16456-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <2652990.fVlIM9mB2a@spamfreemail.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jens Benecke <jens-usenet@spamfreemail.de>
Cc: reiserfs-list@namesys.com

On Mon, 2004-01-12 at 02:07, Jens Benecke wrote:
> Chris Mason wrote:
> 
> > Hello everyone,
> > 
> > This is part one of the data logging port to 2.6, it includes all the
> > cleanups and journal performance fixes.  Basically, it's everything
> > except the data=journal and data=ordered changes.
> > ftp.suse.com/pub/people/mason/patches/data-logging
> experimental/2.6.0-test11
> 
> Hi,
> 
> Does it make sense to apply those to 2.6.1-mm2? 
> 
Not those at least, since I managed to screw up the diff.  I've got a
2.6.1 directory under experimental now with better patches.

I'm checking now to see if they apply to -mm2.

> Does "except the data=ordered changes" mean that data journalling ist _not_
> in there, or that that data journalling is there but hasn't been updated to
> what is there for 2.4.x yet?

Correct, but I'm almost there.  Thing got off track a lot during xmas
break.

-chris

