From: Chris Mason <mason@suse.com>
Subject: Re: BUG in journal_mark_dirty on 2.6.7/ia64
Date: Tue, 17 Aug 2004 18:10:44 -0400
Message-ID: <1092780643.12138.1591.camel@watt.suse.com>
References: <20040817191428.GP2136@polop.usc.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20363-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040817191428.GP2136@polop.usc.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Garrick Staples <garrick@usc.edu>
Cc: reiserfs-list@namesys.com

On Tue, 2004-08-17 at 15:14, Garrick Staples wrote:
> Hi all,
>    I'm currently not subscribed (the list daemon isn't replying to my subscribe
> attempts), so please CC me on replies.
> 
> I got a kernel panic on one of my ia64 servers last night.  It's an NFS server
> for about 1000 clients and ~10 terabytes of data and has been running great
> since 2.6.7 was released (Jun 15).  Last week it was rebooted to pull out an
> unused scsi raid card.
> 
> Last night I got the panic message below, which caused one of my LVM LVs to
> lock up.  Please let me know what other info you need.

Well, this should have been fixed, I'll have to review the transaction
length code again.  Updating to 2.6.8 won't fix it, the good news is
that particular panic should have kept corruption away.

-chris


