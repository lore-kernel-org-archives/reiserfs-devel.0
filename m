From: "Rudy L. Zijlstra" <rudy@edsons.demon.nl>
Subject: Re: kernel go-slow
Date: Mon, 03 Feb 2003 00:42:54 +0100
Message-ID: <3E3DACFE.9000005@edsons.demon.nl>
References: <200302030027.40936.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12607-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200302030027.40936.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Russell Coker <russell@coker.com.au>
Cc: ReiserFS <reiserfs-list@namesys.com>

Russell Coker wrote:

>I'm running a number of machines with 2.4.20 and the ReiserFS journal patches.
>
>One problem that has started occuring is that periodically some of the 
>machines will go really slow for a while.  It's as if the CPU speed has just 
>dropped to 1% of it's regular speed.  Then after 10 minutes or so it will 
>continue as normal.
>
>Has anyone heard of such things before?
>
>  
>
Russell,

I am (was) running a vanilla 2.4.20 kernel and experienced a slow-down 
each night during virus scan. System would not respond to http during 
undefined moments. But rather repeatable each night, though each time at 
a different moment during the night. I've just rebooted into 2.4.19 to 
check whether its 2.4.20 or the results of hardware modification I did 2 
weeks ago. System is lightly loaded. file systems in use mostly Reiserfs 
and a spattering of left-over ext2.

Cheers,

Rudy

