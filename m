From: Hans Reiser <reiser@namesys.com>
Subject: random minor benchmark: Re: Copy 20 tarfiles: ext2 vs (reiser4, unixfile)
 vs (reiser4,cryptcompress)
Date: Wed, 25 Jan 2006 10:59:11 -0800
Message-ID: <43D7CA7F.4010502@namesys.com>
References: <43D7C6BE.1010804@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S932116AbWAYS7I@vger.kernel.org>
In-Reply-To: <43D7C6BE.1010804@namesys.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Reiserfs mail-list <Reiserfs-List@namesys.com>

Notice how CPU speed (and number of cpus) completely determines
compression performance.

cryptcompress refers to the reiser4 compression plugin, (unix file)
refers to the reiser4 non-compressing plugin.

Edward Shishkin wrote:

> Here are the tests that vs asked for:
> Creation (dd) of 20 tarfiles (the original 200M file is in ramfs)
> Kernel: 2.6.15-mm4 + current git snapshot of reiser4
>
> ------------------------------------------
>
> Laputa workstation
> Uni Intel Pentium 4 (2.26 GHz) 512M RAM
>
> ext2:
> real 2m, 15s
> sys 0m, 14s
>
> reiser4(unix file)
> real 2m, 7s
> sys  0m, 23s
>
> reiser4(cryptcompress, lzo1, 64K)
> real 2m, 13s
> sys 0m, 11s
> ------------------------------------------
>
> Belka workstation
> Dual Intel Xeon (2.4GHz) 1G RAM
>
> ext2:
> real 2m, 16s
> sys 0m, 10s
>
> reiser4(unix file)
> real 2m, 14s
> sys  0m, 17s
>
> reiser4(cryptcompress, lzo1, 64K)
> real 1m, 35s
> sys 0m, 14s
>
>
>
>
