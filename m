From: Hans Reiser <reiser@namesys.com>
Subject: Re: A couple of questions
Date: Thu, 16 May 2002 19:13:29 +0400
Message-ID: <3CE3CC99.6020802@namesys.com>
References: <OF54BB8C34.FF8C1E71-ON85256BBB.00511367@pok.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10339-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steve Pratt <slpratt@us.ibm.com>
Cc: Oleg Drokin <green@namesys.com>, reiserfs-list@namesys.com

Steve Pratt wrote:

>Hans Reiser wrote:
>  
>
>>Oleg Drokin wrote:
>>    
>>
>
>  
>
>>>Hello!
>>>
>>>On Thu, May 16, 2002 at 01:42:48PM +0400, Hans Reiser wrote:
>>>
>>>
>>>
>>>      
>>>
>>>>>>Second, what is the option to keep fsck from prompting for 'Yes' when
>>>>>>running.  I need to exec this without additional input.  Seems like
>>>>>>            
>>>>>>
>quiet
>  
>
>>>>>>should do it, but it doesn't.
>>>>>>
>>>>>>
>>>>>>            
>>>>>>
>>>>>Hans has a decision that this should not be done for now because
>>>>>reiserfsprogs are in active bugfixing stage.
>>>>>
>>>>>
>>>>>          
>>>>>
>>>>?
>>>>I don't understand this.:-/
>>>>
>>>>
>>>>        
>>>>
>>>You have said "We do not trust reiserfsck to be run automatically without
>>>user confirmation"
>>>
>>>Bye,
>>>   Oleg
>>>
>>>
>>>      
>>>
>>Ah, now I remember the conversation.  Yes, if we put the option in,
>>someone will get the bright idea to run it at every boot (and they might
>>be a distro or appliance vendor:-/), and fsck is not as reliable as
>>journaling so this should not be done.
>>    
>>
>
>  
>
>>So, why do you want to exec it without additional input?
>>    
>>
>
>Because I have already prompted for input from the EVMS interface.  The
>FSIMs in EVMS provide for EVMS to coordinate actions with the file systems
>such are shrinking the filesystem before shrinking the volume.  We also
>provide interfaces for mkfs, fsck and defrag (if supported by the file
>system).  So the FSIM prompts for all of the options to be passed to the
>file system utility and then invokes it.  In the case of fsck I have
>already prompted for all the options and the user is explicitly asking for
>fsck on this volume.  Since the prompt is output on stdout it may not be
>visible to a GUI user.
>
>Steve
>
>
>
>
>Hans
>
>
>
>
>
>
>
>
>  
>
Do you print the reiserfs credits?

Hans


