From: Christian Kujau <evil@g-house.de>
Subject: Re: vpf-10680, minor corruptions
Date: Wed, 18 Jun 2003 20:01:12 +0200
Message-ID: <3EF0A8E8.2000209@g-house.de>
References: <3EF07AFB.8060303@g-house.de> <20030618152626.GA17240@namesys.com>
Reply-To: evil@g-house.de
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14616-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030618152626.GA17240@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS List <reiserfs-list@namesys.com>

Oleg Drokin schrieb:
> Hm, interesting. Do you had crashes/unexpected shutdowns before corruptions appears
> or are they appear without any reason at all?

i had this issue once before -- did a check and noticed vpf-10680/some 
corruptions. but these must have been from an crash.
but now, i think as i rebooted the machine yesterday (because i upgraded 
to kernel 2.5.72) the journal was checked (replayed?) anyway at boot:

found reiserfs format "3.6" with standard journal
Reiserfs journal params: device sde2, size 8192, journal first block 18, 
max trans len 1024, max batch 900, max commit age 30, max trans age 30
reiserfs: checking transaction log (sde2) for (sde2)
Using r5 hash to sort names

(from dmesg, booting process)

and i thought the fs is "O.K." at least after boot, because ReiserFS 
cares about consistency for itsself. if not, the corruptions are likely 
from the unclean shutdowns. but that would mean, that i still have to 
manually reiserfsck from time to time.

btw, is there a switch like "Maximum mount counft before doing the next 
fsck while booting"?

> Well, I guess it's time to clear the dust off our alpha and do some testing.

hehe, should it be architecture related?

Thank you,
Christian.

