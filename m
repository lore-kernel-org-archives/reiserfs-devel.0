From: Basil Chupin <blchupin@tpg.com.au>
Subject: Re: What does this mean?
Date: Tue, 06 Aug 2002 16:33:31 +1000
Message-ID: <3D4F6DBB.7030002@tpg.com.au>
References: <3D2993E5.6030707@tpg.com.au> <20020708190923.A928@namesys.com> <3D29BA3F.7010201@tpg.com.au> <200207081228.56302.kuba@mareimbrium.org>            <3D2E6DAB.9050400@tpg.com.au> <200207121326.g6CDQu3u003587@turing-police.cc.vt.edu> <3D2FFA1B.8050302@tpg.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11133-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Basil Chupin wrote:

> Valdis.Kletnieks@vt.edu wrote:
>
>> On Fri, 12 Jul 2002 15:48:27 +1000, Basil Chupin said:
>>
>>  
>>
>>> Please let me give a brief resume of why I am trying to find out why 
>>> my HD is being accessed every 5 seconds (actually it is also 
>>> occurring on another computer at home and a friend's machine -- and 
>>> all are running SuSE 8.0).
>>>
>>>  I first asked this Q isn another forum and received the general 
>>> reply that it all had to do with the reiser fs -- which I didn't 
>>> really believe. Why? because I didn't recall having this "problem" 
>>> when I was running SuSE v7.2 with reiser fs. But just to be sure I 
>>> started doing some testing.
>>>
>>> I have another HD which I use for testing purposes and on this one I 
>>> installed SuSE v7.2 undere reiserfs. There was no 5 second accessing 
>>> on the HD.
>>>
>>> I then installed SuSE 8 with ext3 (because someone said that the 5 
>>> seconds-thingie only happened under reiser) - and I still got the 5 
>>> secs access. So, it wasn't confined to reiserfs.
>>>   
>>
>>
>> Note that ext3 *also* has a 'kjournald' that ticks every 5 seconds.
>>  
>>
> Ah, so it has similarities with reiser.
>
>> I'm willing to bet that the system that wasn't seeing the ticking had all
>> the filesystems mounted as ext2, which doesn't have a journal.
>>  
>>
> Had you bet you would have lost! :-). All systems are operating under 
> reiserfs.
>
> You mentioning kjournald brought to min a conversation I had with a 
> friend of mine who tends to have a similar approach to me when 
> starting to run a new system (Linux [SuSE] in this case) and who also 
> uses a second HD to test new installations before putting them onto 
> the 'main' system.
>
> We compared the outputs from the 'ps aux' command and what I found is 
> that I am not running the kjournald process on any of my (3) 'systems' 
> while he is (on his 2 'systems') even though our setups are almost 
> identical (with regards to running SuSE v8 ). I thought kjournald was 
> part and parcel of reiserfs but then why isn't it running on my 
> 'systems'? Just another mystery.
>
> Anyway, I think I have found the reason why I (and my friend and some 
> other(s)) am having the HD accessed every 5 seconds, and after I have 
> re-checked my finding I'll post the reason. It may not have anything 
> directly to do with reiserfs but it may be  that another application 
> may be causing reiserfs to misbehave (in this 5-second syndrome) or, 
> of course, it has a bug in it causing the kernel to do the 'wrong 
> thing' (the application does a patch to the kernel).
>
> Cheers.
>
I apologise for the delay in following-up on this topic but I have been 
occupied on other things (including upgrading my system).

What I found is that, at least in my case (and my friend's), the 
5-second accessing of the HD is caused by Win4Lin. As soon as I/we boot 
into SuSE without the win4lin kernel the accessing stops and the system 
is quiet as a mouse. I am in touch with NeTraverse (Win4Lin) and they 
are investigating this matter.

In a different forum someone mentioned that when he un-installed 
seti-at-home the 5-second accessing on his system stopped - I mention 
this in case this is of interest to anyone.

I did some extensive (for me, that is :-)) testing and found that the 
5-second accessing occurs when either reiser or ext3 file systems are 
installed but the access time "drops" to once every 35 seconds if ext2 
fs is used. Interesting (?).

Cheers.



