From: cami <camis@mweb.co.za>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Sat, 03 Apr 2004 21:34:08 +0200
Message-ID: <406F11B0.5090902@mweb.co.za>
References: <20040402172735.76368.qmail@web25009.mail.ukl.yahoo.com> <406EFB72.6000009@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17681-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <406EFB72.6000009@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

>>>> 1. Leave the "metas" directory as it is, for storing
>>>> the meta data hierarchy.
>>>
>>> We will do 1.
>>
>> What is the plan for addressing the name clash
>> problems that this causes?  (eg. I copy a directory,
>> that happens to contain a "metas" directory, to my
>> Reiser4 partition)
>>
> these problems will not exist significantly in reality.  Look at netapps 
> and snapshots and clearcase and other filesystems, I remember wondering 
> if .snapshot could be a problem when netapps were new and it was never a 
> problem.
> 
> People who find it is a problem can #define it to something else.  If 5 
> people bother to do so, I will be surprised.
> 
> Many languages have reserved keywords.....

Not sure if anyone  has bothered to check if this would
impose the  limitation  that  people are worried about.

 From a  quick glance,  none  of  the linux distro's have
ever  had  a  file / directory  called  "metas"  before.
`metas`  isn't even a real a word anyway  (at  least not
an english word) so the chances of  it being a big issue
are very very  small..  freshmeat.net's search shows not
even one hit  for  the word  metas and  that pretty much
the majority of linux/coding related projects..

Regards,
Cami

