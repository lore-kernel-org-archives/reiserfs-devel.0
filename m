From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Problem with the latest auto snapshot
Date: Tue, 15 Jun 2004 21:44:57 +0400
Message-ID: <20040615174457.GB8091@backtop.namesys.com>
References: <200406122131.25974.henning-04@die.informatik.uni-siegen.de> <20040615080653.GY8091@backtop.namesys.com> <20040615081441.GZ8091@backtop.namesys.com> <200406151850.44164.henning-04@die.informatik.uni-siegen.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19199-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200406151850.44164.henning-04@die.informatik.uni-siegen.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henning Westerholt <henning-04@die.informatik.uni-siegen.de>
Cc: reiserfs-list@namesys.com

On Tue, Jun 15, 2004 at 06:50:44PM +0200, Henning Westerholt wrote:
> Am Dienstag, 15. Juni 2004 10:14 schrieb Alex Zarochentsev:
> > > Can you also enable CONFIG_REISER4_CHECK and CONFIG_REISER4_DEBUG?  It
> > > may help to catch a bug faster.
> 
> Hello Alex, 
> 
> thanks for your reply.
> 
> I restarted with a debug-enabled kernel, after the fsck --build-sb --fix run 
> on the three partitions i use. The fsck reports a consistent fs on all of 
> them.
> 
> The first access to a reiser4 fs during the boot (cleaning the tmp dir) causes 
> several kernel oopses. I captured them with pen and paper, as these message 
> don't appear in the system log. I try to capture them with the serial console 
> on a second pc, but without success.

do you use a kernel with 4k stacks?  

What CONFIG_4KSTACKS is set to? This option should be switched off for
reiser4.

[ ... ] 

> reiser4 kernel config:
> 
> CONFIG_REISER4_FS=y
> # CONFIG_REISER4_FS_SYSCALL is not set
> CONFIG_REISER4_LARGE_KEY=y
> CONFIG_REISER4_CHECK=y
> CONFIG_REISER4_DEBUG=y
> # CONFIG_REISER4_FS_SYSCALL_DEBUG is not set
> # CONFIG_REISER4_DEBUG_MODIFY is not set
> # CONFIG_REISER4_DEBUG_MEMCPY is not set
> # CONFIG_REISER4_DEBUG_NODE is not set
> # CONFIG_REISER4_ZERO_NEW_NODE is not set
> # CONFIG_REISER4_TRACE is not set
> # CONFIG_REISER4_EVENT_LOG is not set
> # CONFIG_REISER4_STATS is not set
> # CONFIG_REISER4_PROF is not set
> CONFIG_REISER4_DEBUG_OUTPUT=y
> # CONFIG_REISER4_NOOPT is not set
> CONFIG_REISER4_USE_EFLUSH=y
> # CONFIG_REISER4_COPY_ON_CAPTURE is not set
> # CONFIG_REISER4_BADBLOCKS is not set
> 
> 
> Hope you could use this report.
> 
> Best regards,
> 
> Henning

-- 
Alex.
