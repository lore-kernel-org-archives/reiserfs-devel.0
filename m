From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser4 data journalling?
Date: Fri, 29 Aug 2003 04:21:01 +0400
Message-ID: <3F4E9C6D.2080009@namesys.com>
References: <3F4E3AF9.2060100@tupshin.com> <16206.16138.72832.920045@laputa.namesys.com> <3F4E6AA4.3030900@namesys.com> <20030829001814.GB9019@zero>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15482-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030829001814.GB9019@zero>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tom Vier <tmv@comcast.net>
Cc: Reiserfs List <reiserfs-list@namesys.com>

Tom Vier wrote:

>On Fri, Aug 29, 2003 at 12:48:36AM +0400, Hans Reiser wrote:
>  
>
>>full data journaling means that if you perform writes that are 4k or 
>>less, and page align them, they will be performed atomically. 
>>    
>>
>
>would it be much more difficult to allow non-page aligned bufs to be written
>atomically? a fully atomic fs would be very nice. otherwise, a lot of utils
>and shell builtins would have to be modded to insure page alignment. it
>would be neat if all the regular builtins (cp, mv, ln) were atomic. of
>course, even neater would be the ability to group multiple ops into one
>atomic action. (this is probably already planned - it's been a while since i
>read the reiserfs4 paper on the namesys site.)
>
>  
>
reiser4 does all this that you ask for, although the user space API is 
not yet compiling;-)

-- 
Hans


