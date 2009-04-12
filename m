From: Toby Thain <toby@telegraphics.com.au>
Subject: Re: [PATCH] reiserfs: kill-the-BKL
Date: Sun, 12 Apr 2009 00:05:19 -0400
Message-ID: <8E218B71-7FED-463D-8F43-B3D5FFA3E0D0@telegraphics.com.au>
References: <1239070789-13354-1-git-send-email-fweisbec@gmail.com> <87tz4x97uq.fsf@basil.nowhere.org> <alpine.LFD.2.00.0904090831000.4583@localhost.localdomain> <20090409184022.GA2665@elte.hu> <20090409193635.GO14687@one.firstfloor.org>
Mime-Version: 1.0 (Apple Message framework v753.1)
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20090409193635.GO14687@one.firstfloor.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: Andi Kleen <andi@firstfloor.org>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>


On 9-Apr-09, at 3:36 PM, Andi Kleen wrote:

>> Using a mutex seems like the sane choice here. I'd advocate spinlocks
>> for a new filesystem any day (but even there it's a fine choice to  
>> have
>> a mutex, if top of the line scalability is not an issue).
>>
>> But for a legacy filesystem like reiser3, which depended on the BKL
>
> reiser3 is much more widely used in the user base than a lot of "non
> legacy" file systems. It's very likely it has significantly
> more users than ext4 for example. Remember that it was the default  
> file system
> for a major distribution until very recently.

... and based on track record probably still should be :/


--Toby
(Who has no idea why good solid code that works really well magically  
gets labelled 'legacy' and shelved in favour of flaky, immature code.)


> I also got a few
> reiser3 fs still around, it tended to perform very well
> on kernel hacker workloads.
>
> Given all that I think the current performance penalties Frederic  
> reports
> are not acceptable. Dropping BKL is not a cause in itself, but should
> just improve performance.
>
>> auto-dropping on schedule() it would be rather fragile to use  
>> spinlocks,
>> and it would take forever to validate the result.
>
> Not convinced it would be that hard. It could be probably done with  
> some
> straight forward static code analysis. And after that since there's
> not much development going anymore it's unlikely to break again.
>
> -Andi
>
> -- 
> ak@linux.intel.com -- Speaking for myself only.
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs- 
> devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

