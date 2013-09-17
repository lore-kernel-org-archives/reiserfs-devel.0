From: Evgeniy <iron.udjin@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Wed, 18 Sep 2013 00:35:30 +0300
Message-ID: <CAL2jS+kqJSWumiAuT1N83e7r4K-Sh3ki_FztL4u_Kh5L18qFTA@mail.gmail.com>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so>
 <5238B2FF.5060900@gmail.com> <CAL2jS+kR_NmF-vc2UqnJyCodh2_F3LdciAtsTXgcp=4QKCXauQ@mail.gmail.com>
 <5238BD79.6030005@gmail.com> <CAL2jS+nhaFh-axsDiLj4puDnJMmLrcj1m1qbovVhewDroc+uqQ@mail.gmail.com>
 <5238C666.6080703@gmail.com> <CAL2jS+k1d55AT+os41gAgWya6zRRW0wckL+5k0=-EL2FatMEEA@mail.gmail.com>
 <5238C8C2.1080905@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=4AiGNOQ03MQCXYHbq8O/dbxXmsX9yHtasXvxKGwBXDY=;
        b=Ph+GcRSH9SmuniLwSGqS8OpO85rU79c05Hj8sZwZGUniRZnSmZVimM69F5i6CMgSOI
         sowKco1SQ/BkmxszPc6hNMzfG8tSBrahyujlMjcTOJA+ZOmmQpvIy8D+kHkhQtJwtoRd
         8MBTVLtH7FmQvAGiuHOpoECNHRaaM2UbHb1bhF+Z41Fem624fYMWB1wpGIiUrkr+VCEy
         R4KYb88OH9Nf6o9lSksfe3/cYxSKmxyx6w/g+89pNCCPsXdwkpujR5rc2YC2LDlZETU9
         cDIZoMuI8jxsDkZH0cNhb+smW6CC3NubLTst6USsUBh6JwI6/BzRqNf4omE18XcvGNbD
         /Szw==
In-Reply-To: <5238C8C2.1080905@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Gentile <cnjgentile@gmail.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Mathieu Belanger <m@thieu.so>, reiserfs-devel@vger.kernel.org

On 18 September 2013 00:25, Chris Gentile <cnjgentile@gmail.com> wrote:
> Very interesting, is the BLD faster for you?
To be clear, BLD is not process scheduller. It's load distribution
technique with works with any process scheduller you prefer.
> the new 442 BFS doesn't seem buggy whatsoever fyi if you haven't tested it
Ok, I'll test it. Thanks for hint.

Let's continue discuss reiser4 (not alternative patches of something
like that) otherwise somebody kick us from here :)

>
>
> On 09/17/2013 09:22 PM, Evgeniy wrote:
>> On 18 September 2013 00:15, Chris Gentile <cnjgentile@gmail.com> wrote:
>>> unny you should mention those specific patches, I use the 3.11 kernels with
>>> exactly all the same patches with the exception of the BLD patch because I
>>> don't know how it could work in conjunction with the CK1 BFS scheduler?
>> Actually I don't use BFS scheduller because it's buggy. Usually I
>> apply CK patch and switch off BFS in kernel configuration settings. As
>> far as I remember, BLD works fine with BFS.
>>
>>> Or are you using different schedulers on different servers depending on workload type?
>> Yes, exactly.
>>
>> Thanks for patch.
>
