From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiser4 crash
Date: Thu, 25 Nov 2004 13:23:43 +0200
Message-ID: <20041125112343.GG26192@nysv.org>
References: <20041119084757.GA2310@sk2-4.tky.hut.fi> <1101369249.1628.13.camel@tribesman.namesys.com> <20041125221919.2180794b.hihone@bigpond.net.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22558-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041125221919.2180794b.hihone@bigpond.net.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Cal <hihone@bigpond.net.au>
Cc: Vladimir Saveliev <vs@namesys.com>, reiserfs-list@namesys.com

On Thu, Nov 25, 2004 at 10:19:19PM +1100, Cal wrote:
>This occurs with 2.6.10-rc2-mm2, 2.6.10-rc2-mm3.  It's nastier than
>you might think.  After the BUG, the system slowly sinks into fatal
>decline, losing  screen i/o, keyboard response, eventually just
>locking up completely.

Did you try vs's patches?

I don't remember if I mentioned it, but there were two patches
from Piotr Neuman's -cko that were required by Reiser4 (according
to him) but seemed to patch well onto vs's patched system...

Can anyone give any info on this?
Mr. Neuman for example :)

Anyway, my box has been running a-ok now with 2.6.9, vs's reiser4-for-2.6.9
and the additional bugfix, but I have been too busy at work to test real
much.

Would it be possible for you other guys to give it a shot; I'm sure
everyone would appreciate it :)

Thanks!

-- 
mjt

