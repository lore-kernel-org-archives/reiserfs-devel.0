From: Alexander Lyamin <flx@msu.ru>
Subject: Re: reiser4 bk pull problem
Date: Tue, 22 Jun 2004 12:38:49 +0400
Message-ID: <20040622083849.GA20068@alias.nmd.msu.ru>
References: <200405291554.18065.l_allegrucci@despammed.com>
Reply-To: flx@msu.ru
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19291-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200405291554.18065.l_allegrucci@despammed.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lorenzo Allegrucci <l_allegrucci@despammed.com>
Cc: reiserfs-list@namesys.com

Sat, May 29, 2004 at 03:54:18PM +0200, Lorenzo Allegrucci wrote:
> 
> I can bk clone the reiser4-linux-2.6 repository
> but I can't bk pull, it waits forever.
> I've tried upgrating to bitkeeper 3.2 (from 3.0.4)
> but the problem is still there.
> Does bk pull work for you?
> thanks,

well.
i am the one to blame for non-working pull.

currently its disfunctional cause of there is issues with temporary
certificates from bitmover, which somehow could not be obtained by
server in multiple repository configuration...

we are going to separate the servers (this supposed to make pull work again)
, right after we move from thebsh.namesys.com

sorry for inconvinience
> 
> -- 
> Lorenzo

-- 
"the liberation loophole will make it clear.."
lex lyamin
