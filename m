From: Alexander Lyamin <flx@msu.ru>
Subject: Re: kernel go-slow
Date: Thu, 6 Feb 2003 14:26:49 +0300
Message-ID: <20030206142649.A27228@t-raenon.nmd.msu.ru>
References: <200302030027.40936.russell@coker.com.au>
Reply-To: flx@msu.ru
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12661-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200302030027.40936.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Russell Coker <russell@coker.com.au>
Cc: ReiserFS <reiserfs-list@namesys.com>

Mon, Feb 03, 2003 at 12:27:40AM +0100, Russell Coker wrote:
> I'm running a number of machines with 2.4.20 and the ReiserFS journal patches.
> 
> One problem that has started occuring is that periodically some of the 
> machines will go really slow for a while.  It's as if the CPU speed has just 
> dropped to 1% of it's regular speed.  Then after 10 minutes or so it will 
> continue as normal.

when its slows down, please check with vmstat for IO or with your
led for disk activity. thats a simply and stupid.

but theres no really good way to understand whats goining on in kernel
if you are userland yourself. so go in kernel with profiling and see
where does it spend it precisious time. slightly more complicated then
method above, but much more effective.

> 
> Has anyone heard of such things before?
> 
> I am asking here first because the ReiserFS patch is the most significant 
> kernel patch I've applied on what is otherwise a stock 2.4.20 kernel.
> 
> Interestingly the machines that have the problems are not the most active in 
> the file system (mail store), but the mail spool machines.  The mail spool 
> machines do a good amount of file access (but well below the limits of the 
> hardware) and also use more memory and have large load spikes on occasion 
> (virus and spam scanning).

-- 
"Cache remedies via multi-variable logic shorts will leave you crying."(cl)
Lex Lyamin
