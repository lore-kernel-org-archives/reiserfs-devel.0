From: George Beshers <gbeshers@comcast.net>
Subject: Re: iozone reality check: was zam, please discuss this
Date: Wed, 23 Jun 2004 14:03:33 -0400
Message-ID: <40D9C5F5.7010605@comcast.net>
References: <40D8EB0D.6050109@namesys.com> <20040623063049.GA5080@backtop.namesys.com> <40DA58BC.1060203@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19310-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40DA58BC.1060203@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: ReiserFS List <reiserfs-list@namesys.com>


Caveat: I have not looked at the iozone test so this is purely in response
to Han's description.

The examples I know of are apps that allocate an mmap'd area for garbage
collection: ocaml, sml-nj, and I believe ghc (Haskell) do this.  While these
systems usually have generational GCs at some point major collections
happen and then I *believe* that you will see lots of dirty pages.

Note: the 'believe' is based on some experiments on an SGI ccNuma
system with profiling tools---I was looking at local access issues and
noticed the pattern of changes to flag objects as "marked" in a mark/sweep
collector.  I then tried ocaml as an experiment and saw something
similar.


I have not look at Boehm conservative collector in some time, but if
memory serves me correctly it uses separate arrays to hold the bits;
using mmap is an option---I don't know if it is in common use.

Some 18-20 months ago I spent some time looking at the Java GC
but I don't remember its using mmap() and I no longer have the source
available.

George Beshers



Hans Reiser wrote:

> Alex Zarochentsev wrote:
>
>> On Tue, Jun 22, 2004 at 07:29:33PM -0700, Hans Reiser wrote:
>>  
>>
>>> http://www.namesys.com/intbenchmarks/mongo/04.05.04/256MB.RAM/comparison/smart-8k.noENTD.vs.ENTD/comp-ENTD.vs.noENTD.html 
>>>
>>>   
>>
>>
>> Because direct page reclaiming (when a thread which needs memory does 
>> try_to_relase_page() by itself) is better then indirect one (through
>> ENTD or whatever page reclaiming daemon).  It is why Linux uses direct
>> page reclaiming not indirect.
>>
>>  
>>
> I apologize to zam, I meant to only cc this to reiserfs-dev.
> I think this performance loss can be overcome, and needs to be 
> overcome so we can eliminate emergency flush and get good iozone 
> results.  I should note though that Andrew Morton thinks iozone is a 
> benchmark that does things that no application does (dirtying massive 
> amounts of mmap'd pages).  I am curious as to whether the sysadmins on 
> the list would agree with that (Andrew may be right)....
>

