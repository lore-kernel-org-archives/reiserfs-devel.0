From: Thomas Meyer <thomas@m3y3r.de>
Subject: Re: [PATCH 0/6] kill-the-BKL/reiserfs3: performance improvements,
 faster than Bkl based scheme
Date: Fri, 01 May 2009 14:18:36 +0200
Message-ID: <1241180316.3783.3.camel@localhost.localdomain>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com>
	 <20090501053540.GC5983@elte.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1758388AbZEAMTW@vger.kernel.org>
In-Reply-To: <20090501053540.GC5983@elte.hu>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ingo Molnar <mingo@elte.hu>
Cc: Frederic Weisbecker <fweisbec@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, J@pimp.vs19.net

Am Freitag, den 01.05.2009, 07:35 +0200 schrieb Ingo Molnar:
> 
> I've pulled it and have also merged -rc4 into the kill-the-BKL tree, 
> which can picked up from here:
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/tip/linux-2.6-tip.git core/kill-the-BKL
> 
> So for comparative benchmarking, vanilla v2.6.30-rc4 (which has the 
> BKL) can be compared against latest kill-the-BKL

Hi,

Kernel gets soft-locked-up in somewhere in initrd:

See
http://m3y3r.de/bilder/img_0524.jpg
http://m3y3r.de/bilder/img_0525.jpg
http://m3y3r.de/bilder/img_0526.jpg
http://m3y3r.de/bilder/img_0527.jpg
http://m3y3r.de/bilder/img_0528.jpg
http://m3y3r.de/bilder/img_0529.jpg

config is:
http://m3y3r.de/bilder/config-2.6.30-rc4-ktb

greets
thomas

