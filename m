From: Hans Reiser <reiser@namesys.com>
Subject: Re: Do xml-like namespaces make sense for Reiser4? (re: metas thread)
Date: Tue, 13 Apr 2004 11:28:59 -0700
Message-ID: <407C316B.80606@namesys.com>
References: <407AB9AE.3060801@pobox.com> <407ADCBF.8000609@namesys.com> <407AEA05.50004@pobox.com> <407BFBEA.5010006@pobox.com> <407C15D9.1080705@namesys.com> <407C1BE9.8010509@pobox.com> <407C279A.3060303@namesys.com> <407C3004.3070401@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17903-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <407C3004.3070401@pobox.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "John D. Heintz" <jheintz@pobox.com>
Cc: reiserfs-list@namesys.com

John D. Heintz wrote:

> Hans Reiser wrote:
>
>> John D. Heintz wrote:
>>
>>> Hans Reiser wrote:
>>>
>>> Let me verify something: You are suggesting that the "metas" 
>>> namespace be the entry point for all of the plugin namespaces? I had 
>>> assumed that each plugin would create it's own. That does certainly 
>>> reduce the scope of my problem.
>>
>>
>>
>> It can use metas, but what it does is up to it.  metas is a style 
>> convention.
>>
> Okay, that is what I thought originally. That still means that user 
> defined names and plugin defined names can in general conflict though.
>
>>
>> this is the beauty of there being an official maintainer for reiserfs 
>> to handle such issues;-)
>>
> I would have been much happier to hear some strategy would enable 
> plugins names to disambiguate themselves from each other and user 
> defined names. In practice you might be right that a few dozen plugins 
> can be "officially" integrated without too much trouble. Also, this 
> issue could be dealt with later as well - I don't think now is the 
> only opportunity for addressing it.
>
>> plugins are not created as easily as files;-), there will be few 
>> enough that I can manage the issue as it happens
>>
> Yes, in the short to medium term you are probably right that you can 
> deal with these issues as they happen. I'd like there to be some 
> better way of dealing with resolving conflicts from unified namespaces 
> then always "ask Hans".
>
> Does some sort of syntactic shorthand actually break the set theoretic 
> naming system rules?  Or is this just something you view as needless 
> complexity?

precisely what syntactic shorthand?

>
> Thanks for the replies,
>
> John Heintz
>
>
>


-- 
Hans

