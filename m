From: Oleg Drokin <green@namesys.com>
Subject: Re: Horrible ftruncate performance
Date: Fri, 11 Jul 2003 18:49:44 +0400
Message-ID: <20030711144943.GE17180@namesys.com>
References: <20030710052931.GA17957@namesys.com> <Pine.LNX.4.30.0307100851120.26018-100000@divine.city.tvnet.hu> <20030710092112.GA837@namesys.com> <200307111635.27904.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14885-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200307111635.27904.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: Szakacsits Szabolcs <szaka@sienet.hu>, reiserfs-list@namesys.com, Chris Mason <mason@suse.com>

Hello!

On Fri, Jul 11, 2003 at 04:35:27PM +0200, Dieter N?tzel wrote:

> daul Athlon MP 1900+
> U160
> Argh! ---I can't kill it!
> No CNTL-C or '"killall -9 dd" or under "top".
> Even as root;-(

Yup. It spins in kernel mode not listening to signals busy doing balancing
for lots of zeroes, one at a time.

> 2.4.21-jam1 (aa1) plus all data-logging
> SOURCE/dri-trunk> time dd if=/dev/zero of=sparse bs=1 seek=200G count=1
> 0.000u 362.760s 8:26.34 71.6%   0+0k 0+0io 124pf+0w
> It was runinng with a paralell C++ (-j20) compilation.
> Is the mentioned patch needed?

Yes, patch is needed for any system that does not contain it.

Bye,
    Oleg
