From: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Subject: Re: Problem with the latest auto snapshot
Date: Tue, 15 Jun 2004 00:55:50 +0200
Message-ID: <200406150055.50380.henning-04@die.informatik.uni-siegen.de>
References: <200406122131.25974.henning-04@die.informatik.uni-siegen.de> <20040614182215.GT8091@backtop.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19188-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040614182215.GT8091@backtop.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Alex Zarochentsev <zam@namesys.com>

Am Montag, 14. Juni 2004 20:22 schrieb Alex Zarochentsev:
> On Sat, Jun 12, 2004 at 09:31:25PM +0200, Henning Westerholt wrote:
> Thanks for the report.
>
> do you use SMP, RAID, LVM ?

No.

> > After some few disk operation a process try to access some data on the 
> > partition, and hung forever. I got the following log entries:

> Were there reiser4 messages in the log before "[nikita-2219]... Failed to
> initialize dir for..."?

No other messages, sorry.

> > [snip...]
> > 
> The latest officially released reiser4 utils are not aware of recent stat
> data extensions.  That can explain "item has wrong length" errors. 
> However, that does not explain "points to the already used block" errors
> :(.

Thank you for the explanation. Is the reiser4progs-0.5.5 release aware of 
these extensions?

Best regards,

Henning
