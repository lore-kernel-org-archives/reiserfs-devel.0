From: Mathieu Segaud <matt@minas-morgul.org>
Subject: Re: 2.6.10-rc2-mm1: oops when accessing reiser4 fs's (maybe fix provided)
Date: Wed, 17 Nov 2004 17:55:51 +0100
Message-ID: <87d5ycza7c.fsf@barad-dur.crans.org>
References: <874qjptyl1.fsf@barad-dur.crans.org>
	<1100675389.1399.27.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-22398-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1100675389.1399.27.camel@tribesman.namesys.com> (Vladimir
	Saveliev's message of "Wed, 17 Nov 2004 10:09:49 +0300")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vladimir Saveliev <vs@namesys.com>
Cc: reiserfs-list@namesys.com, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@osdl.org>

Vladimir Saveliev <vs@namesys.com> disait derni=E8rement que :

> Hello
>
> On Tue, 2004-11-16 at 21:53, Mathieu Segaud wrote:
>> I tried 2.6.10-rc2-mm1 and the last reiser4 updates gave some (many many)
>> oopses flooding my screen :).
>> I tried reverting reiser4-fix-deadlock.patch and oopses are gone.
>>=20
> Would you please instead try the attached patch?=20

yep.
indeed it worked
anyway, for the quick answer

>
>> I tried this one because thru the quick traces on my screen, I saw a ref=
erence
>> to get_current_context.
>> The speed of the traces and the unasibility of the box prevented me from
>> making differences between "real" oopses and BUG_ON(), sorry for that...
>>=20
>> If you want some traces I can provide them ASAP (e.g. tomorrow)
>
>
>
>

--=20
Carrots work on rabbits, they don't work on hungry weasels.

	- Alan Cox on linux-kernel

