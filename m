From: Hans Reiser <reiser@namesys.com>
Subject: Re: rebuild fs
Date: Tue, 05 Aug 2003 17:28:25 +0400
Message-ID: <3F2FB0F9.5020001@namesys.com>
References: <E5A63F34D141D111A6F4080009D70ACA346D62@imkedv_pdc> <20030805104546.GA22557@namesys.com> <3F2FA2DF.3050505@namesys.com> <20030805125431.GE13689@namesys.com> <3F2FA997.20101@namesys.com> <20030805131723.GH13689@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15147-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030805131723.GH13689@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Thorsten Mauch <mauch@imkenberg.de>, "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

Oleg Drokin wrote:

>Hello!
>
>On Tue, Aug 05, 2003 at 04:56:55PM +0400, Hans Reiser wrote:
>
>  
>
>>>>rephrase that as, use 3.6.11, if it still fails, tell us, the segfault 
>>>>will at least be fixed regardless of whether fsck has enough data to do 
>>>>its job.
>>>>        
>>>>
>>>But it was not failing on the IDE drive anyway.
>>>      
>>>
>>I don't understand the relevance of your statement to mine.
>>    
>>
>
>Since after transferring image to IDE made reiserfsck to not fail (and it failed on raid5 due to raid errors,
>I think), your "if it still fails" statement was not adequate., 
>
Even with a broken hard drive, there should be no userspace segfault.... 
or am I wrong?

>Current problem is that not everything is restored and some important files were lost.
>Now, I know that recently we introduced some serious changes in reiserfsck and now
>if the block have some slight corruption, it is not immediately discarded, but fsck actually
>tries to extract some useful data out of it if it think this is really reiserfs metadata block.
>That's why newer reiserfsck might achieve better results.
>
>Bye,
>    Oleg
>
>
>  
>


-- 
Hans


