From: Anders Widman <andewid@tnonline.net>
Subject: Re: Corrupted/unreadable journal: reiser vs. ext3
Date: Mon, 24 Feb 2003 02:14:41 +0100
Message-ID: <1041498171.20030224021441@tnonline.net>
References: <200302141318.33057.sam@vilain.net>
 <b3bll5$er5$1@satsuki.furryterror.org>
Reply-To: Anders Widman <andewid@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-12884-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b3bll5$er5$1@satsuki.furryterror.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

> In article <200302141318.33057.sam@vilain.net>,
> Sam Vilain  <sam@vilain.net> wrote:
>>Perhaps it might, but it sure does a good job of cleaning them up with
>>ScanDisk.  And it almost certainly won't BSOD for a bad sector.

> BSOD, no.  Hang, yes.  Crash, yes.  Kill applications more or less at
> random, yes.

On  the  other  hand.  In  Linux  you  most  likely  CAN'T  kill  any
applications    that   tries to read from a failed disk, or even hit a
bad sector.

> Corrupt the registry and never successfully boot again, yes.
> Corrupt a database somewhere (even on another machine over a network)
> and require careful hand-holding to make some application work again, yes.
> Take two or more hours to boot, yes.

With WinNT...yes.

> But BSOD...no.

> Often there is some data corruption associated with IDE bus resets.
> Linux IDE drivers seem to corrupt any I/O requests in progress when it
> switches from DMA to PIO mode, which it usually does when the IDE bus
> times out on DMA requests.  :-P

And DMA errors seem be happen quite often with newer type motherboards
and  current  'stable'  kernels.  These  often result in multiple smbd
processes  that can't be killed and therefore unmountable filesystems.

All  OS  have  their flaws, and there is no point in comparing just to
prove  one  is  better than the other. What we should do, is to try to
improve  and  evolve things the best we can. ReiserFS is a good way in
this  direction,  still there are things that can be better. We should
focus on those (at least on this list).

- Anders






