From: Chris Mason <mason@suse.com>
Subject: Re: udpated data logging available
Date: 25 Jun 2003 15:15:29 -0400
Message-ID: <1056568529.10097.135.camel@tiny.suse.com>
References: <1055764071.24111.650.camel@tiny.suse.com>
	 <1055944613.5545.22.camel@tiny.suse.com>
	 <1056336342.5545.376.camel@tiny.suse.com>
	 <200306231853.04098.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14699-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200306231853.04098.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Cc: reiserfs-list@namesys.com

On Mon, 2003-06-23 at 12:53, Christian Mayrhuber wrote:

> This patch does better than reiserfs-jh-1, though It didn't eat the data on my system.
> I was unable to login as root (both tty and su) for about 2 minutes after system
> boot with the -1 patch (data=ordered mode and root fs on software raid1).
> 
> 2.4.21 + data_logging and 2.4.21+data_logging + reiserfs-jh-2 + io-stalls-logging-6 does not
> show this behaviour.
> 
> The quota patches seem to work with the experimental data logging stuff, too.
> The system latency is bad during heavy  io, but this could hold true for all of the 2.4.x kernel series.
> You can try it yourself if you  issue the command "dd if=/dev/zero of=tst bs=102400" in a shell and
> now try to start another app. (I did this to test the user quota.)

Thanks for giving things a try.  I just uploaded io-stalls-7.diff, which
should do better at fixing latency during heavy io.

-chris


