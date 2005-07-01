From: David Masover <ninja@slaphack.com>
Subject: Re: XFS corruption during power-blackout
Date: Fri, 01 Jul 2005 14:58:39 -0500
Message-ID: <42C5A06F.40906@slaphack.com>
References: <OF23DC8299.F6F2200B-ON88257031.005B3A9B-88257031.00650D8F@us.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24909-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <OF23DC8299.F6F2200B-ON88257031.005B3A9B-88257031.00650D8F@us.ibm.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bryan Henderson <hbryan@us.ibm.com>
Cc: Ric Wheeler <ric@emc.com>, Al Boldi <a1426z@gawab.com>, Chris Wedgwood <cw@f00f.org>, linux-fsdevel@vger.kernel.org, linux-xfs@oss.sgi.com, Steve Lord <lord@xfs.org>, 'Nathan Scott' <nathans@sgi.com>, reiserfs-list@namesys.com

Bryan Henderson wrote:
[...]
> What you'd really like is to fsync a multi-file unit of work (transaction) 
> -- and not just among open files.  You'd like to open, write, and close 
> 1000 files in a single transaction and then commit that transaction, with 
> no syncing due to timers in the meantime.  If you're really greedy, you'd 
> also ask for complete rollback if the system fails before the commit.

Both of these are planned for Reiser4.  Or is it 4.1?

I would like said interface to be able to not necessarily flush to disk 
right away, though.  It should certainly be an option (I'm sure MySQL 
would use that option), but sometimes you want the performance, 
especially if there are dozens of these transactions firing all at once 
-- better to let RAM fill up and then flush them all.
