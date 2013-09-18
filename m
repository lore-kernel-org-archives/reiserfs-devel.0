From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Thu, 19 Sep 2013 01:36:36 +0200
Message-ID: <523A3904.3060909@gmail.com>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so> <20130917211510.Horde.Zc6miMwWvs-M3goxK91zdw1@mail.thieu.so> <5238D17D.1080806@gmail.com> <20130918034441.Horde.FO9Ni879mCm-vV7kvTW6yg1@mail.thieu.so> <523944D2.40409@gmail.com> <20130918062035.Horde.3REQSHqc8XUbgvTNKMOnnw1@mail.thieu.so> <52394C69.8060702@gmail.com> <20130918065443.Horde.-Gtb6JT-2v7Q9BY_bLJ8wg9@mail.thieu.so> <52394F6B.5000902@gmail.com> <CAL2jS+mJrpsgB5JoZcqBF30jfPiGPn4d8+VpoDr8tyQ1wo=THw@mail.gmail.com> <5239AB0F.6070600@gmail.com> <CAL2jS+ns8GAU=wsLXksHJTtABgHWs+a7rJrQN9bsGvy7egmvAA@mail.gmail.com> <CAL2jS+khnOhFvDv3DtoSjE13WAZ4uRau_NnrQ2Khf_iK-Fyemg@mail.gmail.com> <20130918160919.Horde.HvCMYcUZQA7KSHMKlRg1Rg6@mail.thieu.so> <CAL2jS+neTxbxD5pddwC7FfEwZFNQYdS_caCZY_qgqxqWjQysww@mail.gmail.com> <20
 130918163939.Horde.TaamgVT0paLHGh-r_Nd_Gw9@mail.thieu.so> <CAL2jS+=46FB7D80QSKk=8KRqKMe=haAxkL-h7TuTBwjU5yNaJQ@mail.gmail.com> <20130918232403.Horde.bNNl42nj7ZN7__sS0HomGg7@mail.thieu.so>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=pXgtpoct6czBx7JrbkzJOHO+YauVNpQlfOoQ5kHh1Ec=;
        b=cvwrVqmfCcC7kEBK08b9a2ZIslxsBeCeMVU4B/pqa3VxCmSr/UM8fN5cYE3mMRw55T
         2ao6/f3ZntDitEmzXXRvN4yCi+D8Z+kn4wp0zFf6x5owL9YiDOnqyMK5ffYxost+DeBK
         2prd8LOs1AtqQFtWmFaXZFT9K2nwUGz+1pjUu4B3z/RKy+ALdLAktgYfc+A16q+6SenU
         6lqYUBPSAL5UYoVBrOUshoUuNIsIZVfWZENL8v2EciMuJHQLcUKQelECNzrE/APK6uGb
         MjuIoWuDKBb0TjWI7XZl39HQ186k4GiFViaM+a8wyi57i+8mPP3zSNCTvOI3jiEB9REb
         YWSg==
In-Reply-To: <20130918232403.Horde.bNNl42nj7ZN7__sS0HomGg7@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1251"; format="flowed"
To: Mathieu Belanger <m@thieu.so>
Cc: Evgeniy <iron.udjin@gmail.com>, Chris Gentile <cnjgentile@gmail.com>, reiserfs-devel@vger.kernel.org

It seems, we have successfully ported reiser4 to 3.11 on the
previous week. I'll try to put the patch to sourceforge next weekends.

Thanks,
Edward.


19.09.2013 01:24, Mathieu Belanger =EF=E8=F8=E5=F2:
>
> The crash I/you got is related to readdir.
>
> in 3.11, .readdir don't exist anymore and got replaced with .iterate.=
=20
> but as Edward said, the way to use it changed too and I don't know ho=
w=20
> to fix it... yet.
>
> I just renamed .readdir to .iterate in my old patchs and that's not=20
> correct.
>
> For the patch you done this morning, it was ok and not related to the=
=20
> crash but it should not be named lockref/d_lockref as we still use=20
> spinlock_t and not the new struct lockref (who contain lock and=20
> count). It failed initially because d_lock got defined as d_lockref.l=
ock.
>
> We can't use it (or try) until that's patched.

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
