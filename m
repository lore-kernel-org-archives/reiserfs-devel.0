From: Evgeniy <iron.udjin@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Wed, 18 Sep 2013 19:24:04 +0300
Message-ID: <CAL2jS+neTxbxD5pddwC7FfEwZFNQYdS_caCZY_qgqxqWjQysww@mail.gmail.com>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so>
 <5238B2FF.5060900@gmail.com> <CAL2jS+kR_NmF-vc2UqnJyCodh2_F3LdciAtsTXgcp=4QKCXauQ@mail.gmail.com>
 <5238BD79.6030005@gmail.com> <CAL2jS+nhaFh-axsDiLj4puDnJMmLrcj1m1qbovVhewDroc+uqQ@mail.gmail.com>
 <20130917211510.Horde.Zc6miMwWvs-M3goxK91zdw1@mail.thieu.so>
 <5238D17D.1080806@gmail.com> <20130918034441.Horde.FO9Ni879mCm-vV7kvTW6yg1@mail.thieu.so>
 <523944D2.40409@gmail.com> <20130918062035.Horde.3REQSHqc8XUbgvTNKMOnnw1@mail.thieu.so>
 <52394C69.8060702@gmail.com> <20130918065443.Horde.-Gtb6JT-2v7Q9BY_bLJ8wg9@mail.thieu.so>
 <52394F6B.5000902@gmail.com> <CAL2jS+mJrpsgB5JoZcqBF30jfPiGPn4d8+VpoDr8tyQ1wo=THw@mail.gmail.com>
 <5239AB0F.6070600@gmail.com> <CAL2jS+ns8GAU=wsLXksHJTtABgHWs+a7rJrQN9bsGvy7egmvAA@mail.gmail.com>
 <CAL2jS+khnOhFvDv3DtoSjE13WAZ4uRau_NnrQ2Khf_iK-Fyemg@mail.gmail.com> <20130918160919.Horde.HvCMYcUZQA7KSHMKlRg1Rg6@mail.thieu.so>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=YoKMRO8Yb8CVtfWDxeAFbnppjM8AwhETf7wWelZAYM0=;
        b=r9a8wH7hfCcpJ1CDaNlRJ1fHYByPVx9n938Oxvu/6l9Mg3e+h1Hz8RbuKMcITfJaqr
         etJCb6UTFRtOv8fOcMP6rtud4qBHrEDOdrM7iQ3gCFH5YXPqx223//ICASJqCLqB8yEi
         +bevYMasnpzXUcAiTkTnNlJzp7GVFjgH3rhOf0HvRnfppLguBRtCoWRls/J5ZXPo84E7
         YMHYh4o86QFDvVW3CwiqSULYr6BFnc34NgPxefKXBDPADNcnT302uEoWIwlsOFBd47PD
         6U2kDjealKU8kfqB49JvAf874V6DCqGEWH1FQv1HgOn7FshGYXsUYN/SjDhKSn1TVSPH
         ULDA==
In-Reply-To: <20130918160919.Horde.HvCMYcUZQA7KSHMKlRg1Rg6@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Belanger <m@thieu.so>
Cc: Chris Gentile <cnjgentile@gmail.com>, Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

It means that after I applied patch compiled kernel loads with
traceback and freeze on init start. I need deeper investigation where
I did mistake. Sorry.

On 18 September 2013 19:09, Mathieu Belanger <m@thieu.so> wrote:
>
> I was not able to apply them if it's what you mean ?
>
> It compile but I did not test it, if the "don't work" mean that the
> kernel fail in a sort of way let my know and I will revert back on the
> git.
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
