From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4 in 2.6.14 - lockups with mmapped files
Date: Thu, 03 Nov 2005 18:21:51 +0300
Message-ID: <436A2B0F.9050207@namesys.com>
References: <1130860221.12859.23.camel@laptop>  <436796F6.10603@namesys.com> <1131028204.13284.29.camel@laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26771-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1131028204.13284.29.camel@laptop>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Fionn Behrens <fionn@spamfilter.de>
Cc: reiserfs-list@namesys.com

Hello

Fionn Behrens wrote:
> In the mean time I mailed the archck patch maintainer and he readily
> acknowledged that his reiser4 patch is flawed. He recommended that I
> should apply the "*-2" patches from
> ftp.namesys.com/pub/reiser4-for-2.6/2.6.14-rc4-mm1 . Unfortunately the
> spinlock-2 patch wont apply cleanly but has seven failed hunks. 

You should apply
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.14-rc4-mm1/reiser4-fix-livelock-2.patch
and then
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.14-rc4-mm1/reiser4-spinlock-cleanup-2.patch
to clean 2.6.14-rc4-mm1.
I just tried that and everything worked fine.

> Since I
> have no idea how relevant these patches are I wanted to ask again
> whether I should try to fix that patch or just leave it for now and try
> the USE_EFLUSH(1) solution first? 
> What would be the most effective
> approach?
> 

You should use 2.6.14-rc5-mm1. If your filesystem load encounteres lockup - you
should try to set REISER4_USE_EFLUSH to 1.
If that does not help - please report the bug.
