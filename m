From: berthiaume_wayne@emc.com
Subject: RE: Error messages.
Date: Thu, 6 Mar 2003 09:25:46 -0500
Message-ID: <93F527C91A6ED411AFE10050040665D0049C07A7@CORPUSMX1>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13130-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andewid@tnonline.net
Cc: reiserfs-list@namesys.com

	Cable length is similar to mine. The PDC20268 will only go to UDMA
5. I haven't done any testing with this controller, needed the PDC20269's
UDMA 6 capability.

-----Original Message-----
From: Anders Widman [mailto:andewid@tnonline.net]
Sent: Thursday, March 06, 2003 8:52 AM
To: reiserfs-list@namesys.com
Subject: Re: Error messages.


>         That's rather puzzling... I did not have the same problems with
the
> mii driver; however, I was unable to run the full extent of the 250GB
drive
> or the UDMA level 6 with mii under 2.4.13, so I was using a special
patched
> driver form Promise to support both the pdc20269 and 48LBA. In 2.4.19 the
48
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
> controller? Eventhough you have several configured servers, I have
thousands
> without the problem you are seeing. Yes, I do get an occasional status
error
> under heavy loads but they've always been recoverable and the systems
> continue to chug along.

Cables are between 40-45cm / 15,5-17in.

--------
PGP public key: https://tnonline.net/secure/pgp_key.txt
