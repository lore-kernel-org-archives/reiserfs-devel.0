From: Chris Mason <mason@suse.com>
Subject: Re: crash after kernel: clm-6004: convert tail
	failed inode ... error -28
Date: 21 Jun 2002 12:09:33 -0400
Message-ID: <1024675773.13539.6.camel@tiny>
References: <200206211552.g5LFqqc07539@klee.cb.uni-bonn.de> 
	<20020621195906.A1333@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10780-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020621195906.A1333@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Harald van Pee <pee@iskp.uni-bonn.de>, reiserfs-list@namesys.com

On Fri, 2002-06-21 at 11:59, Oleg Drokin wrote:
> Hello!
> 
> On Fri, Jun 21, 2002 at 05:52:52PM +0200, Harald van Pee wrote:
> > capacity availible on this disk. But my jobs don't stop writing and so I got 
> > a lot of clm-6004: convert tail failed messages, 
> > until the kernel the kernel stops working. The last 6 entries in 
> > /var/log/messages 
> > Is this a known problem and does a patch exists?
> 
> Sounds like failed iput journal deadlock.
> Chris Mason have a fix as part of the quota patches.
> He also might have a separate fix for that.

This was fixed in 2.4.19-pre3.  The problem was that I didn't restart
the transaction before freeing the block.

-chris


