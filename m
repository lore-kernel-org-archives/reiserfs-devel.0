From: Hans Reiser <reiser@namesys.com>
Subject: Re: when distros do not support official Marcelo kernels they are
 not being team players (was Re: reiserfs on redhat advanced server?)
Date: Mon, 03 Feb 2003 21:51:43 +0300
Message-ID: <3E3EBA3F.7060806@namesys.com>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org>	 <3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no>	 <3E3A6071.6060102@namesys.com>	<20030131115333.GC15359@marowsky-bree.de>	 <3E3A67AE.4050601@namesys.com>	<20030131122147.GE15359@marowsky-bree.de>	 <3E3A6D76.7080300@namesys.com> <86lm0xpmho.fsf@trasno.mitica>	 <3E3E7A95.1050908@namesys.com> <1044284001.15685.358.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12616-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1044284001.15685.358.camel@tiny.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Juan Quintela <quintela@mandrakesoft.com>, Lars Marowsky-Bree <lmb@suse.de>, =?ISO-8859-1?Q?Ragnar_Kj=F8rstad?= <reiserfs@ragnark.vestdata.no>, Jure Pecar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

I think it is much more like switching the engine in the car and 
expecting the car company to honor the warranty on the air conditioner, 
or expecting that if I install linux on my dell laptop and the hard 
drive goes bust that the hard drive will be replaced under warranty.  
You do remember that in the US the car companies tried to lock out 
after-market parts suppliers by using the warranty as leverage, yes?  
Fortunately in the car case that was before the courts were packed with 
judges who hate the anti-trust laws by our lovely elected 
representatives, and so it was found to be illegal.  Since we no longer 
have anti-trust laws in America, social pressure is the appropriate 
response in the case of Linux.

I hope you are not saying that recompiling the kernel is more deserving 
of voiding a warranty than, say, creating a custom .bashrc file?

Hans

Chris Mason wrote:

>On Mon, 2003-02-03 at 09:20, Hans Reiser wrote:
>
>  
>
>>It is different from refusing to support the user who downloads 
>>Marcelo's kernel after it does ship (after the distro CD went into the 
>>stamping plant). That is what I am complaining about.  The default 
>>should be to support all Marcelo kernels unless there is a motivated 
>>reason not to (e.g. he ships a broken NFS kernel and the user is 
>>complaining about NFS).  Users should feel that they can download any 
>>latest official stable kernel (it is okay though to tell them to check a 
>>website created by the distro to see if it is a known bad/unsupported 
>>kernel), and everything will be fine with the distro.  When distros 
>>don't do this, they are not being team players.
>>    
>>
>
>Hans, the vanilla kernels are lacking both bug fixes and features that
>are critical to what our users are doing.  Even if the bug fixes all got
>in, there are various reasons the features probably won't.  
>
>If there was any vanilla kernel that had everything we needed, we'd
>support it, and do a dance around a bonfire made from all of our patch
>maintenance scripts and code.
>
>The whole point of buying the distro is that you don't have the time and
>energy to collect and compile every application and turn it into
>something you can easily install on your personal machine.  The kernel
>is one of those applications.  Feel free to replace it, but it doesn't 
>make sense to expect us to help you fix the problems when we don't have
>control over the configuration, compile or sources.
>
>That would be like switching engines in your car and expecting the
>original car company to do a warranty repair on the new engine.
>
>-chris (speaking only for himself and not SuSE)
>
>
>
>
>  
>


-- 
Hans


