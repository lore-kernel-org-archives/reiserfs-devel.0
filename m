From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 needs more testers
Date: Mon, 29 Mar 2004 11:04:52 -0800
Message-ID: <40687354.1060604@namesys.com>
References: <200403291659.i2TGxQ214736@mail.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17579-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200403291659.i2TGxQ214736@mail.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: markw@osdl.org
Cc: Nikita@namesys.com, Reiserfs-Dev@namesys.com, Reiserfs-List@namesys.com, Linux-Kernel@Vger.Kernel.ORG, cliff@lindows.com, tom.welch@lindows.com, garloff@suse.de, drobbins@gentoo.org, reiserrf@hotmail.com

This was the parallel fsync benchmark?

Hans

markw@osdl.org wrote:

>I've run through another test on STP with the latest snapshot against
>reiser4 and reiserfs for comparison.  Reiser4 still seems to be lagging
>behind reiserfs in our DBT-2 workload (the bigger number is better in
>the metric):
>
>          metric  url to test results
>          ------  ---------------------------------
>reiser4   1208    http://khack.osdl.org/stp/290774/
>reiserfs  1819    http://khack.osdl.org/stp/290775/
>
>Mark
>
>On 26 Mar, Hans Reiser wrote:
>  
>
>>We have one NFS related bug remaining, and one mmap all of memory 
>>related bug (and performance issue) that you can hit using iozone.  We 
>>will fix both of these in next week's snapshot, they were both multi-day 
>>bug fixes.  When they are fixed, unless users/distros find bugs next 
>>week we will submit it for inclusion in the -mm and then the official 
>>kernel.
>>
>>We hope it is now fairly stable for average users if you avoid those two 
>>issues (we need to get rid of those dire warnings about its 
>>stability...., we will remember that next snapshot....;-) )
>>
>>We need a lot more real user testers, because we have run out of scripts 
>>that can crash it, and there are distros that would like to ship it 
>>soon.  Please also complain to vitaly@namesys.com and ramon@namesys.com 
>>about poor documentation, etc., ....
>>
>>The new reiser4 snapshot (against 2.6.5-rc2) is available at
>>
>>http://www.namesys.com/snapshots/2004.03.26/
>>    
>>
>
>
>
>  
>


-- 
Hans

