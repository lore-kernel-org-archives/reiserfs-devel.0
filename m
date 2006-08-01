From: Matthias Andree <matthias.andree@gmx.de>
Subject: Re: Solaris ZFS on Linux [Was: Re: the " 'official' point of view"expressed by kernelnewbies.org regarding reiser4 inclusion]
Date: Tue, 1 Aug 2006 11:25:14 +0200
Message-ID: <20060801092514.GB2974@merlin.emma.line.org>
References: <20060801064837.GB1987@thunk.org> <44CF01C1.9070802@argo.co.il>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932538AbWHAJZW@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <44CF01C1.9070802@argo.co.il>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Avi Kivity <avi@argo.co.il>
Cc: Theodore Tso <tytso@mit.edu>, David Lang <dlang@digitalinsight.com>, David Masover <ninja@slaphack.com>, tdwebste2@yahoo.com, Nate Diller <nate.diller@gmail.com>, Adrian Ulrich <reiser4@blinkenlights.ch>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Tue, 01 Aug 2006, Avi Kivity wrote:

> There's no reason to repack *all* of the data.  Many workloads write and 
> delete whole files, so file data should be contiguous.  The repacker 
> would only need to move metadata and small files.

Move small files? What for?

Even if it is "only" moving metadata, it is not different from what ext3
or xfs are doing today (rewriting metadata from the intent log or block
journal to the final location).

The UFS+softupdates from the BSD world looks pretty good at avoiding
unnecessary writes (at the expense of a long-running but nice background
fsck after a crash, which is however easy on the I/O as of recent FreeBSD
versions).  Which was their main point against logging/journaling BTW,
but they are porting XFS as well to save those that need instant
complete recovery.

-- 
Matthias Andree
