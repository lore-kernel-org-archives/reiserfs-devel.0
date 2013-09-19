From: Mathieu Belanger <m@thieu.so>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Thu, 19 Sep 2013 05:45:28 +0000
Message-ID: <20130919054528.Horde.bmycD1ZWneqw9p_4lgZGxw1@mail.thieu.so>
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
 <20130918232403.Horde.bNNl42nj7ZN7__sS0HomGg7@mail.thieu.so>
 <20130919012522.Horde.SdpNwqxAO_FZ7iRKEdPc8g5@mail.thieu.so>
 <CADW=+3=znbq=KDqCmzQ_eq=V_9i4VpHj_uOcB3joJbZUZPNtdA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CADW=+3=znbq=KDqCmzQ_eq=V_9i4VpHj_uOcB3joJbZUZPNtdA@mail.gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset=; format=flowed; DelSp=Yes; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Du?an ?oli? <dusanc@gmail.com>
Cc: Evgeniy <iron.udjin@gmail.com>, Chris Gentile <cnjgentile@gmail.com>, Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>


Hi,

You have three possibility.

1 - > Wait until the next week end or so for the official release
2 - > Search the web to find the version that will be released next  
week (I found it, you can find it.)
3 - > I have made one too without using the other I found on the  
internet, it's less clean but it's available on my git right now if  
you really want it now. Note that I don't think anyone else tested it  
at it's current working state but i'm currently using it emerging  
stuff on Gentoo without issue.

For #3
git clone https://github.com/DestroyFX/reiser4 (wait +-800mb)
cd reiser4
git checkout reiser4-for-3.11
git diff v3.11 reiser4-for-3.11 > /tmp/reiser4-for-3.11.patch
