From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiser4 crash [solved?]
Date: Sun, 1 Aug 2004 14:38:43 +0300
Message-ID: <20040801113843.GH1375@nysv.org>
References: <200407241827.54674.frbiscani@jumpy.it> <200408011337.37752.frbiscani@jumpy.it>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19904-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200408011337.37752.frbiscani@jumpy.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Francesco Biscani <frbiscani@jumpy.it>
Cc: reiserfs-list@namesys.com

On Sun, Aug 01, 2004 at 01:37:37PM +0200, Francesco Biscani wrote:
>I tried to reproduce the crash on my workstation and laptop (the machine on 
>which the crash showed for the 1st time). In both cases the problem did not 
>appear. Using 30/07 snapshot on both machines with all debug options enabled. 
>Nothing appears in logs. Bug solved?

I got a patch from them that fixed these issues, but as it was only
copypasted to irc, I did not publish it. It was just deleting some lines.

Anyway, I think that got merged in 2004.07.30, or somewhere, but the only
other source tree I have beside 2004.07.27 with the manual patch is
the aforementioned snapshot, but I can't remember the location of the
removals anymore :)

But hey, they fixed the bug for me, thanks again for all that! :)

-- 
mjt

