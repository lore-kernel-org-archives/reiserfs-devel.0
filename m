From: Hans Reiser <reiser@namesys.com>
Subject: Reiser4 slowed down, Elena has found the changesets responsible,
 we will fix it.....
Date: Thu, 29 Jul 2004 00:31:38 -0700
Message-ID: <4108A7DA.3020605@namesys.com>
References: <20040726173552.20ECA15EBD@mail03.powweb.com> <410558FC.40204@namesys.com> <41056FFF.4010208@namesys.com> <4105FDFA.1090308@namesys.com> <410833F9.501@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19851-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <410833F9.501@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "E. Gryaznova" <grev@namesys.com>
Cc: reiserfs-dev@namesys.com, Alexander Zarochentcev <zam@namesys.com>, David Dabbs <david@dabbs.net>, ReiserFS List <reiserfs-list@namesys.com>, vs <vs@thebsh.namesys.com>

I thought the list would be interested to know.

Zam, this is your task, except for the debugging code, which is vs's.

vs, I want you to ensure that it is not possible to leave debugging code 
on without being warned of it.

Good work elena.

Hans

E. Gryaznova wrote:

>
>>>
>> So, is reiser4 slower or is ext3 faster....?
>
>
> Hello.
>
> I tried to find what reiser4 changes cause the reiser4 CREATE 
> performance degradation.
>
> There is a "reiser4, CREATE" chart :
>
> http://www.namesys.com/intbenchmarks/mongo/04.07.26/256MB.RAM/reiser4-performance-degradation/charts/CREATE.png 
>
>
> (while reading this chart, please notice that some tests were 
> performed twice or more times)
>
> My conclusion is :
> 1) the first degradation was invited by 1.1614.1.1 snapshot :
> ChangeSet@1.1614.1.1, 2004-06-25 16:33:37+04:00, zam@crimson.namesys.com
>  flush_some_atom: force atom to commit if jnode_flush() does not 
> submit nodes to disk even if it
>  has progress in processing nodes (in case of large fragmented 
> overwrite set, for example).
>
> 2) for the second one the "vs debugging code" is responsible. It is 
> started from
> ChangeSet@1.1623, 2004-07-20 12:08:38+04:00, 
> reiser4@tribesman.namesys.com
>  debugging code
>
> Thanks,
> Lena.
>
>
>>
>> Zam, please comment.
>>
>> Hans
>>
>>
>
>
>
>

