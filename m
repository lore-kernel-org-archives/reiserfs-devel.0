From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: Need Warm Fuzzies, ReiserFS (3)
Date: Mon, 20 Dec 2004 21:24:40 +0100
Message-ID: <200412202124.40569.christian.mayrhuber@gmx.net>
References: <41C66615.5010206@simutronics.com> <200412201725.03216.christian.mayrhuber@gmx.net> <1046303449.20041220173238@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22859-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1046303449.20041220173238@tnonline.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Monday 20 December 2004 17:32, Spam wrote:

>   What happen with the performance when these barriers are active?
It's faster than with disk writecache off.
I didn't benchmark barriers=flush and writecache on.

> 
>   Is it only during power failure the data in the write cache is lost?
No. See http://support.microsoft.com/kb/153296/EN-US/

>   
>   Also, does anyone know if the data in the disk write cache is
>   written out if the system crashes/freezes. Power failure is not a
>   very common occurrence, but crashes are much more so.
The cache should stay intact as long the harddisk is supplied with power.

>   
>   Is it possible to detect if filesystem was unmounted due to power
>   failure or due to a kernel crash?
Kernel panics don't tend to reset the machine but output a dump to the 
console /syslog via network and halt the machine.
If you have a UPS supplier supporting linux you will receive a power failure
notification event to take proper action.
For example: http://www2.apcupsd.com/

-- 
lg, Chris
