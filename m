From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] Fix reiserfs oops on small fs
Date: Thu, 18 Nov 2004 09:09:43 -0500
Message-ID: <1100786983.18452.35.camel@watt.suse.com>
References: <20041118114928.GD2767@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22412-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041118114928.GD2767@atrey.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

On Thu, 2004-11-18 at 12:49 +0100, Jan Kara wrote:
>   Hello!
> 
>   Attached patch fixes oops of reiserfs on a filesystem with just one
> bitmap block - current code always tries to return second bitmap even if
> there's not any. Could someone review it please so that it can be merged
> in mainline?

Hi Jan,

A slightly different form of this patch is in already.  Look for the
checks in bmap_hash_id.  Are you still able to reproduce this bug on
kernels newer than October 18?

-chris


