From: Hans Reiser <reiser@namesys.com>
Subject: Re: mongo_copy: cp: cannot stat	`/mnt/testfs/testdir0-0-0/f92':	Input/output
 error
Date: Wed, 04 Aug 2004 18:44:22 -0700
Message-ID: <411190F6.8030602@namesys.com>
References: <20040804065840.17C7915C7C@mail03.powweb.com>	 <4110A0FA.3030007@namesys.com> <4110A38E.6070905@namesys.com>	 <4110A561.9050200@namesys.com> <4110DBD6.7010904@namesys.com>	 <20040804183801.GU1284@nysv.org>  <41115962.1030407@namesys.com>	 <1091659605.8276.3.camel@leto.cs.pocnet.net> <411177E1.1040209@namesys.com> <1091664410.9177.2.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20013-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1091664410.9177.2.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Christophe Saout <christophe@saout.de>
Cc: =?ISO-8859-1?Q?Markus_T=F6rnqvist?= <mjt@nysv.org>, "Vladimir V. Saveliev" <vs@namesys.com>, David Dabbs <david@dabbs.net>, reiserfs-list@namesys.com

Christophe Saout wrote:

>Am Mittwoch, den 04.08.2004, 16:57 -0700 schrieb Hans Reiser:
>
>  
>
>>>>V4 likes stack.  If someone can convince me that kmalloc is as efficient 
>>>>as stack, I'd like to hear it, because I know I lack expertise on the topic.
>>>>   
>>>>
>>>>        
>>>>
>>>The disassembled fast path of kmalloc (with a size of the object known
>>>at compile time) fits on one page. Most of the time it will just return
>>>a pointer from a pool of cached and cache-hot objects.
>>>
>>>      
>>>
>>whereas using stack is 0 instructions or?
>>    
>>
>
>More or less. But who's counting? ;-)
>
>  
>
0 is less than a page, by a lot, if done a lot, and we do.
