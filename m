From: Oleg Drokin <green@namesys.com>
Subject: Re: speedup patch for 2.4.19-pre6
Date: Fri, 12 Apr 2002 08:53:00 +0400
Message-ID: <20020412085300.A6171@namesys.com>
References: <200204112344.41906.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10052-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <200204112344.41906.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: Chris Mason <mason@suse.com>, ReiserFS List <reiserfs-list@namesys.com>

Gello!

On Thu, Apr 11, 2002 at 11:44:41PM +0200, Dieter N?tzel wrote:

> mount		Throughput
> -			28.8716 MB/sec (NB=36.0895 MB/sec  288.716 MBit/sec)
> 			13.850u 56.380s 2:27.31 47.6%   0+0k 0+0io 938pf+0w
> 
> notail		30.2834 MB/sec (NB=37.8543 MB/sec  302.834 MBit/sec)
> 			14.600u 53.660s 2:20.50 48.5%   0+0k 0+0io 938pf+0w

Hm. What about comparing these values with values without
speedup patch? Otherwise they are pretty meaningless, I think.
At least for us.

Bye,
    Oleg
