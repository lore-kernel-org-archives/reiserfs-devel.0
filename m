From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Re: [benchmark] seek optimization
Date: Thu, 15 Jul 2004 12:34:00 +0200 (MEST)
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0407151123560.4325-100000@mlf.linux.rulez.org>
References: <20040715055007.GD9383@suse.de>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <20040715055007.GD9383@suse.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@suse.de>
Cc: Bryan Henderson <hbryan@us.ibm.com>, Guy <bugzilla@watkins-home.com>, linux-fsdevel@vger.kernel.org, 'Marcel Hilzinger' <mhilzinger@linuxnewmedia.de>, 'Per Olofsson' <pelle@dsv.su.se>, reiserfs-list@namesys.com


On Thu, 15 Jul 2004, Jens Axboe wrote:

> >    2) Apparently the 2.6 kernel's IO scheduler has a performance problem.
> 
> Which one did you test?

The default in 2.6.7. It seems that one is the AS. I couldn't find any way
to query what the IO scheduler is on a running 2.6.7 or how to change it.
There were no 'elevator' boot time option given. All IO scheduler were
compiled in.

The other major suspect for the 2-3% 2.6 performance degradation is the
'block size = GCD(page size, device size)' change. AFAIR the value ended
up to be the minimal 512 for the destination device. The 'sys' times are
double without using any filesystems:

  Fs_kernel_method      usr      sys       real   CPU
  raw_24_seek          1.65    17.88    8:19.69    3%
  raw_26_seek          1.80    33.49    8:27.02    6%

It might or might not be related.

	Szaka

