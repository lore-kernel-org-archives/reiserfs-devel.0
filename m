From: Hans Reiser <reiser@namesys.com>
Subject: Re: when distros do not support official Marcelo kernels they are
 not being team players (was Re: reiserfs on redhat advanced server?)
Date: Mon, 03 Feb 2003 22:50:04 +0300
Message-ID: <3E3EC7EC.8090005@namesys.com>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org>	 <3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no>	 <3E3A6071.6060102@namesys.com>	<20030131115333.GC15359@marowsky-bree.de>	 <3E3A67AE.4050601@namesys.com>	<20030131122147.GE15359@marowsky-bree.de>	 <3E3A6D76.7080300@namesys.com> <86lm0xpmho.fsf@trasno.mitica>	 <3E3E7A95.1050908@namesys.com> <1044284001.15685.358.camel@tiny.suse.com>	 <3E3EBA3F.7060806@namesys.com> <1044300746.15684.428.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12620-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1044300746.15684.428.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Juan Quintela <quintela@mandrakesoft.com>, Lars Marowsky-Bree <lmb@suse.de>, =?ISO-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, Jure Pecar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

Chris Mason wrote:

>Grin, my analogy was that if you replace the engine you can't complain
>about engine problems.
>
This we agree on.

>  If you replace the kernel you can't complain to
>us about kernel problems.  The fact that many different aspects of the
>system actually translate into kernel issues makes it hard to fix things
>when people start playing musical kernels on us.
>
But you have a civic duty to determine that the modified kernel is at 
fault (or at least could be at fault) before you refuse to support it.  
Otherwise you are no better than Dell.

Also, if you refuse to support an official Marcelo kernel, you are 
undermining our unified social structure.  That is a social structure 
that should be undermined only for good cause.

>
>  
>
>>I hope you are not saying that recompiling the kernel is more deserving 
>>of voiding a warranty than, say, creating a custom .bashrc file?
>>    
>>
>
>A customer recently called us to figure out why their benchmark was
>spending all it's time in system time instead of actually doing
>something useful.
>
>Eventually I figured out they had switched from our scsi driver to one
>directly from the hardware vendor (could just as easily have been from
>the vanilla kernel though).  They had done everything right in terms of
>compiling it, and the replacement driver probably didn't have any
>additional bugs over ours, but it also wasn't highmem io enabled.  So it
>spent all it's time doing bounce buffer copies.  
>
>At no point in time during the debugging did I ask them if they had
>changed their .bashrc. 
>
I used to know sysadmin departments that would not support users with 
customized .bashrc files....

I have always had a pet peeve for keeping users disenfranchised from the 
right to program.  Not everyone agrees with me, particularly the persons 
whose workload is increased by such subversive activity.;-)

> 
>
>Any reasonable distro is going to try working with their customers as
>much as possible.  At the same time, we've put huge amounts of time and
>energy into making a coherent, fast and reliable product.  The customer
>needs to understand that swapping out bits and pieces of that makes it
>significantly harder to support the system as a whole.
>
Kind of like buying a non-IBM hard drive for your IBM PC?

>
>-chris
>
>
>
>
>  
>
The issues you raise are real ones, and important ones, but not 
sufficient ones.

-- 
Hans


