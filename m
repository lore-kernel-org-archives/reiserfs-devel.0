From: Florian Engelmann <mailinglists@d-g-c.de>
Subject: Re: Reiser4fs and SPARC64?
Date: Mon, 21 Feb 2005 15:12:48 +0100
Message-ID: <4219EC60.5090705@d-g-c.de>
References: <421347FD.6000204@d-g-c.de> <200502161724.16258.vitaly@namesys.com> <4219D560.9090904@d-g-c.de> <200502211617.26270.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200502211617.26270.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

Vitaly Fertman schrieb:

>>libaal-1.0.4.tar.gz compiled fine without any patches.
>>but reiser4progs-1.0.4 did not (also no patches!):
>>    
>>
>
>do you have a mix of several installed versions in the system?
>uninstall, check that nothing left and another try will probably help.
>
>  
>
you mean of libaal?
no i don't have. I just compiled the kernel today what worked fine (also 
i lost my serial console output cause i don't know what drivers i need).
After that i had a look at your ftp and found the new libaal-1.0.4 and 
reiser4progs-1.0.4 so i decided to install the newer once. I tried to 
patch them with the 2 patches you emaild me but i figured out they are 
already patched, aren't they?
The libaal compiled and installed withount any probs but the 
reiser4progs didn't.
Should i try to compile 1.0.3? Would reiser4progs 1.0.3 work with libaal 
1.0.4???

thx Florian

>>format40.c:255: warning: type defaults to `int' in declaration of `__tmp'
>>format40.c:255: warning: initialization makes integer from pointer
>>without a cast
>>    
>>
>
>  
>

