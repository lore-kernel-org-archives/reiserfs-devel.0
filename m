From: Oleg Drokin <green@namesys.com>
Subject: Re: fsck in background?
Date: Mon, 31 Mar 2003 14:46:09 +0400
Message-ID: <20030331144609.B1430@namesys.com>
References: <3E8818CD.1000500@dotcom.pl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13477-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E8818CD.1000500@dotcom.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: myciel <myciel@dotcom.pl>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Mar 31, 2003 at 12:30:37PM +0200, myciel wrote:

> Yes, I know this sounds strange, but if one have 1T filesystem full of 
> small files,
> reiserfsck estimates duration to be of order of months,

We have a patch that significantly speeds things up.
In the similar case 28+ years estimated for pass 0 turned into 208 hours total
operations after speedup patch was applied.
We plan to include it into reiserfsprogs 3.6.6-pre1, but if you need that urgently,
tell us.

> so I'm curious if maybe fscking in background is planned? - idea is not new
> and bsd guys say that they have it  for freebsd 5.0 in ffs.

This is not possible for reiserfs, I think.
reiserfs have non-constant metadata location , so while you can certainly
check fs consistency of some snapshot, you cannot fix it because all the real data
might have ben shifted to other blocks, old blocks might have been already freed and so on.

Bye,
    Oleg
