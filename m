From: Hans Reiser <reiser@namesys.com>
Subject: Re: Multiple data streams...
Date: Thu, 03 Apr 2003 23:00:41 +0400
Message-ID: <3E8C84D9.3000401@namesys.com>
References: <6167696812.20030402112847@tnonline.net> <200304022240.57346.russell@coker.com.au> <114180866437.20030402150817@tnonline.net> <200304030732.31133.russell@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13554-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304030732.31133.russell@coker.com.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Russell Coker <russell@coker.com.au>
Cc: Anders Widman <andewid@tnonline.net>, reiserfs-list@namesys.com

Russell Coker wrote:

>On Wed, 2 Apr 2003 23:08, Anders Widman wrote:
>  
>
>>>The Linux API does not support multiple data streams.  Support for
>>>extended attributes has recently been added, this will do most things
>>>that you might want to do with multiple streams and does it in a standard
>>>way that is supported.
>>>      
>>>
>>  Could you give an example of this? I use multiple streams for adding
>>  thumbnails  or  text files  to pictures I am working on... - just to
>>  give an example.
>>    
>>
>
>OS/2 used EA's for icons and description text in 1992.  There's no reason why 
>EAs can't be used for this purpose today as well.
>
>  
>
Implement inherited stat data, hidden directory entries, and files and 
directories and you don't need EAs.... yes?

-- 
Hans


