From: "E. Gryaznova" <grev@namesys.com>
Subject: Re: mongo benchmark results
Date: Tue, 27 Jul 2004 00:06:55 +0400
Message-ID: <4105645F.7040106@namesys.com>
References: <20040726200458.560F715CAD@mail03.powweb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19826-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040726200458.560F715CAD@mail03.powweb.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Dabbs <david@dabbs.net>
Cc: reiserfs-list@namesys.com, 'Alex Zarochentsev' <zam@namesys.com>, 'Hans Reiser' <reiser@namesys.com>

David Dabbs wrote:

>>-----Original Message-----
>>From: E. Gryaznova [mailto:grev@namesys.com]
>>Sent: Monday, July 26, 2004 2:41 PM
>>    
>>
>
>Okay, here's a recap of the mongo suggestions that I've received:
>
>Hans:
>...change file size to 8000
>...try 500 byte file sizes, with gamma of 0, just for fun.
>
>Elena:
>...run reiser4 with and without 'notail'
>  
>
not reiser4, but reiserfs notail :)
reiser4 default is enough.

>...would you please reboot before each test?
>
>Since I have limited time [mother-in-law incoming ;-)] I will run
>
>FILE_SIZE=500, 4000, 8000 	<in that order>
>
it does not matter 4k or 8k, I think.  So,  you can try to repeat 4k 
benchmark just to be sure that your previous results were correct (if 
you want, of course).

>GAMMA=0, .2				<in that order>
>R4_INFO=notail & default	<in that order>
>  
>

>For the notail runs I assume that notail should also be specified with
>reiserfs as well. Any corresponding option for ext3 or use its default as I
>have been doing?
>  
>
ext3 default is ok.

Thanks,
Lena

>Regarding rebooting, are you requesting that I reboot before each
>_individual_ run or between 'multi-run' batches 
>(e.g. #sh:/ <options> RUN <options> RUN...?)
>
>david
>
>
>
>
>
>  
>


