From: Pascal Gienger <pascal.gienger@uni-konstanz.de>
Subject: Re: [Jfs-discussion] Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Thu,  4 Mar 2004 15:37:47 +0100
Sender: linux-kernel-owner@vger.kernel.org
Message-ID: <1078411067.40473f3b6b835@webmail.uni-konstanz.de>
References: <4044119D.6050502@andrew.cmu.edu>  <40453538.8050103@animezone.org> <20040303014115.GP19111@khan.acc.umu.se>  <200403030700.57164.robin.rosenberg.lists@dewire.com> <1078307033.904.1.camel@teapot.felipe-alfaro.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner+linux-kernel=40quimby.gnus.org@vger.kernel.org>
In-Reply-To: <1078307033.904.1.camel@teapot.felipe-alfaro.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>
Cc: Robin Rosenberg <robin.rosenberg.lists@dewire.com>, David Weinehall <david@southpole.se>, Andrew Ho <andrewho@animezone.org>, Dax Kelson <dax@gurulabs.com>, Peter Nelson <pnelson@andrew.cmu.edu>, Hans Reiser <reiser@namesys.com>, linux-kernel <linux-kernel@vger.kernel.org>, ext2-devel@lists.sourceforge.net, ext3-users@redhat.com, jfs-discussion@oss.software.ibm.com, reiserfs-list@namesys.com, linux-xfs@oss.sgi.com

Quoting Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>:

> But XFS easily breaks down due to media defects. Once ago I used
> XFS,
> but I lost all data on one of my volumes due to a bad block on my
> hard
> disk. XFS was unable to recover from the error, and the XFS recovery
> tools were unable to deal with the error.

1. How long ago is "Once ago"? Did you report that to the xfs
developers?
2. Speaking for servers, we live in a RAID and/or SAN-world. The media
error issue is a non-issue.

Just my $0.02,

Pascal
