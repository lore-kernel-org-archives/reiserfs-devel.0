From: Hans Reiser <reiser@namesys.com>
Subject: Re: Multiple data streams...
Date: Wed, 02 Apr 2003 20:43:54 +0400
Message-ID: <3E8B134A.9000807@namesys.com>
References: <6167696812.20030402112847@tnonline.net> <10168801421.20030402114712@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13533-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <10168801421.20030402114712@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Anders Widman wrote:

>>   Is this supported, or will it be supported by ReiserFS?
>>   I  use  this  feature quite quite much.. Maybe this is something to
>>   add to ReiserFS?
>>    
>>
>
>  
>
>>   There is very brief info at Microsoft's website:
>>    
>>
>
>  
>
>>  
>>http://www.microsoft.com/windows2000/techinfo/reskit/en-us/core/fncc_fil_khzt.asp
>>    
>>
>
>
>   Some uses could be to be able to store locking information (such as
>   user,  program  etc)  or extended security features within the same
>   file as a separate data stream.
>
>   There  are  of  course  numerous other things data streams could be
>   used for.
>
>   //Anders
>
>--------
>PGP public key: https://tnonline.net/secure/pgp_key.txt
>
>
>
>  
>
Maybe this belongs in the faq....

read www.namesys.com/v4/v4.html where we describe how directories and 
files can be made to do all of this better.

-- 
Hans


