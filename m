From: Tassilo Horn <heimdall@uni-koblenz.de>
Subject: Re: 2.6.16 patch
Date: Mon, 27 Mar 2006 23:29:25 +0200
Message-ID: <87bqvr4lvu.fsf@baldur.nicundtas.de>
References: <4417D43A.2070603@namesys.com>
	<3aa654a40603150459q25507248v54f4ffef5e41042d@mail.gmail.com>
	<44185E04.5030307@namesys.com> <44267AAE.60201@free.fr>
	<e09dad$f0p$1@sea.gmane.org> <871wwnr7tr.fsf@baldur.nicundtas.de>
	<e09i4s$1ng$1@sea.gmane.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28363-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Marcus Furlong <furlongm@hotmail.com> writes:

Hello Marcus,

> Sorry about that, must have put the wrong patch up. Change unlock to
> mutex_unlock and it should be fine.

My last posting was a littlebit too fast. It compiles cleanly as I said
before, but my machine does not boot with this new kernel. I used my
current /proc/config.gz as kernel configuration. 

But at least I have to admit that I don't use a vanilla 2.6.16 kernel,
but gentoo-sources, so perhaps this is the problem...

The last messages are:

,----
| CPU1: Intel Genuine Intel(R) CPU    T2300 @ 1.66GHz stepping 08
| Total of 2 processors activated (6653.92 BogoMIPS).
| ENABLING IO-APIC IRQs
| ..TIMER: vector=0x31 apic1=0 pin1=2 apic2=-1 pin2=-1
`----

Kind regards,
Tassilo

