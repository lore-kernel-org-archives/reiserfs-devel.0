From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: [Fwd: Re: [Fwd: wait_buffer_until_released - occuring on another machine]]
Date: Thu, 5 Feb 2004 00:12:50 +0300
Message-ID: <200402050011.29021.vitaly@namesys.com>
References: <1075709854.1830.38.camel@tribesman.namesys.com> <40213903.3804.819C3F@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16698-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40213903.3804.819C3F@localhost>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Wolfgang Riedmann <wolfgang@riedmann.it>
Cc: reiserfs-list@namesys.com

On Wednesday 04 February 2004 20:25, Wolfgang Riedmann wrote:
> Hi Vitaly,

Hello, 

> > would you take one of the last reiserfsprogs (not earlier than
> > 3.6.11), apply there this patch and run reiserfsck. This should
> > show details about the bitmap corruption detected on the fs if
> > any. Send us the output of 'reiserfsck /dev/cciss/c0d0p6' please.
>
> as I wrote yesterday I have upgraded the kernel to 2.4.24, but today
> the error has occurred again (yesterday evening after the
> installation of the kernel the machine was obviously rebooted).
>
> What can I do next?

Did you apply the patch for the progs I sent you that shows the bitmap 
difference in details? If not, apply it please and run reiserfsck --check 
again on the problem partuition, if yes, say it please.

-- 
Thanks,
Vitaly Fertman


