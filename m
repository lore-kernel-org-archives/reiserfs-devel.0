From: Oleg Drokin <green@namesys.com>
Subject: Re: bug report
Date: Tue, 29 Apr 2003 09:49:02 +0400
Message-ID: <20030429054902.GA16939@namesys.com>
References: <Pine.LNX.4.53.0304281636140.366@max15g>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13891-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.53.0304281636140.366@max15g>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: robs@op.net
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Apr 28, 2003 at 04:40:49PM -0400, robs@op.net wrote:
> Having difficulty recovering a damaged ReiserFS.
> Tried stuff- reiserfsck, reiserfstune, etc.  Seems to lead into an infinite
> loop of things to try but don't work- ie: do x, but x needs y, but y needs
> z, but z needs x.
> Not sure what you need to know.
> "reiserfstune" man page talks about "kernel patched with special
> 'relocatable journal support' patch"

Well, unfortunatelly you provided not enough info at all.
We'd like to know:
what was your problem, how did you decide that reiserfs is damaged? Quote any relevant
messages from kernel/reiserfsprogs. Do you know how you get it damaged?
what reiserfsck version do you have? What steps have you already performed?
What is the kernel version?

Bye,
    Oleg
