From: Per Andreas Buer <perbu@linpro.no>
Subject: Re: [Jfs-discussion] Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Thu, 04 Mar 2004 21:43:44 +0100
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <PERBUMSGID-ul6y8qgibr3.fsf@nfsd.linpro.no>
References: <4044119D.6050502@andrew.cmu.edu> <40453538.8050103@animezone.org>
 <20040303014115.GP19111@khan.acc.umu.se>
 <200403030700.57164.robin.rosenberg.lists@dewire.com>
 <1078307033.904.1.camel@teapot.felipe-alfaro.com>
 <1078411067.40473f3b6b835@webmail.uni-konstanz.de>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: ext2-devel@sourceforge.net, Ext3-users@redhat.com, jfs-discussion@www-124.ibm.com, reiserfs-list@namesys.com, linux-xfs@oss.sgi.com

Pascal Gienger <pascal.gienger@uni-konstanz.de> writes:

> 2. Speaking for servers, we live in a RAID and/or SAN-world. The media
> error issue is a non-issue.

If your cooling system stops you will experience media errors. A
filesystem which detects this halts the kernel really helps.

-- 
There are only 10 different kinds of people in the world, 
those who understand binary, and those who don't.
