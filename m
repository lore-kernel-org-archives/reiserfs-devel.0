From: Hans Reiser <reiser@namesys.com>
Subject: Re: precise characterization of ext3 atomicity
Date: Fri, 05 Sep 2003 01:03:03 +0400
Message-ID: <3F57A887.9040706@namesys.com>
References: <3F574A49.7040900@namesys.com> <20030904085537.78c251b3.akpm@osdl.org> <3F576176.3010202@namesys.com> <20030904091256.1dca14a5.akpm@osdl.org> <3F57676E.7010804@namesys.com> <20030904181540.GC13676@matchmail.com> <3F578656.60005@namesys.com> <20030904191255.GE13676@matchmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15565-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030904191255.GE13676@matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: Andrew Morton <akpm@osdl.org>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

Mike Fedyk wrote:

>On Thu, Sep 04, 2003 at 10:37:10PM +0400, Hans Reiser wrote:
>  
>
>>Mike Fedyk wrote:
>>
>>    
>>
>>>On Thu, Sep 04, 2003 at 08:25:18PM +0400, Hans Reiser wrote:
>>>
>>>
>>>      
>>>
>>>>In data=journal and data=ordered modes ext3 also guarantees that the 
>>>>metadata will be committed atomically with the data they point to.  
>>>>However ext3 does not provide user data atomicity guarantees beyond the 
>>>>scope of a single filesystem disk block (usually 4 kilobytes).  If a 
>>>>single write() spans two disk blocks it is possible that a crash partway 
>>>>through the write will result in only one of those blocks appearing in 
>>>>the file after recovery.
>>>>  
>>>>
>>>>        
>>>>
>>>And how does reiser4 do this without changing the userspace apps?
>>>
>>>      
>>>
>>We don't.  We just make the hovercraft, we don't force you to go over 
>>the water.....
>>    
>>
>
>So by default with no user space modifications, reiser4 will be atomic for
>each write() call, and ext3 will if it aligns withing a single page.
>
>Is that correct?
>
Yes.

>
>Then you can go on to specify that you can have larger transactions if you
>make some changes to the userspace apps.
>
>
>  
>
or you are a programmer who writes code....;-)  It's not that hard to 
write code....;-)

-- 
Hans


