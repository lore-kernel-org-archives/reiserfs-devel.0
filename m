From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Reiser4/2.6.11 dbench hang
Date: Thu, 31 Mar 2005 00:35:10 +0200
Message-ID: <424B299E.5020805@gmx.net>
References: <4249D57F.8020809@gmx.net>	 <1112188350.4761.671.camel@tribesman.namesys.com>	 <424B0A4F.8010809@gmx.net> <1112219882.4650.759.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23742-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1112219882.4650.759.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com

Vladimir Saveliev schrieb:
> Hello
> 
> On Thu, 2005-03-31 at 00:21, Christian Mayrhuber wrote:
> 
>>Vladimir Saveliev schrieb:
>>
>>>Hello
>>>
>>>On Wed, 2005-03-30 at 02:23, Christian Mayrhuber wrote:
>>>
>>>
>>>>Hi,
>>>>
>>>>If I'm running plain 2.6.11(.0) patched with 
>>>>reiser4-for-2.6.11-broken-out.2.gz I can hang reiser4 when running
>>>
>>>
>>>When you say "hang reiser4" do you mean that system freezes completely
>>>(does not respord to key pressing, etc)?
>>
>>dbench-3.02 stuck in its cleanup phase when simulating 200 clients but
>>it kept reporting the benchmark statistics every second.
>>
> 
> 
> ok, the problem is found already. I hope to make a fix tomorrow

Wow. Fantastic job.

-- 
lg, Chris
