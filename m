From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Reiser4/2.6.11 dbench hang
Date: Thu, 07 Apr 2005 23:12:09 +0200
Message-ID: <4255A229.9010709@gmx.net>
References: <4249D57F.8020809@gmx.net>	 <1112188350.4761.671.camel@tribesman.namesys.com>	 <424B0A4F.8010809@gmx.net>	 <1112219882.4650.759.camel@tribesman.namesys.com>	 <424B299E.5020805@gmx.net> <1112290038.22814.10.camel@tribesman.namesys.com> <424DA147.2020903@gmx.net> <42549D81.5020702@parkheights.dyndns.org> <42549EAB.8000602@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23802-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42549EAB.8000602@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: sergey ivanov <seriv@parkheights.dyndns.org>, reiserfs-list@namesys.com

David Masover schrieb:
> sergey ivanov wrote:
> 
>>>So how about this deadlock? Is there any expectation about fix for it?
>>>    Wbr,
>>>        Sergey.
>>>
>>>Christian Mayrhuber wrote:
>>>
>>>
>>>>Vladimir Saveliev schrieb:
>>>>
>>>>
>>>>>This problem is fixed, but running your test during several hours caused
>>>>>reiser4 crash. It just happened, so, tomorrow I will take a look at it.
>>>>>
>>>>
>>>>I was able to deadlock kernel 2.6.11 + reiser4-for-2.6.11-3.patch.gz
>>>>+ elevator=cfq.
> 
> 
> Is it just with elevator=cfq?
> 
> BTW, I heard something about anticipatory being bad (IO only goes one
> way at a time).  Is this true?
> 

I couldn't reproduce the deadlock with
kernel 2.6.11 + reiser4-for-2.6.11-3.patch.gz + anticipatory
scheduler while running dbench for 4 hours.
With cfq it deadlocked during the first cleanup phase of dbench
(running with 90 clients).

Note: With AS the system was nearly unuseable when running dbench.
Issuing "su" on the shell lasted 34 seconds till the password
prompt appeared.

-- 
lg, Chris
