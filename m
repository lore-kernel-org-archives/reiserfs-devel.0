From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: http://www.namesys.com/snapshots/2004.06.14-internal.testing/
Date: Tue, 15 Jun 2004 00:05:31 +0300
Message-ID: <20040614210531.GU4990@nysv.org>
References: <200406150022.34578.vitaly@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19182-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200406150022.34578.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vitaly Fertman <vitaly@namesys.com>
Cc: reiserfs-list@namesys.com

On Tue, Jun 15, 2004 at 12:22:34AM +0400, Vitaly Fertman wrote:
>
>When you run fsck.reiser4 on your old reiser4 filesystem it should report 
>about missed plugin set members in the root directory. fsck should be able 
>to fix it running with the --fix option.

I tried this on the image I ran bonnie++ while fsck'ing on.
It suggested --rebuild-sb first, then I did --rebuild-sb --fix and
it worked.

Any ideas or caveats about how to handle my root partition with this?

Do I have to boot my emergency medevac partition and do --fix from there?

Thanks!

-- 
mjt

