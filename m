From: Chris Mason <mason@suse.com>
Subject: Re: BUG in reiserfs_write_full_page().
Date: 17 Jul 2003 17:33:31 -0400
Message-ID: <1058477610.4012.333.camel@tiny.suse.com>
References: <3F1712F6.7080204@polyserve.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14959-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F1712F6.7080204@polyserve.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Michael Gaughen <mgaughen@polyserve.com>
Cc: reiserfs-list@namesys.com

On Thu, 2003-07-17 at 17:19, Michael Gaughen wrote:
> Hello,
> 
> We have a test machine that continues to BUG() in 
> reiserfs_write_full_page().
> The machine is running SLES8 (2.4.19-152, UP). Here is the (kdb) stack 
> trace:

Hmmm, the allocation masks are supposed to be set such that writepage
won't get called.  I'll take a look.  How easy is it to reproduce?  If
you have any tests cases that can trigger it, please send them along.

-chris


