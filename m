From: Anders Widman <andewid@tnonline.net>
Subject: Re: Error messages.
Date: Thu, 6 Mar 2003 14:52:23 +0100
Message-ID: <1206269218.20030306145223@tnonline.net>
References: <93F527C91A6ED411AFE10050040665D0049C07A3@CORPUSMX1>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13127-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <93F527C91A6ED411AFE10050040665D0049C07A3@CORPUSMX1>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

>         That's rather puzzling... I did not have the same problems with the
> mii driver; however, I was unable to run the full extent of the 250GB drive
> or the UDMA level 6 with mii under 2.4.13, so I was using a special patched
> driver form Promise to support both the pdc20269 and 48LBA. In 2.4.19 the 48
> LBA was added so I was able to get the full address range on the 250GB
> drives without patches from Promise; however, was still unable to run UDMA
> level 6 on the onboard Intel chip.

UDMA6  works on the machine with the VIA KT400 chip and 2.4.21 kernel.
The  other machines are limited to ATA-100 as the controllers does not
support  higher.  Actually  I  do  not need high DMA, DMA-33 should be
enough.

Though,  the  errors come even with DMA turned off. It seem though, at
least  so  far,  that  the system crashes/lockups come much more often
with DMA than without.

>         I still use the Promise pdc20269 and run UDMA level 6 on thousands
> of deployed servers at this time. What is the cable length from drives to
> controller? Eventhough you have several configured servers, I have thousands
> without the problem you are seeing. Yes, I do get an occasional status error
> under heavy loads but they've always been recoverable and the systems
> continue to chug along.

Cables are between 40-45cm / 15,5-17in.

--------
PGP public key: https://tnonline.net/secure/pgp_key.txt

