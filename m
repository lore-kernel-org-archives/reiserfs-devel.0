From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Processes dying?
Date: Sat, 5 Jun 2004 00:01:30 +0300
Message-ID: <20040604210130.GH4990@nysv.org>
References: <20040604203925.GF4990@nysv.org> <200406042050.i54KoDYD029229@turing-police.cc.vt.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19020-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200406042050.i54KoDYD029229@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Valdis.Kletnieks@vt.edu
Cc: reiserfs-list@namesys.com

On Fri, Jun 04, 2004 at 04:50:13PM -0400, Valdis.Kletnieks@vt.edu wrote:

>My guess is that some *other* process got wedged in the kernel while holding
>a kernel lock, causing other processes to block when they needed that lock.

Hmm, mmmmaybe. I'll have to take your word for it, since you're the more
experienced one :)

But here's the thing, it appears to be related to directories, mostly,
maybe. When I press tab to expand names.

>Probably will need a SysRq-T output to figure out who's hung where...

Any ideas on how to ship the output somewhere for analysis?
Some means of accessing the trace without sysrq?

This will be the first time I didn't go into X with this kernel,
let's see if she boots without the reset button this time around ;)

-- 
mjt

