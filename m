From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: auto-patches
Date: Sat, 12 Jun 2004 20:27:07 +0300
Message-ID: <20040612172707.GE4990@nysv.org>
References: <40CB168E.50507@slaphack.com> <200406121739.30952.henning@skalatan.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19156-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200406121739.30952.henning@skalatan.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Henning Westerholt <henning@skalatan.de>
Cc: reiserfs-list@namesys.com, David Masover <ninja@slaphack.com>

On Sat, Jun 12, 2004 at 05:39:30PM +0200, Henning Westerholt wrote:

>The auto-snapshot from 2004.06.07-19.38-linux-2.6.7-rc1-mm1 break the on-disk 
>format for me. I must rebuild my partitions, as the old (2004.03.26) snapshot 
>segfaults after that on bootup. I try the -rc3 snapshot later..

AFAIK that was a temporary bug. Wasn't there a fix on the list for it?

I'm using 2004.06.09 on my Reiser4 / which was mkfs'd when the sky
itself was young.

>The old fsck complains also about some stat-data errors, and refuse to fix 
>them. Perhaps the 2004.04.21-internal.testing.fixed/ snapshot works with the 
>new format? 

Yes, but it's still sort of the old format ;)

Think I'll compile 2004.06.11, there was a comment on irc that it should be
the stablest in a while. So we'll see.

-- 
mjt

