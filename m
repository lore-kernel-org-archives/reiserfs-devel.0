From: Ookhoi <ookhoi@humilis.net>
Subject: Re: ReiserFS causes CPU high usage?!
Date: Fri, 28 Feb 2003 13:45:31 +0100
Message-ID: <20030228134531.E24291@humilis>
References: <200302280011.14488.liviu.voicu@huji.ac.il> <200302281439.24760.liviu.voicu@huji.ac.il> <20030228133836.D24291@humilis> <200302281442.06876.liviu.voicu@huji.ac.il>
Reply-To: ookhoi@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12987-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200302281442.06876.liviu.voicu@huji.ac.il>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Voicu Liviu <liviu.voicu@huji.ac.il>
Cc: ookhoi@humilis.net, reiserfs-list@namesys.com

Voicu Liviu wrote (ao):
> > Ok. Can you provide top output?
> 
> Not right now because the computer is 40 minutes far away of me but I
> can connect via ssh and try to install 'mozilla' for example with nice
> -10 and post here the top snapshot
> OK?

Perfect. Can you also post the output of the following to the list?

cat /proc/cpuinfo
cat /proc/meminfo 
hdparm /dev/hda
dmesg

And top output before, during, and after the install please.
