From: Evgeniy <iron.udjin@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Wed, 18 Sep 2013 00:22:50 +0300
Message-ID: <CAL2jS+k1d55AT+os41gAgWya6zRRW0wckL+5k0=-EL2FatMEEA@mail.gmail.com>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so>
 <5238B2FF.5060900@gmail.com> <CAL2jS+kR_NmF-vc2UqnJyCodh2_F3LdciAtsTXgcp=4QKCXauQ@mail.gmail.com>
 <5238BD79.6030005@gmail.com> <CAL2jS+nhaFh-axsDiLj4puDnJMmLrcj1m1qbovVhewDroc+uqQ@mail.gmail.com>
 <5238C666.6080703@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=2XPwkMqlA7SVGA/h52wnV40/pIzEtWJeB+YpRdL/ZgE=;
        b=mYFucAXSzFSCXvHFPL+3KqoGwmPn541krAU8QJzW2xfDv8dsEkXW9oTWTVhZuywuHl
         uC37vXJ9Q5q/PPPkZQrGJ4+yTL24oN7dqhdVRBhm4mFD93R79Gm9405l7hwQNj9rtW9m
         tMa64yhjv23CrnOrjHNEuxx/wIHt7BvXUE3xeB9dZMjhVoz7lvai/TwP9V2037bx0jQb
         nGzYfe4XonEKLYEMykkb85VO3f6NJx1gGh1Kb2SA0Oa1+TvKX3qhHvPRt94oxO0Y/MXq
         GD5sgLuTQBKlVKc5K5RYkpbHQV989gxGqSs3B8nYvTwgxmbUMBuiIWxD/CBZ7wRzH/1A
         UwhQ==
In-Reply-To: <5238C666.6080703@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Gentile <cnjgentile@gmail.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Mathieu Belanger <m@thieu.so>, reiserfs-devel@vger.kernel.org

On 18 September 2013 00:15, Chris Gentile <cnjgentile@gmail.com> wrote:
> unny you should mention those specific patches, I use the 3.11 kernels with
> exactly all the same patches with the exception of the BLD patch because I
> don't know how it could work in conjunction with the CK1 BFS scheduler?

Actually I don't use BFS scheduller because it's buggy. Usually I
apply CK patch and switch off BFS in kernel configuration settings. As
far as I remember, BLD works fine with BFS.

> Or are you using different schedulers on different servers depending on workload type?
Yes, exactly.

Thanks for patch.
