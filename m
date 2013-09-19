From: Evgeniy <iron.udjin@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Thu, 19 Sep 2013 13:10:25 +0300
Message-ID: <CAL2jS+kbtA0LSEJMW7uMMXd5gLnDZym73Ai_j94PznP9A60dow@mail.gmail.com>
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
 <20130919054528.Horde.bmycD1ZWneqw9p_4lgZGxw1@mail.thieu.so> <523AC019.6010700@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=MGewcOhKainHDn9S3v0BSdLnznUe2fhXM7+RCm0dBzQ=;
        b=hJQLWb6kX0VvJd2nStaBnIohDbzE6zhrkrnR6UyrwknfpwBYEwaZkWJGrxNJUPe3IF
         dr4REMkh7x22DmnRxDc9wwtQVPGXcQWX2Z63biJ+0WMmEdWr5tVYM0zF/c6t8K2WI0G9
         /LAl6x6LG3UDopAtpd80Elm5/2bqzKI5UQ19tyqloFEeGd2LT0VbGkWeZrlBAPoX4OoB
         7/+mDb0kNM/itawDo+PSvLmvGfQSx0TapDOnmW6p/ifFrBJ0lHn82SeXsBpNtVi4gRbd
         HD8jDSx94Wm9URufzJGgUrJMFjCw+0yf+NYQmnibg02gaOXka98CWzlEaG+pjyEmEi1E
         /gLA==
In-Reply-To: <523AC019.6010700@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Mathieu Belanger <m@thieu.so>, Du?an ?oli? <dusanc@gmail.com>, Chris Gentile <cnjgentile@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Thanks Edward!

Here is bug:
[  896.719638] reiser4[mc(30523)]: reiser4_unlink_common
(/usr/src/linux-3.11.1-geek/fs/reiser4/plugin/inode_ops.c:300)[nikita-3=
398]:
WARNING: Cannot unlink 6774687 (-2)

On 19 September 2013 12:12, Edward Shishkin <edward.shishkin@gmail.com>=
 wrote:
> So, the tested stuff is on sourceforge as usual.
>
> Github repos is only for people who want to help with porting.
>
> Thanks,
> Edward.
>
>
> 19.09.2013 07:45, Mathieu Belanger =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>
>>
>> Hi,
>>
>> You have three possibility.
>>
>> 1 - > Wait until the next week end or so for the official release
>> 2 - > Search the web to find the version that will be released next =
week
>> (I found it, you can find it.)
>> 3 - > I have made one too without using the other I found on the int=
ernet,
>> it's less clean but it's available on my git right now if you really=
 want it
>> now. Note that I don't think anyone else tested it at it's current w=
orking
>> state but i'm currently using it emerging stuff on Gentoo without is=
sue.
>>
>> For #3
>> git clone https://github.com/DestroyFX/reiser4 (wait +-800mb)
>> cd reiser4
>> git checkout reiser4-for-3.11
>> git diff v3.11 reiser4-for-3.11 > /tmp/reiser4-for-3.11.patch
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-d=
evel"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
