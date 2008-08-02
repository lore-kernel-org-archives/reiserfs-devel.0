From: "Ryan Hope" <rmh3093@gmail.com>
Subject: Re: reiser4 for 2.6.27-rc1
Date: Sat, 2 Aug 2008 19:18:26 -0400
Message-ID: <48f7fe350808021618j12841ab3v85c219766c724150@mail.gmail.com>
References: <48f7fe350808010649l1111f48enbb6eca3cfcbba67f@mail.gmail.com>
	 <20080801162548.GD8654@mit.edu>
	 <48f7fe350808010934k32b9de09we657e57087a3e3a5@mail.gmail.com>
	 <20080801164541.GF8654@mit.edu> <489352D8.2020700@gmail.com>
	 <489390C6.8020903@gmail.com>
	 <48f7fe350808020847iff03890nc6d910f7b77fee9e@mail.gmail.com>
	 <4894E621.8090300@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=c0827xMG+12nxx27wfOj3j3nB7onI1tBLE6sQrY2DTU=;
        b=XHI7PAJv12R5tu6vyOMbIOdu6x4Ku1+mwqTG8y63+ELiNGX91DExu1J0U0tXDDRz72
         HHvVpORCiBzCC2GAm1DPntXxxH7pANvfHfk1TTqnJKjAuNQFLBOEFKrB2b6zA0xUFhzg
         J6rrXYshqawP/57SuvGu6TfI+Qb7Ss0mrNXk0=
In-Reply-To: <4894E621.8090300@gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Theodore Tso <tytso@mit.edu>, Ric Wheeler <ricwheeler@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

So the purpose of that "plugins" document is just to "defend" the
present state of the reiser4 code?

On Sat, Aug 2, 2008 at 6:56 PM, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> Ryan Hope wrote:
>> Can you explain a little more what this "plugin design documentation"
>> actually is and how it supposed to help?
>> -Ryan
>>
>>
>
> This document is to define plugins, etc primitives (like conversion
> of run-time objects) used in reiser4, and to describe all reiser4
> interfaces, so that it will be clear that VFS functionality is not
> duplicated, there are not VFS layers inside reiser4, etc. (many items
> are devoted to interaction between VFS and reiser4).
> I am sorry, but these concepts (which are very central) have not been
> worked out carefully enough at the moment of this 3-year-old review:
> http://kerneltrap.org/node/5330
>
> Edward.
>
>> On Fri, Aug 1, 2008 at 6:40 PM, Edward Shishkin
>> <edward.shishkin@gmail.com> wrote:
>>
>>> Ric Wheeler wrote:
>>>
>>>> Theodore Tso wrote:
>>>>
>>>>> On Fri, Aug 01, 2008 at 12:34:53PM -0400, Ryan Hope wrote:
>>>>>
>>>>>
>>> Hi, I am here :)
>>> Join our mailing list:
>>>
>>> http://vger.kernel.org/vger-lists.html#reiserfs-devel
>>> http://marc.info/?l=reiserfs-devel&r=1&w=2
>>>
>>> There are many interesting tasks to resolve/investigate..
>>>
>>>
>>>>>> Hmmm, removing the plugin support might not be so hard....  I might
>>>>>> have to try this...
>>>>>>
>>> Please, don't try to do this.
>>>
>>> I am working on the plugin design document. It will be ready
>>> approximately in September. I believe that it'll address all the
>>> mentioned complaints.
>>>
>>>
>>>>>> I am not impressed with btrfs yet.
>>>>>>
>>>>>>
>>>>> Well, if you're going to work on reiser4 (and I think there were other
>>>>> people who had also expressed interest/plans to work on it; you might
>>>>> try doing a search on the various mailing lists so you can coordinate
>>>>> with them and avoid duplicating work), my suggestion to you would be
>>>>> to find the comments that were made by the reviewers way back when,
>>>>> and make sure those comments have been addressed.
>>>>>
>>>>> Then, re-requests a code review, and promise that you won't abuse, and
>>>>> insult the integrity and impugn the motivations of the reviewers
>>>>>
>>> Well, Ted, I'll promise ;)
>>> We'll adhere strictly the propositional logic in the review thread..
>>>
>>> Thanks,
>>> Edward.
>>>
>>>
>>>>> like
>>>>> Hans did, and hopefully after they review the code, fix those problems
>>>>> as well.  Then you can try resubmitting for inclusion.
>>>>>
>>>>> Best regards,
>>>>>
>>>>>                                              - Ted
>>>>>
>>>>>
>>>> My most up to date information is that Edward is still actively
>>>> working on reiser4....
>>>>
>>>> ric
>>>>
>>>>
>>>>
>>>
>>>
>>
>>
>
>
