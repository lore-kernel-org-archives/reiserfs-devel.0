From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: reiserfs issuce on MPC8548 board
Date: Tue, 23 Feb 2010 23:17:43 -0800 (PST)
Message-ID: <alpine.DEB.2.01.1002232315500.28195@bogon.housecafe.de>
References: <389deec71002221814u29f19356ucd449762473dbdde@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <389deec71002221814u29f19356ucd449762473dbdde@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: hank peng <pengxihan@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On Tue, 23 Feb 2010 at 10:14, hank peng wrote:
> Feb  5 14:45:36 axAC123 user.crit kernel: REISERFS error (device
> dm-1): reiserfs-2025 reiserfs_cache_bitmap_metadata: bitmap block 0 is
> corrupted: first bit must be 1

Most probably hardware failures (disks/cabling/RAM), is there nothing else 
in syslog? Try dd'ing from dm-1 and see if there are any read errors.

Christian.
-- 
BOFH excuse #275:

Bit rot
