From: berthiaume_wayne@emc.com
Subject: RE: Error messages.
Date: Thu, 6 Mar 2003 09:12:05 -0500
Message-ID: <93F527C91A6ED411AFE10050040665D0049C07A5@CORPUSMX1>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13128-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andewid@tnonline.net
Cc: reiserfs-list@namesys.com

	Anders, here is what I have and it works on thousands of duplicate
servers:

Tyan S2420 with 1.0GHz PIII
512MB RAM
Promise PDC20269 in PCI1
Intel Dual 10/100 NIC in PCI2
Four Maxtor 250GB IDE drives off of the Promise controller
lk 2.4.19 on RH7.3

hdparm -a64 -K1 -W1 -u1 -m16 -c1 -d1 /dev/hd<x>

Regards,
Wayne.

-----Original Message-----
From: Anders Widman [mailto:andewid@tnonline.net]
Sent: Thursday, March 06, 2003 3:46 AM
To: reiserfs-list@namesys.com
Subject: Re: Error messages.


> On Wed, 2003-03-05 at 21:51, Anders Widman wrote:
>> > On Wed, Mar 05, 2003 at 08:18:18PM +0100, Anders Widman wrote:
>>    New Promise controllers
>>        PDC20268 (Ultra 100Tx2)

> does that mean you only tested on these pdc's ?

I  changed  from  Three  Ultra100  to  Ultra100Tx2. Now I only use two
boards in this particular system.

> If so then then drop this damn PDC controller and get one that is
> supported under linux (e.g. hpt370 based controllers).

> I had the very same problems with these PDC20268 controllers. When I
> switched to anything above MDMA0 (note not even UDMA) the system was
> freezing from time to time.

This happens here too...

> On the internal controller your drives should work all fine (via/intel
> chipsets work nicely), also on hpt based chipsets and also cmd is
> supporting linux... but forget about promise. This company just does not
> support linux.

> I was using kernels 2.4.19/20/21pre1/21pre4/21pre4-ac5 and all had the
> very same problem. When I heard from others that they had problems with
> promise I switched... and I am now enjoying a rock stable system.

It  might  just  have  to  come  to this, but I do not want to buy new
hardware :)

> Soeren.


   



--------
PGP public key: https://tnonline.net/secure/pgp_key.txt
