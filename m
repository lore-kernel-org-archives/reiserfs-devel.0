From: Hans Reiser <reiser@namesys.com>
Subject: Re: viewprinting: what format should views be stored in?
Date: Tue, 26 Oct 2004 21:48:01 -0700
Message-ID: <417F2881.1080300@namesys.com>
References: <20040819074027.8429715D94@mail03.powweb.com>	 <41248D43.3040905@dgreaves.com> <4124D255.2060401@comcast.net>	 <412597F9.1010707@namesys.com> <1098801919.2610.2.camel@localhost.localdomain> <417E7DCA.5010609@namesys.com> <417E81E9.8070304@speakeasy.net> <417E995C.2060207@namesys.com> <417EB19C.3090404@speakeasy.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22193-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <417EB19C.3090404@speakeasy.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: George Beshers <gbeshers@speakeasy.net>
Cc: "Lamont R. Peterson" <lamont@gurulabs.com>, ReiserFS List <reiserfs-list@namesys.com>

George Beshers wrote:

>
>
> Hans Reiser wrote:
>
>> George Beshers wrote:
>>
>>>
>>>
>>>
>>>
>>> Still, a "batch mode" for production servers is a concept that 
>>> should not be
>>> discarded too quickly as static masks would certainly support a more
>>> efficient implementation
>>
>>
>>
>> I dispute this point. What do you think would be more efficient than 
>> reiser4 directories? Or are you referring to compiled regular 
>> expressions?
>>
> Only as a secondary issue. I was thinking about the possibility of a 
> linked-list of static masks.
> In that case it would make sense to form a single "composed" mask 
> which allows access to
> just the objects that all the masks allow---basically a set intersection.
>
> Further, an interesting algorithm would be to do the intersection 
> lazily, i.e., so that the composed
> mask actually is created only for those objects (or perhaps just 
> directories) actually in a path.
> Obviously the case where this wins is when there are a lot of open 
> calls to some directory.
>
> BTW: we might call a view (as in the database sense) the "mask + name 
> mangling + ..." as Lamont's
> comment rings true.

Let's get the 80% done, and leave the 20% refinements which are as much 
code as the 80% for later.;-)

>
> Also, I downloaded a paper on evaluating RE which I can send along if 
> you and Nate are interested.

Send it when we get to evaluating REs, and I will be interested then.

>
>
>>> --- that the savings would be significant is still
>>> very much an open question.
>>>
>>>
>>>
>>
>>
>>
>
>
>

