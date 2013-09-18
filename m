From: Evgeniy <iron.udjin@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Wed, 18 Sep 2013 21:02:22 +0300
Message-ID: <CAL2jS+=46FB7D80QSKk=8KRqKMe=haAxkL-h7TuTBwjU5yNaJQ@mail.gmail.com>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so>
 <5238B2FF.5060900@gmail.com> <CAL2jS+kR_NmF-vc2UqnJyCodh2_F3LdciAtsTXgcp=4QKCXauQ@mail.gmail.com>
 <5238BD79.6030005@gmail.com> <CAL2jS+nhaFh-axsDiLj4puDnJMmLrcj1m1qbovVhewDroc+uqQ@mail.gmail.com>
 <20130917211510.Horde.Zc6miMwWvs-M3goxK91zdw1@mail.thieu.so>
 <5238D17D.1080806@gmail.com> <20130918034441.Horde.FO9Ni879mCm-vV7kvTW6yg1@mail.thieu.so>
 <523944D2.40409@gmail.com> <20130918062035.Horde.3REQSHqc8XUbgvTNKMOnnw1@mail.thieu.so>
 <52394C69.8060702@gmail.com> <20130918065443.Horde.-Gtb6JT-2v7Q9BY_bLJ8wg9@mail.thieu.so>
 <52394F6B.5000902@gmail.com> <CAL2jS+mJrpsgB5JoZcqBF30jfPiGPn4d8+VpoDr8tyQ1wo=THw@mail.gmail.com>
 <5239AB0F.6070600@gmail.com> <CAL2jS+ns8GAU=wsLXksHJTtABgHWs+a7rJrQN9bsGvy7egmvAA@mail.gmail.com>
 <CAL2jS+khnOhFvDv3DtoSjE13WAZ4uRau_NnrQ2Khf_iK-Fyemg@mail.gmail.com>
 <20130918160919.Horde.HvCMYcUZQA7KSHMKlRg1Rg6@mail.thieu.so>
 <CAL2jS+neTxbxD5pddwC7FfEwZFNQYdS_caCZY_qgqxqWjQysww@mail.gmail.com> <20130918163939.Horde.TaamgVT0paLHGh-r_Nd_Gw9@mail.thieu.so>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=PjRjjtSW3J1a++yLZ23iJMOpg8FdjbUTmx6y7rNWTC8=;
        b=q5Kujt4QvLq62E1RNarLpDPySrVxtZYPb5HW+c/zrBa2cUjcNKpRQhe2u9cC2rvlqP
         tukJkajAT/V7FBsnJPopR4m+sgDNvIi+ZjLPXsMOgCb6QN5m25G2z5cfKWlqfatShoHi
         tKBShzaqlHfhxmHp9rdRpm8hiSLOLa89dxhtmrqUheAQ2wHMUsJuGx5RqLUb/9hobuTZ
         7b0iUOaCZbp9Y38ByFtYajWSZLNAGuG9cGBGjVNx6gaBejAfEXoWfkfyDdT6uJGLAq/C
         riG36cWURunua6J2mkKVHdlJugAh6F4y35zhcUwmjLq6Uz/6WFm4aq7rbFJ5XNsdfseJ
         2pPQ==
In-Reply-To: <20130918163939.Horde.TaamgVT0paLHGh-r_Nd_Gw9@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Belanger <m@thieu.so>
Cc: Chris Gentile <cnjgentile@gmail.com>, Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

First of all we need to make it work with 3.11. And the second task to
solve - to rewrite code use new shrinker api for 3.12.

On 18 September 2013 19:39, Mathieu Belanger <m@thieu.so> wrote:
>
> For 3.12-rc1, I revert that patch
> a0b02131c5fcd8545b867db72224b3659e813f10 (
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=a0b02131c5fcd8545b867db72224b3659e813f10 ) to put the old shrinker api back so the kernel support the old and new
> API.
>
> For more cleaner code, we should update the reiser4 code to the new API.
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
