From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 O_DIRECT
Date: Sun, 22 May 2005 00:43:52 -0700
Message-ID: <42903838.4070500@namesys.com>
References: <1116525192.29446.5.camel@zion> <1116578526.3532.463.camel@tribesman.namesys.com> <1695540869.20050521234900@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24104-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1695540869.20050521234900@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pysiak Satriani <pysiak.satriani@wp.pl>
Cc: reiserfs-list@namesys.com

What Vladimir failed to say was that it is our recent changes to
accomodate the kernel maintainers that are unstable, we had previously
reached the point where none of our internal tests could make it crash. 
I hope that he did not put these unstable changes on our website for
users to see them without special notes....

Hans

Pysiak Satriani wrote:

>Hello Vladimir,
>
>Friday, May 20, 2005, 10:42:06 AM, you wrote:
>  
>
>>reiser4 has not O_DIRECT support yet.
>>It will be added when the below are done:
>>1. reiser4 does not crash in our internal stress tests
>>    
>>
>I remember Hans saying that r4 is so stable that the developers themselves
>can not find any more bugs.
>
>Anyway, best of luck and greetings to the project developers.
>
>I guess the true stabilization will come once r4 is in the kernel
>as an experimental fs. Only then the number of users will grow
>rapidly. But you already know that, so...
>
>Keep on rocking dudes!
>
>--
>Best Regards,
>Maciej
>
>
>
>
>  
>

