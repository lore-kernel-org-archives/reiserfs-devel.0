From: Hans Reiser <reiser@namesys.com>
Subject: Re: Can ReiserFS solve this?
Date: Mon, 28 Apr 2003 19:21:02 +0400
Message-ID: <3EAD46DE.4060306@namesys.com>
References: <3EAD34D5.8030108@solidcode.net> <20030428143231.GA11226@namesys.com> <200304281442.h3SEgVdA003758@turing-police.cc.vt.edu> <881620305.20030428165358@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13870-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <881620305.20030428165358@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Anders Widman wrote:

>>On Mon, 28 Apr 2003 18:32:31 +0400, Oleg Drokin said:
>>    
>>
>
>  
>
>>>How about such a generic solution:
>>>
>>>you create /incoming/.temp (or /incoming.tmp), all the files are being writte
>>>      
>>>
>>n
>>    
>>
>>>there. When write is complete, you just do rename(2) from tempdir to /incomin
>>>      
>>>
>>g
>>    
>>
>
>  
>
>>Oleg:  A very good solution, except there are chucklehead admins at the
>>remote site that refuse to make changes to their end, and this solution
>>would require a change at the remote end to do a FTP rename.. ;)
>>    
>>
>
>
>   Which  still  should  be  less  expencive  than having to resort to
>   making  custom programs on your side. Use money as argument.. Works
>   most of the time ;)
>
>   //Anders
>
>
>--------
>PGP public key: https://tnonline.net/secure/pgp_key.txt
>
>
>
>  
>
We can quote a price that you can use to bang their heads in with if you 
want.;-)

-- 
Hans


