From: =?UTF-8?Q?Marcin_Baczy=C5=84ski?= <marbacz@gmail.com>
Subject: Re: fsck.reiser4: segfault in aux_adler32 at aux.c:194
Date: Tue, 8 Feb 2011 14:45:30 +0100
Message-ID: <AANLkTim66KaTEVfuSH-xrApzQb0DS9KW60Tcmmn85sW0@mail.gmail.com>
References: <AANLkTi=5pCaXg49iC+YZ0H_HHKHjxJD-uf0O9gyyYUHa@mail.gmail.com>
	<4D4FFD74.8060903@gmail.com>
	<AANLkTinpckeMHGydA6JePBCZXw4YHKbk1Os7UChcfTLO@mail.gmail.com>
	<4D50089C.208@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:in-reply-to:references:date
         :message-id:subject:from:to:cc:content-type;
        bh=aD6NtvnaRosfYNdLt7r2d2+MUIFSOupEmJSI798LTvg=;
        b=XIStyUnKOYn1dzY0TBxH5Wc1GsE1y/3+2/k69j6paPpU5CyAKqQZ+Lr1qydwOybREk
         QGLEZaG6sJlDnfdrtU+cT1GFqIIAiQpXzPdTFjoXans4wcbL8Nkab1Ggk7xYMZQSxsEK
         LL4nDrVRD+QwffDyxsT0KfEAXIa8YgD/lELdU=
In-Reply-To: <4D50089C.208@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

>>> Could you please also try this one:
>>> http://marc.info/?l=reiserfs-devel&m=127504471326353&w=2
>>>
>>>
>>
>> This patch makes segfault go away.
>
> Please, upgrade your kernel stuff to .36 or later, if possible..

My uname says
Linux asgaard 2.6.37-hardened-r1-gentoo #4 SMP PREEMPT (...) x86_64 (...).
Of course with reiser4 patch applied.

>
> Edward.
>
