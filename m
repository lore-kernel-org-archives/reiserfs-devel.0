From: Hans Reiser <reiser@namesys.com>
Subject: Re: A couple of questions
Date: Thu, 16 May 2002 15:54:25 +0400
Message-ID: <3CE39DF1.5080101@namesys.com>
References: <OFDC95E87B.B541379E-ON85256BBA.0074ED07@pok.ibm.com> <20020516092034.B6880@namesys.com> <3CE37F18.1050201@namesys.com> <20020516154057.A1954@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10330-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Oleg Drokin <green@namesys.com>
Cc: Steve Pratt <slpratt@us.ibm.com>, reiserfs-list@namesys.com

Oleg Drokin wrote:

>Hello!
>
>On Thu, May 16, 2002 at 01:42:48PM +0400, Hans Reiser wrote:
>
>  
>
>>>>Second, what is the option to keep fsck from prompting for 'Yes' when
>>>>running.  I need to exec this without additional input.  Seems like quiet
>>>>should do it, but it doesn't.
>>>>        
>>>>
>>>Hans has a decision that this should not be done for now because
>>>reiserfsprogs are in active bugfixing stage.
>>>
>>>      
>>>
>>?
>>I don't understand this.:-/
>>    
>>
>
>You have said "We do not trust reiserfsck to be run automatically without
>user confirmation"
>
>Bye,
>    Oleg
>
>
>  
>
Ah, now I remember the conversation.  Yes, if we put the option in, 
someone will get the bright idea to run it at every boot (and they might 
be a distro or appliance vendor:-/), and fsck is not as reliable as 
journaling so this should not be done.

So, why do you want to exec it without additional input?

Hans


