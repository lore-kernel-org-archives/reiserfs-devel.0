From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiser modification for file queuing
Date: Tue, 16 Mar 2004 22:37:59 +0300
Message-ID: <40575797.7060103@namesys.com>
References: <003101c40b10$3d8fc0f0$c435a5d1@energy> <4056A740.2010300@namesys.com> <001701c40b7f$45bdb830$4a2fa5d1@energy> <40574BC6.6050308@namesys.com> <003a01c40b8c$b1b73f40$4a2fa5d1@energy>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17252-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <003a01c40b8c$b1b73f40$4a2fa5d1@energy>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jenn sirp <sirpj@ecs.csus.edu>
Cc: reiserfs-list@namesys.com

jenn sirp wrote:

>>I mean does readdir return the queue contents in queue order?
>>
>>    
>>
>
>That would be an ideal implementation. Yes. 
>
>Thanks,
>
>Jenn
>
>
>  
>
Well I'd be happy to accept a directory plugin for reiser4 with LIFO and 
FIFO queueing implemented using readdir ordering of directory contents.

-- 
Hans

