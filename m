From: Hans Reiser <reiser@namesys.com>
Subject: Re: vs-8115: get_num_ver: not directory item
Date: Wed, 26 May 2004 21:00:16 -0700
Message-ID: <40B567D0.50200@namesys.com>
References: <87k6z194p1.fsf@uhoreg.ca>	 <1085466585.1914.83.camel@tribesman.namesys.com> <87y8ngcvps.fsf@uhoreg.ca> <1085562292.1915.136.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18858-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1085562292.1915.136.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: Hubert Chan <hubert@uhoreg.ca>, reiserfs-list@namesys.com

Vladimir Saveliev wrote:

>Hello
>
>On Tue, 2004-05-25 at 20:33, Hubert Chan wrote:
>  
>
>>>>>>>"Vladimir" == Vladimir Saveliev <vs@namesys.com> writes:
>>>>>>>              
>>>>>>>
>>Vladimir> Hello
>>Vladimir> On Mon, 2004-05-24 at 20:21, Hubert Chan wrote:
>>    
>>
>>>>I got that message a few times (but not every time) while doing
>>>>"apt-cache show ...".  Can someone tell me what that message means,
>>>>and if I should be worried about my data?
>>>>
>>>>        
>>>>
>>Vladimir> What kernel do you use?
>>
>>Sorry.  2.6.4.
>>    
>>
>
>vs-8115 is harmless in this kernel.
>
>  
>
>>  I might have added some of Chris Mason's patches --
>>looks like possibly journal-writer, nesting, iosize, but I'm not
>>entirely sure.
>>    
>>
>
>
>
>
>
>  
>
then you need to remove it from the code.  do so, and send me the patch.
