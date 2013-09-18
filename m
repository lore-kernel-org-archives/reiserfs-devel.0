From: Chris Gentile <cnjgentile@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Wed, 18 Sep 2013 06:59:55 +0000
Message-ID: <52394F6B.5000902@gmail.com>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so> <5238B2FF.5060900@gmail.com> <CAL2jS+kR_NmF-vc2UqnJyCodh2_F3LdciAtsTXgcp=4QKCXauQ@mail.gmail.com> <5238BD79.6030005@gmail.com> <CAL2jS+nhaFh-axsDiLj4puDnJMmLrcj1m1qbovVhewDroc+uqQ@mail.gmail.com> <20130917211510.Horde.Zc6miMwWvs-M3goxK91zdw1@mail.thieu.so> <5238D17D.1080806@gmail.com> <20130918034441.Horde.FO9Ni879mCm-vV7kvTW6yg1@mail.thieu.so> <523944D2.40409@gmail.com> <20130918062035.Horde.3REQSHqc8XUbgvTNKMOnnw1@mail.thieu.so> <52394C69.8060702@gmail.com> <20130918065443.Horde.-Gtb6JT-2v7Q9BY_bLJ8wg9@mail.thieu.so>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=HEDP/ZexULV42EGxrTGTsWzC2G2rubjcII16GsODpKI=;
        b=ugpOXkzzj762CRccU1nmyhXvfKV4tlbqInZAFqlutxV67I9BkCD1GCcqbiojSHmQ2p
         LGW4OKh26mvGFcnsw47bEwy0ZNyCF1SeHYb2vzARKtqiO0XBOJN9czjj1sXmBKiIqAAA
         pj4h52NRpiKO0YN35JCRKR41gDOmJM8/XR+3In3ApNDKOKKTf+UPQKncta6IQDuhjE8s
         VSYB7R5Ze953jAOk0hUG1uOF5/mR8X64LcKNcWSm5BElJQknsHrnAset/ZiQvZpY+ZKI
         655zHAac5zg3/SW6ss+NPZnTzPgOuzGeQHahN1JnbvEJNIRC+kHpFIVSbsDUI5Ak38TO
         KM+Q==
In-Reply-To: <20130918065443.Horde.-Gtb6JT-2v7Q9BY_bLJ8wg9@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mathieu Belanger <m@thieu.so>
Cc: Evgeniy <iron.udjin@gmail.com>, Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

Don't know how to code  :(

I am in include/linux/dcache.h right now at the first line where the
error occurs...  I wonder where  I put one of the characters it suggests??
The line reads: (gives same error as you mentioned)

#define d_lock  d_lockref.lock

I guess it needs some type of character before the period?? What do you
think?




On 09/18/13 06:54, Mathieu Belanger wrote:
> you can edit the code directly.
>
> Tell me if it compile after that.
> If it compile you can make a patch with git (git diff >
> /tmp/patch.patch) or you can clone, work on your clone, commit and do
> a pull request so I can add it.
>
> I can also add you as maintainer if you want to work directly on it.
>
>
>
> Also, I get that error with 3.11 and 3.12-rc1 but not with 3.11-rc4 :
>
> In file included from fs/reiser4/super.h:14:0,
>                  from fs/reiser4/debug.c:28:
> fs/reiser4/fsdata.h:192:19: error: expected '=', ',', ';', 'asm' or
> '__attribute__' before '.' token
>
>
>
> 3.11-rc4 compile fine.

