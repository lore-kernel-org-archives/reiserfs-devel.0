From: Hans Reiser <reiser@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 01:43:46 -0700
Message-ID: <412DA2C2.6010602@namesys.com>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org> <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20593-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: viro@parcelfarce.linux.theplanet.co.uk
Cc: Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>, Jason Holt <jason@lunkwill.org>

viro@parcelfarce.linux.theplanet.co.uk wrote:

>On Wed, Aug 25, 2004 at 01:22:55PM -0700, Linus Torvalds wrote:
>  
>
>>On Wed, 25 Aug 2004, Christoph Hellwig wrote:
>>    
>>
>>>For one thing _I_ didn't decide about xattrs anyway.  And I still
>>>haven't seen a design from you on -fsdevel how you try to solve the
>>>problems with files as directories.
>>>      
>>>
>>Hey, files-as-directories are one of my pet things, so I have to side with 
>>Hans on this one. I think it just makes sense. A hell of a lot more sense 
>>than xattrs, anyway, since it allows scripts etc standard tools to touch 
>>the attributes.
>>
>>It's the UNIX way.
>>    
>>
>
>Not if you allow link(2) on them.  And not if you design and market your
>stuff as a general-purpose backdoor into kernel. 
>
What backdoor?  Please spell it out.  Plugins are not dynamically 
loadable. 

> Note how *EVERY* *DAMN*
>*OPERATION* is made possible to override by "plugins".  Which is the reason
>for deadlocks in question, BTW.
>
>Don't fool yourself - that's what Hans is selling.  Target market: ISV.
>  
>
Hunh?  No, target market is hackers who like to spend a weekend dreaming 
up funky new kinds of files.  One guy (Jason Holt, clever guy) came up 
with an idea for write only files for which even root cannot read the 
parts of the file written prior to the time root was achieved, because 
the encryption key is changed in a forward computable only direction 
with every write, and the start key is kept on another computer.  Lots 
of folks will have plugins I would never dream of.   Think of photoshop 
plugins, and what plugins did for photoshop.  Same thing will happen to 
reiser4 next year (or earlier).

>Marketed product: a set of hooks, the wider the better, no matter how
>little sense it makes.  The reason for doing that outside of core kernel:
>bypassing any review and being able to control the product being sold (see
>above).
>
>Shame that it got an actual filesystem mixed in with the marketing plans
>and general insanity...
>
>
>  
>
I am one of those free software hippy-child anarchists who thinks that 
random people should come up with ideas and contribute them.  You 
understand me well.;-)
