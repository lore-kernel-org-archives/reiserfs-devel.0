From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Problem with the latest auto snapshot
Date: Tue, 15 Jun 2004 08:34:32 +0400
Message-ID: <20040615043432.GV8091@backtop.namesys.com>
References: <200406122131.25974.henning-04@die.informatik.uni-siegen.de> <20040614182215.GT8091@backtop.namesys.com> <200406150055.50380.henning-04@die.informatik.uni-siegen.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19190-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200406150055.50380.henning-04@die.informatik.uni-siegen.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Cc: reiserfs-list@namesys.com

On Tue, Jun 15, 2004 at 12:55:50AM +0200, Henning Westerholt wrote:
> Am Montag, 14. Juni 2004 20:22 schrieb Alex Zarochentsev:
> > On Sat, Jun 12, 2004 at 09:31:25PM +0200, Henning Westerholt wrote:
> > Thanks for the report.
> >
> > do you use SMP, RAID, LVM ?
> 
> No.
> 
> > > After some few disk operation a process try to access some data on the 
> > > partition, and hung forever. I got the following log entries:
> 
> > Were there reiser4 messages in the log before "[nikita-2219]... Failed to
> > initialize dir for..."?
> 
> No other messages, sorry.
> 
> > > [snip...]
> > > 
> > The latest officially released reiser4 utils are not aware of recent stat
> > data extensions.  That can explain "item has wrong length" errors. 
> > However, that does not explain "points to the already used block" errors
> > :(.
> 
> Thank you for the explanation. Is the reiser4progs-0.5.5 release aware of 
> these extensions?

yes.

> 
> Best regards,
> 
> Henning

-- 
Alex.
