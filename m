From: Hans Reiser <reiser@namesys.com>
Subject: Re: reiserfs on redhat advanced server?
Date: Fri, 31 Jan 2003 15:20:55 +0300
Message-ID: <3E3A6A27.4060206@namesys.com>
References: <20030130173522.3aa4d0e1.pegasus@nerv.eu.org> <3E397A19.60409@namesys.com> <20030130234142.E8448@vestdata.no> <3E3A6071.6060102@namesys.com> <20030131115333.GC15359@marowsky-bree.de> <20030131150852.A14386@t-raenon.nmd.msu.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12570-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030131150852.A14386@t-raenon.nmd.msu.ru>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: flx@msu.ru
Cc: Lars Marowsky-Bree <lmb@suse.de>, Ragnar Kj?rstad <reiserfs@ragnark.vestdata.no>, Jure Pecar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

You are not a typical sysadmin, you work for an organization with ~10 
full-time kernel hackers, and the percentage of companies out there who 
can say that their average computer users are as skilled as any of 
SuSE's staff is not very high you know....

Most companies do indeed have a real need for tech support.  If the 
distros don't support official stable linux kernels, it is a serious 
social problem for our community, as it will substantially reduce the 
user base for those kernels in corporate environments.  It is especially 
a problem if the largest vendor does it.


Hans

Alexander Lyamin wrote:

>Fri, Jan 31, 2003 at 12:53:34PM +0100, Lars Marowsky-Bree wrote:
>  
>
>>On 2003-01-31T14:39:29,
>>   Hans Reiser <reiser@namesys.com> said:
>>
>>    
>>
>>>If you want a stable kernel for a mission critical server, the only 
>>>thing that works is to ask around and find out what Marcelo kernel has 
>>>been known stable for at least 6 weeks.
>>>      
>>>
>>And lose all support from RH or SuSE because you installed a non-supported
>>kernel image ;-) And thus violate the Oracle cert, the SAP cert (well, if RH
>>had one), etc pp.
>>
>>Just something you can't do in some environments.
>>    
>>
>
>O.k. Its purely my private oppinion. and my own expirince talking here:
>
>Cant say that i benefited from SuSE support even once :)
>that's something you dont actually need on some expertise level.
>
>Oracle support might be valuable(since they really do kernel-tweaking for this monster), but its not an issue there, right? Even if NO, i made Oracle running on standart issue kernel once. Probably with some perfomance loss, have'nt tested it yet.
>
>The issue is high load (200k users) on this two puny workhorses.
>
>My expirience and Corban Dallas telling me "If you have to something done - do it yourself".
>
>2.4.19 without doubts.
>reiserfsprogs version - lets ask Vitaly Fertman.
>
>
>P.S.
>most of tech.supports i bumped (even famous Cisco TAC) suck badly anyways, so who cares ? especially when you Open Source :)
>
>  
>
>>Sincerely,
>>    Lars Marowsky-Br?e <lmb@suse.de>
>>    
>>


-- 
Hans


