From: Szakacsits Szabolcs <szaka@sienet.hu>
Subject: Re: [benchmark] seek optimization
Date: Thu, 15 Jul 2004 21:17:37 +0200 (MEST)
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <Pine.LNX.4.21.0407152106570.16445-100000@mlf.linux.rulez.org>
References: <Pine.LNX.4.21.0407151123560.4325-100000@mlf.linux.rulez.org>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.21.0407151123560.4325-100000@mlf.linux.rulez.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@suse.de>
Cc: Bryan Henderson <hbryan@us.ibm.com>, Guy <bugzilla@watkins-home.com>, linux-fsdevel@vger.kernel.org, 'Marcel Hilzinger' <mhilzinger@linuxnewmedia.de>, 'Per Olofsson' <pelle@dsv.su.se>, reiserfs-list@namesys.com


On Thu, 15 Jul 2004, Szakacsits Szabolcs wrote:
> On Thu, 15 Jul 2004, Jens Axboe wrote:
> 
> > >    2) Apparently the 2.6 kernel's IO scheduler has a performance problem.
> >
> > Which one did you test?
> >
> The default in 2.6.7. It seems that one is the AS.

The "deadline" elevator gave 1-2% worse results for all fs and 5% worse
result for the raw access than the "as" scheduler.

	Szaka

