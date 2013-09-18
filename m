From: Mathieu Belanger <m@thieu.so>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Wed, 18 Sep 2013 06:54:43 +0000
Message-ID: <20130918065443.Horde.-Gtb6JT-2v7Q9BY_bLJ8wg9@mail.thieu.so>
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
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <52394C69.8060702@gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset=; format=flowed; DelSp=Yes; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Gentile <cnjgentile@gmail.com>
Cc: Evgeniy <iron.udjin@gmail.com>, Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org

you can edit the code directly.

Tell me if it compile after that.
If it compile you can make a patch with git (git diff >  
/tmp/patch.patch) or you can clone, work on your clone, commit and do  
a pull request so I can add it.

I can also add you as maintainer if you want to work directly on it.



Also, I get that error with 3.11 and 3.12-rc1 but not with 3.11-rc4 :

In file included from fs/reiser4/super.h:14:0,
                  from fs/reiser4/debug.c:28:
fs/reiser4/fsdata.h:192:19: error: expected '=', ',', ';', 'asm' or  
'__attribute__' before '.' token



3.11-rc4 compile fine.
