From: Hans Reiser <reiser@namesys.com>
Subject: Re: rebuild fs
Date: Tue, 05 Aug 2003 19:09:02 +0400
Message-ID: <3F2FC88E.2070403@namesys.com>
References: <E5A63F34D141D111A6F4080009D70ACA346D62@imkedv_pdc> <20030805133509.GI13689@namesys.com> <3F2FB3C6.6000407@namesys.com> <200308051819.33317.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15151-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200308051819.33317.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vitaly Fertman <vitaly@namesys.com>
Cc: Oleg Drokin <green@namesys.com>, Thorsten Mauch <mauch@imkenberg.de>, "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>, vs <vs@thebsh.namesys.com>

Vitaly Fertman wrote:

>>>in this case (IO error) reiserfsck does abort() which ends up as signal
>>>number 5, and core is dumped if this is allowed. Looks pretty much like
>>>segfault too.
>>>Though a message is printed prior to this that we cannot read some block.
>>>
>>>Bye,
>>>   Oleg
>>>      
>>>
>>yuck.  vs, complain to vitaly please.
>>    
>>
>
>It does not look the same as the user gets different messages on the terminal.
>With hardware problems like IO errors he gets "Aborting", although this can dump
>the core file also. But what a user should not get even with the broken hardware 
>is "Segmentation fault" messages. And core dumping is what looks really pretty 
>much the same. 
>
>As some old version of reiserfsck (3.6.3) stopped unexpectedly, Oleg suggested 
>to use the latest one -- 3.6.11 -- which worked ok for now.
>
>Regarding IO errors reiserfsck prints "Block ## cannot be read" before aborting 
>and the last ones suggest to check the hardware also.
>
>BTW, if there are some bad blocks I would advise to use dd_rescue instead of dd
>as dd has some problems with bad blocks handling.
>
>  
>
ok, you fixed the unfriendliness in latest version, excellent.

-- 
Hans


