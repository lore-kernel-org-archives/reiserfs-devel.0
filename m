From: Hans Reiser <reiser@namesys.com>
Subject: Re: State of the Reiser4 FS
Date: Tue, 14 Mar 2006 23:14:12 -0800
Message-ID: <4417BEC4.6060506@namesys.com>
References: <3aa654a40603140241s5d8a7430j6bf29a5ef7dd1bf5@mail.gmail.com>	 <1142336718.7415.55.camel@tribesman.namesys.com> <194f62550603140732j6ef10757j@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28258-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <194f62550603140732j6ef10757j@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Clemens Eisserer <linuxhippy@gmail.com>
Cc: reiserfs-list@namesys.com

Clemens Eisserer wrote:

>>AFAIK, the most recent reason why reiser4 does not get included is that
>>reiser4 developers have to change reiser4 to use generic code to
>>implement read/write.
>>AFAICS, reiser4 developers do not work on that.
>>    
>>
>Has this really become a reason to not include reiser4 into mainline?
>  
>
Yes, this is the official reason.

>I also don't see a reason for that - at least it would bind reiser4
>more close to linux making ports to other OS harder.
>  
>
You are entirely correct.  It is an interesting social phenomenom that
we must do this, yes?  Using the ext3 (err, generic) code makes it much
harder to license and port reiser4.

>Furthermore if it would decrease performance its simply no way to go.
>  
>
What we are currently doing is rewriting the reiser4 read and write code
to not operate 4k at a time.  The design specification was that it was
supposed to do as much as possible once per write, and as little as
possible every 4k.  Unfortunately, when I reviewed our code the design
specification had not been adhered to.  After the reiser4 code adheres
to the reiser4 design specification, it will be possible to argue that
the reiser4 design specification is technically superior, and the
generic code should change.   I generally believe that the per 4k
approach used throughout the linux kernel is not as CPU efficient as
sending larger groups of pages through the layers all at once.  In other
words, there is a reason we have bios, and we need to learn the lesson
from them that they teach us, and abstract it into a general design
approach.

We must make reiser4 adhere to the reiser4 design specification before
we can deal with their demand that we change the generic code so that it
does what reiser4 does.  I have no desire to touch their code, but they
require it.  Generally speaking, they don't really like any feature
existing in reiser4 that is not in their code, and ask that we add it to
their code before reiser4 is allowed to have it.  They call the ext3
code the "generic" code.  They claim that if we don't use the ext3 code
in our fs then they will be forced to shoulder an extra burden to
maintain our code.  We are not allowed to specify that they should not
maintain our code at all.  I need to read more Kafka I think, it is hard
for me to understand it all.

>(btw. I think this could be a way to generate some revenue - I think
>there is demand for a modern fs which is supported by both, windows
>and linux).
>  
>
There are so many ways to generate revenue by spending revenue I don't
have in my pocket right now.....  forgive me, yes, someday we should do
that and will do that.

>lg Clemens
>
>
>  
>
If any of you users want to see a reiser4, you have to strenuously
clamor for it to go into mainline, or you simply will not get it. 
Namesys cannot survive indefinitely with it not going into the kernel. 
This is a political issue, and viewing it as otherwise is simply naive. 
It is sad, I chose Linux over BSD to develop for because BSD used to be
like this.

Hans
