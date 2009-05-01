From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH 0/6] kill-the-BKL/reiserfs3: performance improvements,
	faster than Bkl based scheme
Date: Fri, 1 May 2009 16:12:09 +0200
Message-ID: <20090501141208.GJ6011@nowhere>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com> <20090501053540.GC5983@elte.hu> <1241180316.3783.3.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=PzIZqnyO8FtrzfeRZXMy4JK0bxiW0z0ju9lwASdCLZs=;
        b=qYushyj0qNI4xjqh4sTEoSOvUt1g9lco4/3Gkvg73W9gCiRM5kRQ08q9Lf8qECzvob
         5ygxxDkVMtm5mpPXSN2e24JV0b84r2TEVFHwapu60CddPO99t3T34EtmLbag5kUShdvf
         eduVQmTsxd/Ftyqzo2ish5TiOOpBVFQrfZphI=
Content-Disposition: inline
In-Reply-To: <1241180316.3783.3.camel@localhost.localdomain>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Thomas Meyer <thomas@m3y3r.de>
Cc: Ingo Molnar <mingo@elte.hu>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, J@pimp.vs19.net

On Fri, May 01, 2009 at 02:18:36PM +0200, Thomas Meyer wrote:
> Am Freitag, den 01.05.2009, 07:35 +0200 schrieb Ingo Molnar:
> > 
> > I've pulled it and have also merged -rc4 into the kill-the-BKL tree, 
> > which can picked up from here:
> > 
> >    git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip.git core/kill-the-BKL
> > 
> > So for comparative benchmarking, vanilla v2.6.30-rc4 (which has the 
> > BKL) can be compared against latest kill-the-BKL
> 
> Hi,
> 
> Kernel gets soft-locked-up in somewhere in initrd:
> 
> See
> http://m3y3r.de/bilder/img_0524.jpg
> http://m3y3r.de/bilder/img_0525.jpg
> http://m3y3r.de/bilder/img_0526.jpg
> http://m3y3r.de/bilder/img_0527.jpg
> http://m3y3r.de/bilder/img_0528.jpg
> http://m3y3r.de/bilder/img_0529.jpg


Looks like someone owns the kernel lock and is sleeping
with the assumption it releases the lock, like the old bkl did.

 
> config is:
> http://m3y3r.de/bilder/config-2.6.30-rc4-ktb


Thanks, I will try it out once I have some time.


> greets
> thomas
> 
> 

