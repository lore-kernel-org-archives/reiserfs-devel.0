From: Yury Umanets <umka@namesys.com>
Subject: Re: libaal documentation: fact or fiction?
Date: Wed, 08 Oct 2003 23:56:55 +0400
Message-ID: <3F846C07.2030707@namesys.com>
References: <3F82F657.8040605@mbl.ca> <3F83B424.90107@namesys.com> <20031008163202.GA2185@mbl.ca> <3F84538B.9010109@namesys.com> <20031008190146.GA11458@mbl.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15815-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031008190146.GA11458@mbl.ca>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Geoff Oakham <g@mbl.ca>
Cc: reiserfs-list@namesys.com

Geoff Oakham wrote:

>On Wed, Oct 08, 2003 at 10:12:27PM +0400, Yury Umanets wrote:
>  
>
>>>Is this library the userland interface applications use to write to
>>>files in atomic operations?
>>>      
>>>
>>No. It serves just for having persistent interface for working with 
>>device inside libreiser4.
>>    
>>
>
>So this is the library Lilo & friends would want to use to find out
>where a kernel image is physically located on disk?  Thanks for setting
>me straight on this one..  obviously I've guessed wrong.
>
Actually libaal is base library for libreiser4. It contains all needed 
type definitions, utils, device abstraction, and device data block 
functions, exceptions, etc. And libreiser4 along with it is supposed to 
provide reiser4 access in user space for any application, which would 
want to acess reiser4 without kernel. For instance, some repair tool 
like testdisk.

libreiser4 is able to create files, write and then delete them. The same 
about directories. It also has plugin based design and may be easyly 
expanded. For now, it contains all the code needed for working with 
reiser4 in userspace (or in so called stand alone mode, like GRUB works 
in it durring showing menu and reading kernel image).

We have a pach for GRUB, so it uses libreiser4 for provide reiser4 support.

>
>  
>
>>Ok, I see, but libreiser4 does not any things with journaling and so on. 
>>So, probably it is better to start from reading resier4 design documents 
>>on our website and then take a look to kernel code.
>>    
>>

>Although I find the design documents very interesting, I can't say I
>find them helpful for navigating the source.  Perhaps I haven't read
>them thoroughly enough.
>
That is because they descibe only main ideas, not the how these ideas 
are impelemnted in particular language or enviromnent. Be sure, if you 
ask me or someone else of our team, about reiser4 sources, we will 
answer any question.

>
>  
>
>>We will have userspace API for controlling transactions and other things 
>>latter when sys_reiser4() is finished.
>>    
>>
>
>Ah, that's good to know.  What's the status of that work?
>
Actually I'm not sure, that my information about the status is up 
to-date. Ask Hans about this.

>
>  
>
>>>Futhermore, I want to see if it's possible
>>>to implement the equivalent functionality (at least from a programmer's
>>>perspective) on a traditional UNIX filesystem using old-fasioned
>>>file-locking.
>>>
>>>      
>>>
>>Can you say more detailed about this? What do you mean speaking about 
>>old-fasioned file-locking?
>>    
>>
>
>Sure: Imagine I'm the author of 'mutt', a popular mail reader.  [I'm
>not, but for this "use case," please imagine I am.] 
>
Ok :)

> 'mutt' allows
>multiple instances of itself to run in parallel.. which means I have to
>be careful when reading and writing to the [poor] user's mailbox.
>

>Traditionally, this meant I would have to group all my file access into
>'critical sections' and obtain an appropriate file locks for the
>duration of each section.
>

>
>At the begining & end of the critical sections, I should be able to
>assert the file is in a valid, "non-corrupt" state.  Wait... this sounds
>suspiciously like a "transaction": if I wanted to modify mutt to take
>advantage of reiserfs4's data journalling, the sections would
>be the obvious place to do it.
>
Hm.. It's cool idea. There only a thing... It is needed to rewrite mutt 
and other tools to use this critical section. Also,  this should be 
system wide, I mean, that linux should support this feature in its VFS. 
I guess Hans will be interesting to discuss this more detailed.

Yet another method that comed to my mind, is to impelement ability to 
open not the whole file, but some its part and to have separated file 
descriptor for that file. It seems, that QNX is able to do so.

>
>Imagine that I've gone ahead and made these modifications.  My next
>thought would be: "ok, now without using #ifdefs, how can I continue to
>support legacy platforms [and/or filesystems] that don't support data
>journalling?"  This is where I'd hope a good userspace library could
>step in.
>
So, you propose to use some kind of crossover between applications and 
actual call to kernel? And this bridge should decide is backend 
filesystem is able to do journaling and has user space journaling 
control API? It is yet another good idea.


>
>Does that make sense, or am I completely missing the point of data
>journalling?
>
This makes sence and all the things you've described are the use of 
journaling control in user space.

>
>Thanks,
>
>Geoff
>
>  
>


-- 
umka


