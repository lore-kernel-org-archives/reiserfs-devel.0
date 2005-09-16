From: =?iso-8859-2?B?o3VrYXN6IE1pZXJ6d2E=?= <prymitive@pcserwis.net>
Subject: Re: why does reiserfs list get so much spam?
Date: Fri, 16 Sep 2005 21:51:38 +0200
Message-ID: <op.sw7n4cazd4os1z@localhost>
References: <432A9BFD.10700@mch.one.pl> <20050916104129.GA11025@kruemel> <432AA409.5070006@interia.pl> <Pine.LNX.4.63.0509161259560.21130@alpha.polcom.net> <432AAA38.9000102@mch.one.pl> <e692861c05091605406ad2908@mail.gmail.com> <op.sw64fwxad4os1z@localhost> <432B0DD0.80206@slaphack.com> <432B0FAC.4050905@mch.one.pl> <432B143B.8030808@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26006-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <432B143B.8030808@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: David Masover <ninja@slaphack.com>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Dnia Fri, 16 Sep 2005 20:51:39 +0200, David Masover <ninja@slaphack.com> na=
pisa=B3:

> Tomasz Chmielewski wrote:
>> David Masover schrieb:
>>
>> (...)
>>
>>>> If You will look in the headers of messages that You get from this list
>>>> You will see that there is spamassassin running on thebsh.namesys.com,
>>>> it's just that it is not configured good enough.
>>>
>>>
>>>
>>> Can spamassassin be configured "good" enough?
>>>
>>> I use dspam:
>>>
>>> http://www.nuclearelephant.com/projects/dspam/
>>>
>>> There are some articles about why dspam has a fundamentally better
>>> design than spamassassin, and why in general statistical filters beat
>>> manual-rule-based ones like spamassassin.
>>
>>
>> Yeah spamassassin can work extremely well.
>>
>> I guess these articles are based on the quality of spamassassin which
>> checks spam from this list? :)
>>
>> And it's not really true that spamassassin is a manual-rule-based filter
>> only.
>
> Right, but the statistical/learning component of spamassassin is just
> that -- a component, to be combined with razor/pyzor, manual rules, and
> anything else they can think of.  I think dspam does a much better job
> at being a statistical filter, and that's all it does -- and that's all
> it needs to.  Some people have reported 99.997% accuracy from dspam,
> beating humans.
>
> Anyway, the articles are about the principle of the thing.  A
> statistical filter will beat a manual one every time, because it's
> faster and better at coming up with rules, and you don't need to update
> your definitions to start filtering the new spam -- just train on two or
> three mails, and you're done.
>

SpamAssassin uses bayes so You don't need any definitions for SA to detect =
new spam, it learns itself if message have enough points.
All You have to do is learn SA with sa-learn after instaling.
