From: Oleg Drokin <green@namesys.com>
Subject: Re: Large Partition Performance Test
Date: Fri, 12 Apr 2002 13:41:16 +0400
Message-ID: <20020412134116.B21820@namesys.com>
References: <20020411181459.69516.qmail@web10002.mail.yahoo.com> <20020411234316.A3749@namesys.com> <20020411202856.GA26083@matrix.wg> <1018563083.14483.100.camel@tiny>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10055-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <1018563083.14483.100.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Dirk Mueller <dmuell@gmx.net>, reiserfs-list@namesys.com

Hello!

On Thu, Apr 11, 2002 at 06:11:23PM -0400, Chris Mason wrote:

> Then I would expect the new allocator in busy_skip mode to fix it.  But,
> having profiling on would tell us for sure.

Even withoyt skip_busy mode it will work much better.
The problem is on each file creation we start to look for a free block almost
from the beginning of disk. using no_unhashed_relocation mount option,
we make initial block allocation to be more random and cause less overhead
(verified).
And in this test we create a lot of 15k files.

Bye,
    Oleg
