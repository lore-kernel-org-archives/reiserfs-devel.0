From: Hans Reiser <reiser@namesys.com>
Subject: Re: Proposal for keying encrypted filesystem
Date: Mon, 07 Apr 2003 20:55:53 +0400
Message-ID: <3E91AD99.2070001@namesys.com>
References: <200303282026.23543.phma@webjockey.net> <3E8DBE93.8BAEAF29@namesys.com> <3E8DD2C6.2040106@namesys.com> <200304041901.52770.phma@webjockey.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13606-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304041901.52770.phma@webjockey.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pierre Abbat <phma@webjockey.net>
Cc: reiserfs-list@namesys.com, reiserfs-dev@namesys.com

Pierre Abbat wrote:

>On Friday 04 April 2003 13:45, Hans Reiser wrote:
>  
>
>>Edward Shushkin wrote:
>>    
>>
>>>On the
>>>other hand, on the last seminar we made a conclusion to check key
>>>validness in oredr to avoid a possible security hole when read() first
>>>looks for uptodate (decrypted!) pages in memory before reading encrypted
>>>data from disk..
>>>      
>>>
>>So how about making a key of 0 be a special case which gets you the file
>>in its encrypted form?
>>    
>>
>
>Sounds good, but we need to limit who can access the ciphertext. Otherwise the 
>tape monkey could get out his infinite typewriter and trash the backup.
>
>
>
>  
>
I don't understand you.  The tape operator can use bad tape and trash 
the backup that way also....

-- 
Hans


