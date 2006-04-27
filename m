From: Sander <sander@humilis.net>
Subject: Re: reiserfs performance on ssd
Date: Thu, 27 Apr 2006 15:48:37 +0200
Message-ID: <20060427134837.GB8202@favonius>
References: <20060427151655.8b771812.pegasus@nerv.eu.org> <1146145299.5436.52.camel@localhost.localdomain>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28528-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1146145299.5436.52.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ming Zhang <mingz@ele.uri.edu>
Cc: Jure Pe?ar <pegasus@nerv.eu.org>, reiserfs-list@namesys.com

Ming Zhang wrote (ao):
> read u review. one thing i am not quite understand is the
> 
> "Numbers speak from themselves. It's interesting to note that all
> filesystems top the write speed at ~106MB/s and read speed at
> ~125MB/s.  It seem we're hitting 32bit PCI throughput limit here ."
> 
> since u said the iram use pci slot for power purpose. then where is
> this pci slot limit coming from?

The sata controller is on pci. Btw, pci is not a slot per se.

	Kind regards, Sander

-- 
Humilis IT Services and Solutions
http://www.humilis.net
