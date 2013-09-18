From: Mathieu Belanger <m@thieu.so>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Wed, 18 Sep 2013 23:24:03 +0000
Message-ID: <20130918232403.Horde.bNNl42nj7ZN7__sS0HomGg7@mail.thieu.so>
References: <20130917181531.Horde.9SQoJsAfOsciOtEfGaP2jA1@mail.thieu.so>
 <5238B2FF.5060900@gmail.com>
 <CAL2jS+kR_NmF-vc2UqnJyCodh2_F3LdciAtsTXgcp=4QKCXauQ@mail.gmail.com>
 <5238BD79.6030005@gmail.com>
 <CAL2jS+nhaFh-axsDiLj4puDnJMmLrcj1m1qbovVhewDroc+uqQ@mail.gmail.com>
 <20130917211510.Horde.Zc6miMwWvs-M3goxK91zdw1@mail.thieu.so>
 <5238D17D.1080806@gmail.com>
 <20130918034441.Horde.FO9Ni879mCm-vV7kvTW6yg1@mail.thieu.so>
 <523944D2.40409@gmail.com>
 <20130918062035.Horde.3REQSHqc8XUbgvTNKMOnnw1@mail.thieu.so>
 <52394C69.8060702@gmail.com>
 <20130918065443.Horde.-Gtb6JT-2v7Q9BY_bLJ8wg9@mail.thieu.so>
 <52394F6B.5000902@gmail.com>
 <CAL2jS+mJrpsgB5JoZcqBF30jfPiGPn4d8+VpoDr8tyQ1wo=THw@mail.gmail.com>
 <5239AB0F.6070600@gmail.com>
 <CAL2jS+ns8GAU=wsLXksHJTtABgHWs+a7rJrQN9bsGvy7egmvAA@mail.gmail.com>
 <CAL2jS+khnOhFvDv3DtoSjE13WAZ4uRau_NnrQ2Khf_iK-Fyemg@mail.gmail.com>
 <20130918160919.Horde.HvCMYcUZQA7KSHMKlRg1Rg6@mail.thieu.so>
 <CAL2jS+neTxbxD5pddwC7FfEwZFNQYdS_caCZY_qgqxqWjQysww@mail.gmail.com>
 <20130918163939.Horde.TaamgVT0paLHGh-r_Nd_Gw9@mail.thieu.so>
 <CAL2jS+=46FB7D80QSKk=8KRqKMe=haAxkL-h7TuTBwjU5yNaJQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAL2jS+=46FB7D80QSKk=8KRqKMe=haAxkL-h7TuTBwjU5yNaJQ@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset=; format=flowed; DelSp=Yes; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Evgeniy <iron.udjin@gmail.com>
Cc: Chris Gentile <cnjgentile@gmail.com>, Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org


The crash I/you got is related to readdir.

in 3.11, .readdir don't exist anymore and got replaced with .iterate.  
but as Edward said, the way to use it changed too and I don't know how  
to fix it... yet.

I just renamed .readdir to .iterate in my old patchs and that's not correct.

For the patch you done this morning, it was ok and not related to the  
crash but it should not be named lockref/d_lockref as we still use  
spinlock_t and not the new struct lockref (who contain lock and  
count). It failed initially because d_lock got defined as  
d_lockref.lock.

We can't use it (or try) until that's patched.
