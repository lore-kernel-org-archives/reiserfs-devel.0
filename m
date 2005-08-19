From: Hans Reiser <reiser@namesys.com>
Subject: Re: 15M files
Date: Fri, 19 Aug 2005 15:50:09 -0700
Message-ID: <43066221.2040807@namesys.com>
References: <5a59ce53050819144970d07ab0@mail.gmail.com>	 <43065D7D.2000802@namesys.com> <5a59ce53050819153961a71cde@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25584-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <5a59ce53050819153961a71cde@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: studdugie <studdugie@gmail.com>
Cc: reiserfs-mailing-list <reiserfs-list@namesys.com>, vs@namesys.com

studdugie wrote:

>I can't use V4 because I can't introduce an unstable kernel on the box
>where the app is running.
>  
>
I suggest you ask vs to send you a patch for the stable kernel on
wednesday or so after we send our latest bundle to akpm (probably on
monday we will send it).

>On 8/19/05, Hans Reiser <reiser@namesys.com> wrote:
>  
>
>>studdugie wrote:
>>
>>    
>>
>>>Hello. I'm looking to replace a couple Berkeley DB data stores w/
>>>regular file system directories backed by reiserfs (3.6). The reason
>>>is Berkeley DB is slow especially for data w/ little or no locality of
>>>reference. I'm posting to this list because I would like to get some
>>>opinions on if reiserfs is suitable for the job. Currently there are
>>>15,079,597 records in 1 of the database. If I moved to a directory
>>>based db it would result in 15,079,597 discreet files ranging in sizes
>>>      
>>>
>>>from 1 byte to 1kb. I was reading the FAQ on the namesys site and it
>>    
>>
>>>mentioned that the r5 hash supports 1,200,000 files w/o collision.
>>>Since 15M is 12.5x greater I'm expecting massive amounts of
>>>collisions. So the question becomes how bad should I expect it to be?
>>>Should I assume the file system can handle it or slow to a crawl?  I
>>>would really appreciate some feedback from the experts before I go
>>>ripping out the Berkeley DB code.
>>>
>>>Thanx.
>>>
>>>
>>>
>>>
>>>      
>>>
>>Use V4, it has much better hashiing.
>>
>>    
>>
>
>
>  
>

