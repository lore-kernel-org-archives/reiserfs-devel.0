From: Ookhoi <ookhoi@humilis.net>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 14:00:36 +0100
Message-ID: <20030228140036.H24291@humilis>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281442.06876.liviu.voicu@huji.ac.il> <20030228134531.E24291@humilis> <200302281454.22600.liviu.voicu@huji.ac.il>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12997-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200302281454.22600.liviu.voicu@huji.ac.il>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Voicu Liviu <liviu.voicu@huji.ac.il>
Cc: ookhoi@humilis.net, reiserfs-list@namesys.com

Voicu Liviu wrote (ao):

[cut cpuinfo, meminfo, hdparm, dmesg]

All looks ok, although your dmesg misses the last half.

Can you try latest 2.4 without patches?
If you still have problems, please post your kernel config.

Also, please post a 'time make bzImage' so we can compare that.
