From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: Reiser4: File lost during log rollback.
Date: Tue, 4 Sep 2007 20:58:37 +0200 (CEST)
Message-ID: <alpine.DEB.0.999.0709042048160.7103@sheep.housecafe.de>
References: <6ec7a4340708280229l61d86d1dsf113890277bee68e@mail.gmail.com> 
 <alpine.DEB.0.999.0709022011310.7103@sheep.housecafe.de> 
 <6ec7a4340709030319k58b3a1afm994e188cb37170fe@mail.gmail.com>
 <6ec7a4340709030507u2cb968eche850f7365011c38@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <6ec7a4340709030507u2cb968eche850f7365011c38@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

On Mon, 3 Sep 2007, Xu CanHao wrote:
> 1, The system had some power lost recently, I believe the file lost
> during one time(I did not write to that file at once).

Hm, I'm not entirely sure if Reiser4 guarantees userdata consistency or 
"just" meta-data consistency. If the latter is the case: if the 
filesystem was in a usable state, reiser4 helped - if not, one should 
try to reproduce it and file a bug...

> 2, Is there any evidence show that 2.6.22 much more stable(or at least
> solved that behavior)?

I don't use reiser4 on a regular basis, but given that development is 
still in flux, it's worth a try, IMHO.

C.
-- 
BOFH excuse #251:

Processes running slowly due to weak power supply
