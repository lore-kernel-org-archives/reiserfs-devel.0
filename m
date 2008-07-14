From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: Reiserfs lost data
Date: Mon, 14 Jul 2008 22:59:06 +0200 (CEST)
Message-ID: <alpine.DEB.1.10.0807142253380.4469@sheep.housecafe.de>
References: <18430405.post@talk.nabble.com> <18430569.post@talk.nabble.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <18430569.post@talk.nabble.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

On Sun, 13 Jul 2008, Farafonoff wrote:
> artem@anima:~$ sudo reiserfsck -V
> reiserfsck 3.6.19 (2003 www.namesys.com)

offtopic in this thread, but still: reiserfsprogs 3.6.19 seems to be the 
latest[0] version, right? Can we take the "2003" off the version printout 
perhaps? And the (obsolete?) domainname too?

Thanks,
Christian.

[0] http://www.kernel.org/pub/linux/utils/fs/reiserfs/

--- version.h.orig	2008-07-14 22:48:50.000000000 +0200
+++ version.h	2008-07-14 22:52:53.000000000 +0200
@@ -3,4 +3,4 @@
   */

  #define print_banner(prog) \
-fprintf(stderr, "%s %s (2003 www.namesys.com)\n\n", prog, VERSION)
+fprintf(stderr, "%s %s \n", prog, VERSION)

-- 
BOFH excuse #282:

High altitude condensation from U.S.A.F prototype aircraft has contaminated the primary subnet mask. Turn off your computer for 9 days to avoid damaging it.
