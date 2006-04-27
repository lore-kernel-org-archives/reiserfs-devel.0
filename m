From: Ming Zhang <mingz@ele.uri.edu>
Subject: Re: reiserfs performance on ssd
Date: Thu, 27 Apr 2006 09:58:54 -0400
Message-ID: <1146146334.5436.58.camel@localhost.localdomain>
References: <20060427151655.8b771812.pegasus@nerv.eu.org>
	 <1146145299.5436.52.camel@localhost.localdomain>
	 <20060427134837.GB8202@favonius>
Reply-To: mingz@ele.uri.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28529-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060427134837.GB8202@favonius>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: sander@humilis.net
Cc: Jure Pe?ar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

o, yes. thx.


http://www.anandtech.com/storage/showdoc.aspx?i=2480&p=10

see this review, when copy a large iso file, the speed is still around
~100MB/s. and this review also use a ASUS A8N motherboard.

so none of these tests can 100% reflect the real performance. we need a
nice SATA controller and MB here.

Ming


On Thu, 2006-04-27 at 15:48 +0200, Sander wrote:
> Ming Zhang wrote (ao):
> > read u review. one thing i am not quite understand is the
> > 
> > "Numbers speak from themselves. It's interesting to note that all
> > filesystems top the write speed at ~106MB/s and read speed at
> > ~125MB/s.  It seem we're hitting 32bit PCI throughput limit here ."
> > 
> > since u said the iram use pci slot for power purpose. then where is
> > this pci slot limit coming from?
> 
> The sata controller is on pci. Btw, pci is not a slot per se.
> 
> 	Kind regards, Sander
> 

