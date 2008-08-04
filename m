From: "Dushan Tcholich" <dusanc@gmail.com>
Subject: Re: reiser4 for 2.6.27-rc1
Date: Mon, 4 Aug 2008 13:34:34 +0200
Message-ID: <a08621850808040434i2e593119x88514ca17b2d9dd3@mail.gmail.com>
References: <48f7fe350808010649l1111f48enbb6eca3cfcbba67f@mail.gmail.com>
	 <48f7fe350808010934k32b9de09we657e57087a3e3a5@mail.gmail.com>
	 <20080801164541.GF8654@mit.edu> <489352D8.2020700@gmail.com>
	 <489390C6.8020903@gmail.com>
	 <48f7fe350808020847iff03890nc6d910f7b77fee9e@mail.gmail.com>
	 <4894E621.8090300@gmail.com>
	 <48f7fe350808021618j12841ab3v85c219766c724150@mail.gmail.com>
	 <4896E3DC.4070704@gmail.com>
	 <a08621850808040418wf7c7a4awe192eeb6865cf975@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=qFMGjKAmGzFOVLCJiOemQCy+zdownMZC2cRmH6BqPyo=;
        b=JFUYa8aFBjtR9EmNzLGYD8N4BEoFMY0mUETOsGxCsUfau9622wMIUot5ezpyXgsQCe
         sXBklOqmQeHv6l4RNBRDkNEPrBd+Kzdjhd8zsNjTyIL7rkq4dWUqFaFmq6Ow/KCyH4qB
         w6jylnyZDkXY71K6BR5+SYNxaXS+OL3S7q7ns=
In-Reply-To: <a08621850808040418wf7c7a4awe192eeb6865cf975@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Ryan Hope <rmh3093@gmail.com>, Theodore Tso <tytso@mit.edu>, Ric Wheeler <ricwheeler@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

Found it :)
akpm:
"The plugins appear to be wildly misnamed - they're just an internal
abstraction layer which permits later feature additions to be added in a
clean and safe manner.  Certainly not worth all this fuss."
http://marc.info/?l=linux-kernel&m=115442117418736&w=2

hch:
"That because the real plugins are long gone.  It's just that neither the
complainers nor the fanboys in this thread ever read the code or generally
had any clue of their own."
http://marc.info/?l=linux-kernel&m=115443267908751&w=2

Hope this is of some help.
Bye
Dushan

On Mon, Aug 4, 2008 at 1:18 PM, Dushan Tcholich <dusanc@gmail.com> wrote:
> Well as I remember akpm and hch both said that these "plugins" are
> just a way of modular programing, and not layering violation, but I
> just can't find those mails now, there were a lot of them.
>
>
> On Mon, Aug 4, 2008 at 1:11 PM, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>> Ryan Hope wrote:
>>> So the purpose of that "plugins" document is just to "defend" the
>>> present state of the reiser4 code?
>>>
>>
>> Yes. In particular.
>>
>> Plugins stuff is a way of data storage optimization and its
>> removing definitely would be a mistake. What can arise here
>> again is complaints about "layering violation". However,
>> addressing them doesn't necessarily mean removing the whole
>> plugin stuff. I hope that this document will help such discussions
>> to be more constructive.
>>
>> Thanks,
>> Edward.
>>
>>> On Sat, Aug 2, 2008 at 6:56 PM, Edward Shishkin
>>> <edward.shishkin@gmail.com> wrote:
>>>
>>>> Ryan Hope wrote:
>>>>
>>>>> Can you explain a little more what this "plugin design documentation"
>>>>> actually is and how it supposed to help?
>>>>> -Ryan
>>>>>
>>>>>
>>>>>
>>>> This document is to define plugins, etc primitives (like conversion
>>>> of run-time objects) used in reiser4, and to describe all reiser4
>>>> interfaces, so that it will be clear that VFS functionality is not
>>>> duplicated, there are not VFS layers inside reiser4, etc. (many items
>>>> are devoted to interaction between VFS and reiser4).
>>>> I am sorry, but these concepts (which are very central) have not been
>>>> worked out carefully enough at the moment of this 3-year-old review:
>>>> http://kerneltrap.org/node/5330
>>>>
>>>> Edward.
>>>>
>>>>
>>>>> On Fri, Aug 1, 2008 at 6:40 PM, Edward Shishkin
>>>>> <edward.shishkin@gmail.com> wrote:
>>>>>
>>>>>
>>>>>> Ric Wheeler wrote:
>>>>>>
>>>>>>
>>>>>>> Theodore Tso wrote:
>>>>>>>
>>>>>>>
>>>>>>>> On Fri, Aug 01, 2008 at 12:34:53PM -0400, Ryan Hope wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>> Hi, I am here :)
>>>>>> Join our mailing list:
>>>>>>
>>>>>> http://vger.kernel.org/vger-lists.html#reiserfs-devel
>>>>>> http://marc.info/?l=reiserfs-devel&r=1&w=2
>>>>>>
>>>>>> There are many interesting tasks to resolve/investigate..
>>>>>>
>>>>>>
>>>>>>
>>>>>>>>> Hmmm, removing the plugin support might not be so hard....  I might
>>>>>>>>> have to try this...
>>>>>>>>>
>>>>>>>>>
>>>>>> Please, don't try to do this.
>>>>>>
>>>>>> I am working on the plugin design document. It will be ready
>>>>>> approximately in September. I believe that it'll address all the
>>>>>> mentioned complaints.
>>>>>>
>>>>>>
>>>>>>
>>>>>>>>> I am not impressed with btrfs yet.
>>>>>>>>>
>>>>>>>>>
>>>>>>>>>
>>>>>>>> Well, if you're going to work on reiser4 (and I think there were other
>>>>>>>> people who had also expressed interest/plans to work on it; you might
>>>>>>>> try doing a search on the various mailing lists so you can coordinate
>>>>>>>> with them and avoid duplicating work), my suggestion to you would be
>>>>>>>> to find the comments that were made by the reviewers way back when,
>>>>>>>> and make sure those comments have been addressed.
>>>>>>>>
>>>>>>>> Then, re-requests a code review, and promise that you won't abuse, and
>>>>>>>> insult the integrity and impugn the motivations of the reviewers
>>>>>>>>
>>>>>>>>
>>>>>> Well, Ted, I'll promise ;)
>>>>>> We'll adhere strictly the propositional logic in the review thread..
>>>>>>
>>>>>> Thanks,
>>>>>> Edward.
>>>>>>
>>>>>>
>>>>>>
>>>>>>>> like
>>>>>>>> Hans did, and hopefully after they review the code, fix those problems
>>>>>>>> as well.  Then you can try resubmitting for inclusion.
>>>>>>>>
>>>>>>>> Best regards,
>>>>>>>>
>>>>>>>>                                              - Ted
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>> My most up to date information is that Edward is still actively
>>>>>>> working on reiser4....
>>>>>>>
>>>>>>> ric
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>
>>>>>
>>>>
>>>
>>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
>
