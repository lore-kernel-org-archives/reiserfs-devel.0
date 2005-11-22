From: =?ISO-8859-1?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Subject: Re: More Slowdown
Date: Tue, 22 Nov 2005 13:29:16 +0100
Message-ID: <43830F1C.4060203@ursynow.2a.pl>
References: <200511171447.41362.mail@earthworm.de> <200511221123.51724.marcel@hilzinger.hu> <20051122113449.GA5284@kruemel>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27072-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20051122113449.GA5284@kruemel>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ingo Bormuth <ibormuth@efil.de>
Cc: reiserfs-list@namesys.com, ingo@bormuth.org

Ingo Bormuth wrote:
> On 2005-11-22 11:23, Marcel Hilzinger wrote:
>> Did you ever think about, that this is not a reiser4 problem, but a kernel bug 
>> or a problem related to hal? 
>>
> 
> Just to mention again:
> 
> I do not see the problem on my Laptop. I use a the clean vanilla-2.6.14.2 
> kernel manually patched with reiser-for-2.6.14-1. It's a slow laptop with
> broken DMA so I should realize if there was something wrong.
> 
> Afaik every poster complaining so far had mm-kernels, larger patchsets or
> additional stuff as swsusp2. So: Do jou see the slowdown/crashes in vanilla ?
> 
> 

yes, like i said several times (and as others also said) this bug is on 
vanilla 2.6.14.2 or 2.6.13.x. The fact that this bug is not on every 
computer doesn't mean it don't exists.

I have big slowdowns on 2.6.13 or 2.6.14 sometimes causing crash - and 
one time it caused database loss. (the bug itself doesnt cause crash i 
suppose,but the traffic i get on this server + this bug can cause crash)

its stable at 2.6.12.6

