From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: mount throws a nikita-3228 on me
Date: Wed, 26 May 2004 00:11:33 +0300
Message-ID: <20040525211133.GG4990@nysv.org>
References: <20040525080001.GF4990@nysv.org> <1085473856.1915.99.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-18848-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1085473856.1915.99.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On Tue, May 25, 2004 at 12:30:57PM +0400, Vladimir Saveliev wrote:

>> It says only small keys are supported. I think it was a Nikita-3228.[1]
>You seem to get reiser4 with an error which makes reiser4 to not compile
>properly.

Ok...

>Please try to add the below 
>#include <linux/types.h>
>#include <linux/fs.h>
>#include <asm/hardirq.h>
>#include <linux/sched.h>
>
>to reiser4.h right after line:
>#include <linux/errno.h>
>
>and remote
>/* for __u?? types */
>#include <linux/types.h>
>/* for struct super_block, etc */
>#include <linux/fs.h>
>/* for in_interrupt() */
>#include <asm/hardirq.h>
>
>#include <linux/sched.h>
>
>
>from debug.h 

Do you mean remove?

I took a new BK pull but it still has the same problem..

I will try this one more time today, but probably not report until
tomorrow morning. I need sleep ;)

BTW, just in case some other people are wondering the same as I, some
Reiser4 patch set kernels like -love5 are ported from older Namesys
code. I thought to let people know, because I thought otherwise :)

And thanks for the help, guys!

-- 
mjt

