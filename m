From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 problems
Date: Mon, 20 Oct 2003 16:29:36 +0400
Message-ID: <3F93D530.4000105@namesys.com>
References: <3F928BE3.6070201@cyberone.com.au>	<3F929B2E.3020509@namesys.com> <16275.46362.247930.879666@laputa.namesys.com> <3F93CFD7.60808@cyberone.com.au> <3F93D089.5010807@cyberone.com.au> <3F93D294.60706@namesys.com> <3F93D4FD.8000801@cyberone.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15867-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F93D4FD.8000801@cyberone.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nick Piggin <piggin@cyberone.com.au>
Cc: Nikita Danilov <Nikita@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Nick Piggin wrote:

>
>
> Hans Reiser wrote:
>
>> Nick Piggin wrote:
>>
>>>
>>>
>>> Nick Piggin wrote:
>>>
>>>>
>>>> filesystem created with default options, mounted with 
>>>> noatime,nodiratime.
>>>> I'll try without the extra mount options now.
>>>>
>>>
>>> still no good
>>>
>>>
>>>
>>>
>> It is hardware error....
>
>
>
> Perhaps. However the same hardware can take heavy stressing with ext2,
> reports no errors with "badblocks", has never had any data corruption or
> any SCSI error reported unless using Reiser4, etc etc.
>
>
>
>
did you use the badblocks program?

-- 
Hans


