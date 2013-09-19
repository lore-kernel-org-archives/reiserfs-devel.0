From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Thu, 19 Sep 2013 12:24:48 +0200
Message-ID: <523AD0F0.8060804@gmail.com>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so> <52394F6B.5000902@gmail.com> <CAL2jS+mJrpsgB5JoZcqBF30jfPiGPn4d8+VpoDr8tyQ1wo=THw@mail.gmail.com> <5239AB0F.6070600@gmail.com> <CAL2jS+ns8GAU=wsLXksHJTtABgHWs+a7rJrQN9bsGvy7egmvAA@mail.gmail.com> <CAL2jS+khnOhFvDv3DtoSjE13WAZ4uRau_NnrQ2Khf_iK-Fyemg@mail.gmail.com> <20130918160919.Horde.HvCMYcUZQA7KSHMKlRg1Rg6@mail.thieu.so> <CAL2jS+neTxbxD5pddwC7FfEwZFNQYdS_caCZY_qgqxqWjQysww@mail.gmail.com> <20130918163939.Horde.TaamgVT0paLHGh-r_Nd_Gw9@mail.thieu.so> <CAL2jS+=46FB7D80QSKk=8KRqKMe=haAxkL-h7TuTBwjU5yNaJQ@mail.gmail.com> <20130918232403.Horde.bNNl42nj7ZN7__sS0HomGg7@mail.thieu.so> <20130919012522.Horde.SdpNwqxAO_FZ7iRKEdPc8g5@mail.thieu.so> <CADW=+3=znbq=KDqCmzQ_eq=V_9i4VpHj_uOcB3joJbZUZPNtdA@mail.gmail.com> <2013091905
 4528.Horde.bmycD1ZWneqw9p_4lgZGxw1@mail.thieu.so> <523AC019.6010700@gmail.com> <CAL2jS+kbtA0LSEJMW7uMMXd5gLnDZym73Ai_j94PznP9A60dow@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=emE9JJcdpjZEC7bBNzyvO64fLkrZ4x5Qai61oWWc+/o=;
        b=UbtcUYgoH4AAB1pgXVI2X0bO47ImfFMcCjhg7e03DkaYh0KFqhyJfpkOJvP+5R66L1
         /hxOD4Oo8aWiMGCW6BLUwJn6whc70jUt6QGgBrrsWGSxmnKfoTw8P6hZJcQHWIkUUDAj
         RUPMGoMvVsZZQx8ioQBTCQAcX6QXMT1tdNv7amycioYAZ/tRVt6tJ4OLNAJxw0wIuu4w
         TjhHiFx1Nz9B3Z2l/2AvjnePnuZDZuF0mOSxH5iZbcLEi4+5S795Wliv5vmwFqzp99SP
         Ey3BDRP0vxm/6bFkXhsNArxnvwabODLckRVZNGQXwowfhGCZFnoGEzvED0ip3r2H2XZR
         0P0g==
In-Reply-To: <CAL2jS+kbtA0LSEJMW7uMMXd5gLnDZym73Ai_j94PznP9A60dow@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Evgeniy <iron.udjin@gmail.com>
Cc: Mathieu Belanger <m@thieu.so>, Du?an ?oli? <dusanc@gmail.com>, Chris Gentile <cnjgentile@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

19.09.2013 12:10, Evgeniy =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> Thanks Edward!
>
> Here is bug:
> [  896.719638] reiser4[mc(30523)]: reiser4_unlink_common
> (/usr/src/linux-3.11.1-geek/fs/reiser4/plugin/inode_ops.c:300)[nikita=
-3398]:
> WARNING: Cannot unlink 6774687 (-2)


Yes, I do have also a similar report from Bringfried Stecklum.
We'll fix it later. Use fsck for now to make the files removable.

Thanks,
Edward.


>
> On 19 September 2013 12:12, Edward Shishkin <edward.shishkin@gmail.co=
m> wrote:
>> So, the tested stuff is on sourceforge as usual.
>>
>> Github repos is only for people who want to help with porting.
>>
>> Thanks,
>> Edward.
>>
>>
>> 19.09.2013 07:45, Mathieu Belanger =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>>> Hi,
>>>
>>> You have three possibility.
>>>
>>> 1 - > Wait until the next week end or so for the official release
>>> 2 - > Search the web to find the version that will be released next=
 week
>>> (I found it, you can find it.)
>>> 3 - > I have made one too without using the other I found on the in=
ternet,
>>> it's less clean but it's available on my git right now if you reall=
y want it
>>> now. Note that I don't think anyone else tested it at it's current =
working
>>> state but i'm currently using it emerging stuff on Gentoo without i=
ssue.
>>>
>>> For #3
>>> git clone https://github.com/DestroyFX/reiser4 (wait +-800mb)
>>> cd reiser4
>>> git checkout reiser4-for-3.11
>>> git diff v3.11 reiser4-for-3.11 > /tmp/reiser4-for-3.11.patch
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe reiserfs-=
devel"
>>> in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
