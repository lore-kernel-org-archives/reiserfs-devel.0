From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: Re: Error messages.
Date: 06 Mar 2003 00:02:30 +0100
Message-ID: <1046905350.1692.7.camel@fortknox>
References: <7473069171.20030305201818@tnonline.net>
	 <20030305204105.GA14382@willow.seitz.com>
	 <7478652593.20030305215122@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13099-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <7478652593.20030305215122@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Anders Widman <andewid@tnonline.net>

On Wed, 2003-03-05 at 21:51, Anders Widman wrote:
> > On Wed, Mar 05, 2003 at 08:18:18PM +0100, Anders Widman wrote:
>    New Promise controllers
>        PDC20268 (Ultra 100Tx2)

does that mean you only tested on these pdc's ?

If so then then drop this damn PDC controller and get one that is
supported under linux (e.g. hpt370 based controllers).

I had the very same problems with these PDC20268 controllers. When I
switched to anything above MDMA0 (note not even UDMA) the system was
freezing from time to time.

On the internal controller your drives should work all fine (via/intel
chipsets work nicely), also on hpt based chipsets and also cmd is
supporting linux... but forget about promise. This company just does not
support linux.

I was using kernels 2.4.19/20/21pre1/21pre4/21pre4-ac5 and all had the
very same problem. When I heard from others that they had problems with
promise I switched... and I am now enjoying a rock stable system.

Soeren.

