From: Hans Reiser <reiser@namesys.com>
Subject: Re: repost for readdir
Date: Thu, 24 Jun 2004 11:27:59 -0700
Message-ID: <40DB1D2F.4010303@namesys.com>
References: <1088032186.12051.8.camel@murdock.llnl.gov> <40DB0D73.3070605@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19356-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40DB0D73.3070605@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: jenn sirp <sirp1@llnl.gov>, reiserfs-list@namesys.com

Vladimir V. Saveliev wrote:

> Hello
>
> jenn sirp wrote:
>
>> Hi,
>>
>> I'd like to thank you guys for your help earlier this year with the
>> initial phase of my project. I was able to implement FIFO queueing
>> functionality in Reiser v3. It is not very elegant, but I am still
>> learning. I was able to steer my supervisor in the direction of Reiser4.
>> It appears that the design principles of the new system will make it 
>> very
>> valuable for many at the Lab.
>>
>> That said, and back to Hans' suggestion of a readdir implementation for
>> FIFO and LIFO file queuing... I have some questions. If anyone can 
>> answer
>> them, has advice, or suggestions that would be so great.
>>
>> Here's where I am at, and what I don't know:
>>
>>> From what I can tell, files in the reiserfs 'Directory Item' aren't 
>>> preserved in
>>
>> the order they are written due to deletes and other operations. So if I
>> were to access the Directory Item to generate a list for readdir I 
>> couldn't be certain that they would be in first
>> created -to- last created order.
>
We sort in hash order, not creation order.

>>
>> If readdir has to sort the files in the directory every time it is 
>> called
>> it seems like it would be a bit of a performance hit.
>
>
> Do you mean readdir library function? It reads directory and fills 
> dirent structures. It does not sort anything. It even does not stat 
> files names of which it reads.
>
> Should another
>
>> structure be maintained that preserves the order as the files are
>> written... and should readdir use that as it's basis for returning the
>> directory contents?
>>
>
> Are you trying to optimize ls -l?
>
> Please describe in more details what are you trying to do.
>
>> If this is a question that doesn't belong here... please let me know 
>> and I apologize.
>>
>> Thanks,
>>
>> Jenn
>>
>>
>>
>
>
>
>
Please consider working with V4, it will be easier and more useful I think.
