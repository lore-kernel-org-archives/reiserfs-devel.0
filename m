From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 bk pull problem
Date: Tue, 1 Jun 2004 20:26:09 +0400
Message-ID: <20040601162608.GL24446@backtop.namesys.com>
References: <200405291554.18065.l_allegrucci@despammed.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18944-reiserfs=m.gmane.org@namesys.com>
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

On Sat, May 29, 2004 at 03:54:18PM +0200, Lorenzo Allegrucci wrote:
> 
> I can bk clone the reiser4-linux-2.6 repository
> but I can't bk pull, it waits forever.
> I've tried upgrating to bitkeeper 3.2 (from 3.0.4)
> but the problem is still there.
> Does bk pull work for you?
> thanks,

It is known problem.  bk does not like something in our public repository.

However, we are testing reiser4 snapshot script, it puts reiser4 patches in
http://www.namesys.com/auto-snapshots/ .
  
> -- 
> Lorenzo

-- 
Alex.
