From: Hans Reiser <reiser@namesys.com>
Subject: Re: Odd Block allocation behavior on Reiser3
Date: Tue, 10 Aug 2004 12:40:19 -0700
Message-ID: <411924A3.8010305@namesys.com>
References: <20040809201939.GA55683@kevlar.burdell.org>	 <1092083451.10651.218.camel@watt.suse.com>	 <20040809220459.GA57121@kevlar.burdell.org> <41187657.7030709@namesys.com>	 <20040810154514.GA67591@kevlar.burdell.org>  <41190B5A.7070503@namesys.com> <1092162318.10651.365.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20144-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1092162318.10651.365.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: Sonny Rao <sonny@burdell.org>, reiserfs-list@namesys.com, "E. Gryaznova" <grev@namesys.com>

Chris Mason wrote:

>On Tue, 2004-08-10 at 13:52, Hans Reiser wrote:
>  
>
>>Sonny Rao wrote:
>>
>>    
>>
>>>On Tue, Aug 10, 2004 at 12:16:39AM -0700, Hans Reiser wrote:
>>> 
>>>
>>>      
>>>
>>>>Interesting.What happens without overwrite, that is, if you write more 
>>>>files without deleting the old ones?
>>>>   
>>>>
>>>>        
>>>>
>>>Below I made 24 one gigabyte files in sequence
>>>All of them are similarly fragmented: 
>>>data # filefrag *
>>>datafile0: 268 extents found
>>>
>>>      
>>>
>>this could explain some reiser3 performance problems.   This is what 
>>happens when I spend all my time chasing funding and don't spend it 
>>reviewing code and benchmarks, sigh.
>>
>>Thanks for spotting this.  I would be curious if this is occuring near 
>>the transition between unformatted nodes and their parents, or something 
>>else.
>>    
>>
>
>There have been a few threads on this on reiserfs-list
>
>singer:/data # dd if=/dev/zero of=foo bs=1MB count=1000
>1000+0 records in
>1000+0 records out
>singer:/data # filefrag foo
>foo: 1 extent found
>
>The new allocator really should be doing a better job here.
>
>-chris
>
>
>
>
>  
>
Well, this explains why we haven't cured the problem, we can't reproduce 
it, yes?

We need to figure out what Sonny is doing, and maybe have elena try on 
yet another machine.
