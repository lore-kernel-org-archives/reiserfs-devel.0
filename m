From: Hans Reiser <reiser@namesys.com>
Subject: Reiser4 performance is almost completely restored now
Date: Fri, 30 Jul 2004 11:28:38 -0700
Message-ID: <410A9356.5060405@namesys.com>
References: <20040726173552.20ECA15EBD@mail03.powweb.com> <410558FC.40204@namesys.com> <41056FFF.4010208@namesys.com> <4105FDFA.1090308@namesys.com> <410833F9.501@namesys.com> <20040729152103.GN4881@backtop.namesys.com> <410A57C6.3020501@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19870-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <410A57C6.3020501@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "E. Gryaznova" <grev@namesys.com>
Cc: Vladimir Saveliev <vs@namesys.com>, Alex Zarochentsev <zam@namesys.com>, reiserfs-dev@namesys.com, ReiserFS List <reiserfs-list@namesys.com>

If you look at the benchmarks cited below, we have our performance back, 
and the slight difference in performance remaining might be within 
normal benchmark variation, we have to run it again and check.

Hans

E. Gryaznova wrote:

> Alex Zarochentsev wrote:
>
>> On Thu, Jul 29, 2004 at 03:17:13AM +0400, Elena Gryaznova wrote:
>>  
>>
>>> Hans Reiser wrote:
>>>
>>>   
>>>
>>>> E. Gryaznova wrote:
>>>>
>>>>     
>>>>
>>>>> Hans Reiser wrote:
>>>>>
>>>>>       
>>>>
> [skipped]
>
>>> I tried to find what reiser4 changes cause the reiser4 CREATE 
>>> performance degradation.
>>>
>>> There is a "reiser4, CREATE" chart :
>>>
>>> http://www.namesys.com/intbenchmarks/mongo/04.07.26/256MB.RAM/reiser4-performance-degradation/charts/CREATE.png 
>>>
>>>
>>> (while reading this chart, please notice that some tests were 
>>> performed twice or more times)
>>>
>>> My conclusion is :
>>> 1) the first degradation was invited by 1.1614.1.1 snapshot :
>>> ChangeSet@1.1614.1.1, 2004-06-25 16:33:37+04:00, 
>>> zam@crimson.namesys.com
>>> flush_some_atom: force atom to commit if jnode_flush() does not 
>>> submit nodes to disk even if it
>>> has progress in processing nodes (in case of large fragmented 
>>> overwrite set, for example).
>>>   
>>
>>
>> Yes. I know it might be too strong commit policy.
>> I have ideas how to fix the fix -- we can repeat jnode_flush() until 
>> we submit
>> something to disk -- if one slum goes into overwrite set completely 
>> second one
>> may have something sorted to relocate set. Current code commits atom 
>> after first
>> jnode_flush which has submitted to disk nothing.
>>
>>  
>>
>
> Performance is restored :
>
> http://thebsh.namesys.com/intbenchmarks/mongo/04.07.26/256MB.RAM/reiser4-performance-degradation/charts/CREATE-performance-back.png 
>
>
> http://thebsh.namesys.com/intbenchmarks/mongo/04.07.26/256MB.RAM/reiser4-performance-degradation/r4-create-performance-back.txt 
>
>
> Thanks,
> Lena
>
>>  
>>
>>> 2) for the second one the "vs debugging code" is responsible. It is 
>>> started from
>>> ChangeSet@1.1623, 2004-07-20 12:08:38+04:00, 
>>> reiser4@tribesman.namesys.com
>>> debugging code
>>>
>>> Thanks,
>>> Lena.
>>>
>>>   
>>
>>
>>  
>>
>
>
>
>

