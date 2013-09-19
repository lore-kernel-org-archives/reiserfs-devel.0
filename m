From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Thu, 19 Sep 2013 11:12:57 +0200
Message-ID: <523AC019.6010700@gmail.com>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so> <52394C69.8060702@gmail.com> <20130918065443.Horde.-Gtb6JT-2v7Q9BY_bLJ8wg9@mail.thieu.so> <52394F6B.5000902@gmail.com> <CAL2jS+mJrpsgB5JoZcqBF30jfPiGPn4d8+VpoDr8tyQ1wo=THw@mail.gmail.com> <5239AB0F.6070600@gmail.com> <CAL2jS+ns8GAU=wsLXksHJTtABgHWs+a7rJrQN9bsGvy7egmvAA@mail.gmail.com> <CAL2jS+khnOhFvDv3DtoSjE13WAZ4uRau_NnrQ2Khf_iK-Fyemg@mail.gmail.com> <20130918160919.Horde.HvCMYcUZQA7KSHMKlRg1Rg6@mail.thieu.so> <CAL2jS+neTxbxD5pddwC7FfEwZFNQYdS_caCZY_qgqxqWjQysww@mail.gmail.com> <20130918163939.Horde.TaamgVT0paLHGh-r_Nd_Gw9@mail.thieu.so> <CAL2jS+=46FB7D80QSKk=8KRqKMe=haAxkL-h7TuTBwjU5yNaJQ@mail.gmail.com> <20130918232403.Horde.bNNl42nj7ZN7__sS0HomGg7@mail.thieu.so> <20130919012522.Horde.SdpNwqxAO_FZ7iRKEdPc8g5@mail.
 thieu.so> <CADW=+3=znbq=KDqCmzQ_eq=V_9i4VpHj_uOcB3joJbZUZPNtdA@mail.gmail.com> <20130919054528.Horde.bmycD1ZWneqw9p_4lgZGxw1@mail.thieu.so>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=cFSz7TErFY0AA3UjyS9hvGEvkAAv3jBLDmxDU/YgBQA=;
        b=vC1GO4ckurK4o+wvu+9ICqs2Inyz04BZ+0YCFwX34tb9WuUpR6Mg7bavsTNBtzp++Q
         T1r7pRKpTHZ2Am1+TQbxfbN7keCRLXRz6ogurx7yEuMLSS0dYyCTk47nnmCLRPKUok4U
         jSQ+bOBcnddVHs94WE5Nol3vwFaJuHkl+TZeTHg16jc7CGV0L5QCLCHQ9zUIF0ZMT6GE
         TnSofOERUWxn+qOn+F8LkYZzo5tbRcorctY/mW3caebfO+1K94wxKhGpbEU8fvR+S/WV
         z3f+p1lUBHGMzpOe/41beeugtCvoSie6ptwfW6F1e+CJqqLaOjLbYKhWxUyaaqs3xKQw
         EafQ==
In-Reply-To: <20130919054528.Horde.bmycD1ZWneqw9p_4lgZGxw1@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1251"; format="flowed"
To: Mathieu Belanger <m@thieu.so>
Cc: Du?an ?oli? <dusanc@gmail.com>, Evgeniy <iron.udjin@gmail.com>, Chris Gentile <cnjgentile@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

So, the tested stuff is on sourceforge as usual.

Github repos is only for people who want to help with porting.

Thanks,
Edward.


19.09.2013 07:45, Mathieu Belanger =EF=E8=F8=E5=F2:
>
> Hi,
>
> You have three possibility.
>
> 1 - > Wait until the next week end or so for the official release
> 2 - > Search the web to find the version that will be released next=20
> week (I found it, you can find it.)
> 3 - > I have made one too without using the other I found on the=20
> internet, it's less clean but it's available on my git right now if=20
> you really want it now. Note that I don't think anyone else tested it=
=20
> at it's current working state but i'm currently using it emerging=20
> stuff on Gentoo without issue.
>
> For #3
> git clone https://github.com/DestroyFX/reiser4 (wait +-800mb)
> cd reiser4
> git checkout reiser4-for-3.11
> git diff v3.11 reiser4-for-3.11 > /tmp/reiser4-for-3.11.patch
> --=20
> To unsubscribe from this list: send the line "unsubscribe=20
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
