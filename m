From: =?ISO-8859-15?Q?Dieter_N=FCtzel?= <Dieter.Nuetzel@hamburg.de>
Subject: Re: allocator options, kernel 2.6.7
Date: Thu, 17 Jun 2004 11:48:42 +0200
Message-ID: <40D168FA.4010009@hamburg.de>
References: <20040617012918.1cc93df9@rayanne> <1087429133.8002.15.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19227-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1087429133.8002.15.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Pierre Etchemaite <petchema@concept-micro.com>, reiserfs-list@namesys.com



Chris Mason schrieb:
> On Wed, 2004-06-16 at 19:29, Pierre Etchemaite wrote:
> 
>>	Hi all,
>>
>>I've been using 2.6.5 kernel with data-logging, allocator options patch, and
>>
>>	data=ordered,alloc=skip_busy:dirid_groups,packing_groups
>>
>>mount options for a while. So far so good.
>>
>>
>>Now, two questions.
>>
>>1. I came across this fix:
>>http://www.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.6/2.6.6-mm5/broken-out/reiserfs-block-allocator-should-not-inherit-packing-locality.patch
>>
>>Does that mean that I could have problem fixing some of my filesystems if
>>they happened to need reiserfsck ?
>>
> 
> There's a reiserfsprogs patch as well, which was sent to Vitaly.  I've
> attached it to this message.
> 
> 
>>(From what I understand I can check if it's not too late already if
>>
>>/sbin/debugreiserfs -d /dev/xxxx |grep '^|.*SD'|sed 's/^.....//'|awk '$1==1'
>>
>>returns only one line, beginning with 1 2 ...)
>>
>>
>>2. kernel 2.6.7 seems to have data-logging patch applied (which is a very
>>good news!), but not advanced allocator options patch. Is there a patch for
>>2.6.7, or would you recommend me forgetting about those options for now ?
>>Allocator tweaks looks a bit more experimental than I thought.
> 
> 
> It seemed best to keep the changes for 2.6.7 somewhat more limited.  The
> allocator patches are going through a big QA round at SUSE as well right
> now, so any remaining problems should get ironed out very shortly.
> 
> -chris
> 
> 
> 
> ------------------------------------------------------------------------
> 
> --- reiserfsck-3.6.17/fsck/pass0.c	2004-05-20 20:15:19.312305008 -0400
> +++ reiserfsck-3.6.17.fix/fsck/pass0.c	2004-05-20 20:16:41.366830824 -0400
> @@ -565,7 +565,8 @@
>      if (get_key_dirid (key) == 0 || get_key_objectid (key) == 0 || get_key_objectid (key) == 1 ||
>  	get_key_dirid (key) == ~(__u32)0 || get_key_objectid (key) == ~(__u32)0 ||
>  	get_key_dirid (key) == get_key_objectid (key) ||
> -	(get_key_dirid (key) == 1 && get_key_objectid (key) != 2) ||
> +        /* the alloc=packing_groups used to allow dirid = 1
> +	(get_key_dirid (key) == 1 && get_key_objectid (key) != 2) || */
>  	(get_key_dirid (key) != 1 && get_key_objectid (key) == 2) )
>  	return 1;

Hello Chris,

is there a reiserfsck-3.6.17 version (*.src.rpm) for SuSE 9.0/9.1 available?

Thanks,
	Dieter

