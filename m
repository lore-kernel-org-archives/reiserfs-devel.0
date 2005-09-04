From: Hans Reiser <reiser@namesys.com>
Subject: Re: journal size reiserfs vs reiser4
Date: Sat, 03 Sep 2005 20:48:01 -0700
Message-ID: <431A6E71.4060105@namesys.com>
References: <4317FD1B.504@namesys.com>	 <Pine.GSO.4.44L.0509021620380.23379-100000@unix2.cc.ksu.edu> <b14e81f005090318046ee67d7e@mail.gmail.com> <431A5E43.4060005@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25853-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <431A5E43.4060005@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: thenewme91@gmail.com, Matt Stegman <matts@ksu.edu>, reiserfs-list@namesys.com

David Masover wrote:

>michael chang wrote:
>  
>
>>On 9/2/05, Matt Stegman <matts@ksu.edu> wrote:
>>    
>>
>
>  
>
>>That said, I'd be half-satisfied if a repacker is released months or
>>years earlier because it doesn't efficiently handle weird cases (so
>>long as it remembers to try and repack free space too).  As for the 5%
>>error; a warning is safer.  Either that, or put in a force option to
>>get around the "error".
>>    
>>
>
>A mount option specifying the amount of space to reserve?
>
>You probably don't want to disable the limit altogether.  Some people
>might go the other way, forcing at least 15-25% of the disk to be free
>for performance reasons.  I think the mount option is safest, and
>certainly safer than trying to do this per-process.
>
>
>
>  
>
This is a bit arrogant, but I believe that a user that does not know how
to recompile the kernel with the #define changed is not sophisticated
enough to know how much he is going to hurt his performance by going
from 95% to 99% space used, and a user who does not want to bother with
recompiling is not going to study the topic enough to realize he is
making a mistake 80% of the time.  It is important to know when
designing a product when your users intuitions are going to be wrong
80%of the time, and while one should always be slow to reach such a
conclusion, I think this is such a case.

Hans
