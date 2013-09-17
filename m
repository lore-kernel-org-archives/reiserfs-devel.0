From: Chris Gentile <cnjgentile@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Tue, 17 Sep 2013 20:37:13 +0000
Message-ID: <5238BD79.6030005@gmail.com>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so> <5238B2FF.5060900@gmail.com> <CAL2jS+kR_NmF-vc2UqnJyCodh2_F3LdciAtsTXgcp=4QKCXauQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=cOvHrnXX26tbaZAU5KqoPmBMrFtEttLmW+GHKABu0jw=;
        b=jkqdJnclkWly1B8NTc48oU5a7wAO0BWJfv1ZFgmgS1Lxrv371iXOQ0EmCrBscA+4Gj
         hAK4KiRf4cFZx5NtAafFXZX35G1UOgW/Q98cLiZUrGY1Um2mAvGipsSMh0TYmhEJJqpz
         ETPFpZ8zYEPbtYWa3c7er6fJIdLQz0LLT5C+EJTRnPmsNCYPFK2ZVU8k4Prx6RXZmMXl
         P3XStjpalWosLkhdzbjvFbAsZq/G+AGfNmoxATpKH0aQoEETQiMvekC1n+g1zgxNOKGr
         ivmRQYeGuYsMZoLvtVxTHmRXKc8OnoG0fqGjh3CgU9djRfk0RS5+Y27kjm+VcbishuEF
         ARjw==
In-Reply-To: <CAL2jS+kR_NmF-vc2UqnJyCodh2_F3LdciAtsTXgcp=4QKCXauQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Evgeniy <iron.udjin@gmail.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Mathieu Belanger <m@thieu.so>, reiserfs-devel@vger.kernel.org

Hi Evgeniy, 

I'm the only "tester" so our group would be two... the rest are real
developers :)

Works great on 3.11.1 kernel so far, hoping it can work soon on 3.12's
but the devs will most likely wait until the official release.

It's cool that you saw some of the messages, we need to get Reiser4 back
on the map in the mainstream  ---- it's public image has been skewed as
you know by publications re: the story of Hans Reiser. i personally
could not care what happened with all that , it's terrible, but we're
focusing on a filesystem here.  The more people we can get interested
the better so we can get R4 in mainline.

Thanks!!

Chris



On 09/17/2013 08:24 PM, Evgeniy wrote:
> Hello all,
>
> I'm a active user of reiser4 filesystem. Currently I use it with LZO
> compression for Magento cache store. Let me join in your small team of
> testers of this beautiful fs :)
>
> Regarding collaboration tool, I think the best idea to use GitHub.
> It's the most user friendly IMHO.
>
> Also I'd like to ask about reiser4 over soft raid0. If I have raid0
> chunk size 4K, what is optimal cluster size of reiser4 fs?
>
> P.S: It would be perfect to implement Snappy compression algo
> https://code.google.com/p/snappy/. According to tests it has advantage
> over LZO.
>
> Thanks,
>
> On 17 September 2013 22:52, Edward Shishkin <edward.shishkin@gmail.com> wrote:
>> On 09/17/2013 08:15 PM, Mathieu Belanger wrote:
>>>
>>> Hello,
>>>
>>> I made reiser4 for kernel 3.11-rc4 patchs some time ago and I did not
>>> publish them due to a small issue I got with them and did not have time to
>>> debug it.
>>
>>
>> Yeah, it's a pity...
>>
>>
>>
>>> I think it would be a good idea to have a GIT or any kind of work
>>> collaboration tool so people don't redo what other people do on there side
>>> but instead do it in a way so other can see and fix/improve it faster.
>>>
>>> I think that the best way would be to put the last vanilla patched with
>>> reiser4 and work on it that way (so it's will be simple to simply generate
>>> the reiser4 patch from the git + vanilla)
>>
>>
>> It must be a good idea...
>>
>>
>> Thanks,
>> Edward.
>>
>>
>>> I can set it up tonight (will update my patch to the latest 3.11, instead
>>> of rc4, in the same time).
>>>
>>> --
>>> Mathieu Belanger
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

