From: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH] Fix reiserfs oops on small fs
Date: Fri, 19 Nov 2004 10:31:23 +0100
Message-ID: <20041119093123.GA15189@atrey.karlin.mff.cuni.cz>
References: <20041118114928.GD2767@atrey.karlin.mff.cuni.cz> <1100786983.18452.35.camel@watt.suse.com>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1100786983.18452.35.camel@watt.suse.com>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

> On Thu, 2004-11-18 at 12:49 +0100, Jan Kara wrote:
> >   Hello!
> > 
> >   Attached patch fixes oops of reiserfs on a filesystem with just one
> > bitmap block - current code always tries to return second bitmap even if
> > there's not any. Could someone review it please so that it can be merged
> > in mainline?
> 
> A slightly different form of this patch is in already.  Look for the
> checks in bmap_hash_id.  Are you still able to reproduce this bug on
> kernels newer than October 18?
  Sorry. I've missed that the bug was already fixed in the other place.
It looks OK now.
								Honza

-- 
Jan Kara <jack@suse.cz>
SuSE CR Labs
