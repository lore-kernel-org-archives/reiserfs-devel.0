From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Reiser4
Date: Wed, 30 Jun 2004 18:36:30 +0400
Message-ID: <40E2CFEE.3000701@namesys.com>
References: <1088604993.6610.5.camel@ronni.subtil.dk> <3117.68.126.187.236.1088605480.squirrel@gaia.csus.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19462-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3117.68.126.187.236.1088605480.squirrel@gaia.csus.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: sirpj@ecs.csus.edu
Cc: reiserfs-list@namesys.com

Hello

sirpj@ecs.csus.edu wrote:
> Do you have the latest version of the module_init__tools and modutils?
> 
> http://www.kernel.org/pub/linux/kernel/people/rusty/modules/
> 
> Jenn
> 
> 
> I reeeeeeeeeeeeeeeeeeeeeeeeeeeeally want to test reiser4 - but i have
> 
>>this problem:
>>
>>modprobe reiser4:
>>FATAL: Error inserting reiser4
>>(/lib/modules/2.6.7-mm4/kernel/fs/reiser4/reiser4.ko): Unknown symbol in
>>module, or unknown parameter (see dmesg)
>>
>>dmesg:
>>...
>>reiser4: Unknown symbol __pagevec_release
>>reiser4: Unknown symbol pagevec_lookup_tag
>>reiser4: Unknown symbol __iget
>>
>>I downloaded the 2.6.7 kernel and patched it with the 2.6.7-mm4 patch.
>>Then i downloaded reiser4-2004.06.30-09.12-linux-2.6.7-mm4.diff.gz
>>from http://www.namesys.com/auto-snapshots/
>>
>>What is the problem???

Thanks for report
next auto-snapshot will fix it
for now you can add
EXPORT_SYMBOL(__get);
EXPORT_SYMBOL(__pagevec_release);
EXPORT_SYMBOL(pagevec_lookup_tag);

after definitions of those functions

>>
>>And how can I help in testing the new filesystem?
>>

Get it running and share your feeling, please

>>/ronni
>>
> 
> 
> 
> 


