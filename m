From: Hans Reiser <reiser@namesys.com>
Subject: Re: viewprinting processes and process oriented permissions got funded
 by DARPA
Date: Tue, 13 Apr 2004 20:42:12 -0700
Message-ID: <407CB314.8020700@namesys.com>
References: <407C304F.4080804@namesys.com> <m31xmrefug.fsf@averell.firstfloor.org> <407C930D.5010407@namesys.com> <20040414022248.GA92870@colin2.muc.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17918-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040414022248.GA92870@colin2.muc.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andi Kleen <ak@muc.de>
Cc: reiserfs-list@namesys.com

Andi Kleen wrote:

>On Tue, Apr 13, 2004 at 06:25:33PM -0700, Hans Reiser wrote:
>  
>
>>Andi Kleen wrote:
>>
>>    
>>
>>>Amazing. You managed to write all this without ever mentioning
>>>that linux 2.6 already has per process name spaces (=views) in
>>>form of CLONE_NS.
>>>
>>>-Andi
>>>      
>>>
>>Can you specify exclude *.c in them?  I think that your =views is a 
>>simplistic statement.
>>    
>>
>
>You can add any files/directories you want (mount --bind). Excluding
>is not directly supported. 
> 
>Doing it by directories is more natural though as it works with mount 
>points. Basically it mirrors the plan9 implementation and in
>plan9 it is extensively used. I don't know of any uses in Linux
>so far, but the infrastructure is there in the kernel.
>
>I don't doubt that your proposal is more powerful (and more complicated
>and vapour right now), but I think you should mention prior work
>in linux and plan9 before discussing clearcase at least.
>
>-Andi
>
>
>
>  
>
Clearcase is the most powerful instantiation of those ideas in 
filesystems, and predates plan 9 (it originated with Apollo).  I think 
that it is the appropriate reference academically.  Just because it is a 
piece of shit in its implementation details does not prevent it from 
standing head and shoulders above the rest of the field in its 
functionality.

I am still thinking through how we will implement views in Reiser4.  It 
needs to be efficient and scalable to large numbers of bindings.  I need 
to go reading through the per process name space code: I don't know if 
it will, for instance, scale to a thousand specifications.  Clearcase 
probably also would not.

I am thinking about whether we should exclude names before searching the 
FS for matches, or after.  I think before, but it needs a lot of thought.

-- 
Hans

