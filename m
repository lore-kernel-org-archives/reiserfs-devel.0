From: Hans Reiser <reiser@namesys.com>
Subject: Re: Proposal for keying encrypted filesystem
Date: Fri, 04 Apr 2003 22:45:26 +0400
Message-ID: <3E8DD2C6.2040106@namesys.com>
References: <200303282026.23543.phma@webjockey.net> <200304031822.12677.phma@webjockey.net> <200304041401.h34E1Hli003929@turing-police.cc.vt.edu>	            <200304040930.29884.phma@webjockey.net> <200304041447.h34Eluli004869@turing-police.cc.vt.edu> <3E8DA3CF.711EE4C0@namesys.com> <3E8DB7E5.9080407@namesys.com> <3E8DBE93.8BAEAF29@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13580-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E8DBE93.8BAEAF29@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shushkin <edward@namesys.com>
Cc: Valdis.Kletnieks@vt.edu, reiserfs-list@namesys.com, reiserfs-dev@namesys.com

Edward Shushkin wrote:

>Hans Reiser wrote:
>  
>
>>Edward Shushkin wrote:
>>
>>    
>>
>>>Valdis.Kletnieks@vt.edu wrote:
>>>
>>>
>>>      
>>>
>>>>On Fri, 04 Apr 2003 09:30:29 EST, Pierre Abbat <phma@webjockey.net>  said:
>>>>
>>>>
>>>>
>>>>        
>>>>
>>>>>But I'd also like to be able to have several encrypted directories on one
>>>>>partition, with different keys, such that when I give the key any process
>>>>>with the right UID can access them. I might have a cron job that needs access
>>>>>
>>>>>
>>>>>to encrypted data.
>>>>>
>>>>>
>>>>>          
>>>>>
>>>>You need to apply "least privilege" - you don't give the key to any process
>>>>that doesn't need it.  In your example, you would make sure that any process
>>>>running under UID nnn gets given the key, so that other processes couldn't
>>>>do anything even if they *did* access them.
>>>>
>>>>Properly applied, you can even leverage it further - for instance, if your
>>>>backup process doesn't have the key tokens, you can safely let it have access
>>>>to all the files - it can read the 127 meg of data to back it up in a bitwise
>>>>manner,
>>>>
>>>>
>>>>        
>>>>
>>>I am sorry, bitwise manner seems to be impossible in reiser4: the only access
>>>to crypto files is via page cache, it requires a valid key..
>>>
>>>      
>>>
>>this is not desirable.  
>>    
>>
>
>I understand, but direct io is incompatible with transaction semantics.
>
This means what?

> On the
>other hand, on the last seminar we made a conclusion to check key validness in 
>oredr to avoid a possible security hole when read() first looks for uptodate
>(decrypted!) pages in memory before reading encrypted data from disk..
>
So how about making a key of 0 be a special case which gets you the file 
in its encrypted form?

>
>  
>
>>Encypted files need to be backed up too...
>>    
>>
>
>They will be as ordinary unix files..
>
This means what?

>Edward.
>
>  
>
>>>Edward.
>>>
>>>
>>>
>>>
>>>      
>>>
>>>>but it can't actually DO anything with the data - this is something
>>>>that you can't do in the "give everything the token" model....
>>>>
>>>> ----------------------------------------------------------------------------------------------------
>>>>  Part 1.2Type: application/pgp-signature
>>>>
>>>>
>>>>        
>>>>
>>>
>>>
>>>      
>>>
>>--
>>Hans
>>    
>>
>
>
>  
>


-- 
Hans


