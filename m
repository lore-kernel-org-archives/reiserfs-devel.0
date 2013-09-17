From: Chris Gentile <cnjgentile@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Tue, 17 Sep 2013 21:25:22 +0000
Message-ID: <5238C8C2.1080905@gmail.com>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so> <5238B2FF.5060900@gmail.com> <CAL2jS+kR_NmF-vc2UqnJyCodh2_F3LdciAtsTXgcp=4QKCXauQ@mail.gmail.com> <5238BD79.6030005@gmail.com> <CAL2jS+nhaFh-axsDiLj4puDnJMmLrcj1m1qbovVhewDroc+uqQ@mail.gmail.com> <5238C666.6080703@gmail.com> <CAL2jS+k1d55AT+os41gAgWya6zRRW0wckL+5k0=-EL2FatMEEA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=8B8MlfPrBoh3hDJxRYQXsWqa7xfkPgeI/8awSqxxmmA=;
        b=hVJuOb3Pwtci20JKydjbOl7D8E2E3hfNz+WPTss6fkSC/0ds2fcXwh2PY4fjMqGdk8
         gETnVXrCEMahzvKvoeCS74bLh0VSZRgkQdjbT3LOLJM0bQny2IKR+6a1XjExQVK2ZEVX
         p+bPHU1oRKG+ME/lNPqT4Smaly5voUsGDF3xBKqL2bjjr5gbl6k0YVBM2bXwPUuOVM2J
         jO9dGMomlKPZ1aKygJwMgC0li9J+AGBBkn60Q82Yil4qta4A1otn3FbCsHi3JRGK5Scp
         /IZ+2wbt9XlzxvlW1XpY1GZQGQUyPh1utADGBckihXC3OVtJFCS6Plq6pEYQVbjZiTw+
         AwSA==
In-Reply-To: <CAL2jS+k1d55AT+os41gAgWya6zRRW0wckL+5k0=-EL2FatMEEA@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Evgeniy <iron.udjin@gmail.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Mathieu Belanger <m@thieu.so>, reiserfs-devel@vger.kernel.org

Very interesting, is the BLD faster for you?
the new 442 BFS doesn't seem buggy whatsoever fyi if you haven't tested it


On 09/17/2013 09:22 PM, Evgeniy wrote:
> On 18 September 2013 00:15, Chris Gentile <cnjgentile@gmail.com> wrote:
>> unny you should mention those specific patches, I use the 3.11 kernels with
>> exactly all the same patches with the exception of the BLD patch because I
>> don't know how it could work in conjunction with the CK1 BFS scheduler?
> Actually I don't use BFS scheduller because it's buggy. Usually I
> apply CK patch and switch off BFS in kernel configuration settings. As
> far as I remember, BLD works fine with BFS.
>
>> Or are you using different schedulers on different servers depending on workload type?
> Yes, exactly.
>
> Thanks for patch.

