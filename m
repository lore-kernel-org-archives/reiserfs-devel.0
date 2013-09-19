From: Evgeniy <iron.udjin@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Thu, 19 Sep 2013 13:23:16 +0300
Message-ID: <CAL2jS+nC+gsqhhYy7Jrkc_e6qvz5zxG6+bVPci0uFB+iHEpDLw@mail.gmail.com>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so>
 <52394C69.8060702@gmail.com> <20130918065443.Horde.-Gtb6JT-2v7Q9BY_bLJ8wg9@mail.thieu.so>
 <52394F6B.5000902@gmail.com> <CAL2jS+mJrpsgB5JoZcqBF30jfPiGPn4d8+VpoDr8tyQ1wo=THw@mail.gmail.com>
 <5239AB0F.6070600@gmail.com> <CAL2jS+ns8GAU=wsLXksHJTtABgHWs+a7rJrQN9bsGvy7egmvAA@mail.gmail.com>
 <CAL2jS+khnOhFvDv3DtoSjE13WAZ4uRau_NnrQ2Khf_iK-Fyemg@mail.gmail.com>
 <20130918160919.Horde.HvCMYcUZQA7KSHMKlRg1Rg6@mail.thieu.so>
 <CAL2jS+neTxbxD5pddwC7FfEwZFNQYdS_caCZY_qgqxqWjQysww@mail.gmail.com>
 <20130918163939.Horde.TaamgVT0paLHGh-r_Nd_Gw9@mail.thieu.so>
 <CAL2jS+=46FB7D80QSKk=8KRqKMe=haAxkL-h7TuTBwjU5yNaJQ@mail.gmail.com>
 <20130918232403.Horde.bNNl42nj7ZN7__sS0HomGg7@mail.thieu.so>
 <20130919012522.Horde.SdpNwqxAO_FZ7iRKEdPc8g5@mail.thieu.so>
 <CADW=+3=znbq=KDqCmzQ_eq=V_9i4VpHj_uOcB3joJbZUZPNtdA@mail.gmail.com>
 <20130919054528.Horde.bmycD1ZWneqw9p_4lgZGxw1@mail.thieu.so>
 <523AC019.6010700@gmail.com> <CAL2jS+kbtA0LSEJMW7uMMXd5gLnDZym73Ai_j94PznP9A60dow@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=38gfdiyMVkO7tD/MvEpA6ZEGHCezOvAPmGi0RrOwwus=;
        b=Q3WVRCs2dgvlgARqLs6T8avzz8F+s+i3RTRhvBezJn5JseKdTwVdgu4+qcYz+N1axr
         Mfzxj9/Ui6bXU022imaaMXB26vdtCJeXMFvGjvilSUqPQi9CfcAd/fJL+UQZj3RsLyJH
         qYdPSs6TQ4iJXgk/Gv6Kx/qXN9LuD7VSQdCYWE4X6/CZRv71TskUxx5uKM1fTIth0rBc
         2lVbyX3EsLnNPPAQaCMYi3clbOsAz2xHnjB6A/ucNhsyEPUhUI6mozlrfjgBG2ZNf0Wq
         nQn/Vl+UicHsIVSQnenPUJlAZ7FwqSnr53eqkoNxba1j48GsBflkmPJXfa10GrSdS9tC
         Pb1w==
In-Reply-To: <CAL2jS+kbtA0LSEJMW7uMMXd5gLnDZym73Ai_j94PznP9A60dow@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Mathieu Belanger <m@thieu.so>, Du?an ?oli? <dusanc@gmail.com>, Chris Gentile <cnjgentile@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

=46orgot to say, I had the same problem with 3.10 kernel. Currently I
have empty folder which I can't delete. Ofcource if I do fsck it will
fix the folder.

# rm -rf locale
rm: cannot remove 'locale': Directory not empty
# ls -la locale/
total 1
drwxr-xr-x 2 16446 50 3 Sep 19 13:08 .
drwxr-xr-x 3 16446 50 3 Sep 19 13:08 ..

On 19 September 2013 13:10, Evgeniy <iron.udjin@gmail.com> wrote:
> Thanks Edward!
>
> Here is bug:
> [  896.719638] reiser4[mc(30523)]: reiser4_unlink_common
> (/usr/src/linux-3.11.1-geek/fs/reiser4/plugin/inode_ops.c:300)[nikita=
-3398]:
> WARNING: Cannot unlink 6774687 (-2)
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
>>>
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
>>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
