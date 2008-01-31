From: Matthew <jackdachef@gmail.com>
Subject: Re: Current status of Reiser4
Date: Thu, 31 Jan 2008 22:43:23 +0100
Message-ID: <e85b9d30801311343w587c08cdjd63bc3d7af41e93@mail.gmail.com>
References: <47A0F68C.2040805@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        bh=bY22wjWx3BXDexXBQafaA2bayep6kp/RxeCJfuO67QQ=;
        b=KJzH6mt6vv4LAyewdzAmDjSnbEvFOFeE72ZJE88/is+5tomX12Q6SllsoUqstOCv4oXPlKAY0PsSrtCH5v+yfdHH5B3BV0t0EhXnF7d0oO3aMUnQVBfcG+mWjgSy9ee5RiauVVUaIYV4YFEwiDv165WzvbR5sC9hKyUkFQx3mgA=
In-Reply-To: <47A0F68C.2040805@gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Bartosz Szreder <cfiend@talent.edu.pl>, Matthew <jackdachef@gmail.com>, Dushan Tcholich <dusanc@gmail.com>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

That's perfect timing,
thanks a lot, Edward,
I just wanted to ask, what the current status for reiser4 is :)

The mentioned hanging with bash-scripts is gone with
2.6.24-vanilla/gentoo-sources + 2.6.24-rc8-mm1-based reiser4-patch +
your additional patch, it should be the same with official / your
2.6.24-patch

However, I still run into them from time to time with zen-sources:
http://repo.or.cz/w/linux-2.6/zen-sources.git ,
perhaps due to it's aggressive / tweaked nature,

that's the only little "problem" right now, reiser4 is perfectly
stable & pretty fast: it e.g. cuts down compile time for
openoffice-2.3.1 by about 15-20 minutes with cypcompress + lzo1
(noatime,nodiratime) compared to reiserfs
(noatime,nodiratime,data=writeback,commit=120)

reiserfs: around 2 hours
reiser4 + cryptcompress w. lzo1: 1 hour 40 minutes

kde4 is simply a pleasure with it :)

i've attached the test-scripts (usually intended for some tweaking /
power-saving tests), perhaps you're able to reproduce the "hang":
- when executing full.sh & no problems, it should exit (vanilla-kernel behavior)
- when executing & the mentioned behavior it should sit there &
executing the file & not exiting, finishing it;
everytime it seems to halt / hang at another position

Regards,
Mat
