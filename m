From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] Expose sync_fs()
Date: Thu, 18 Nov 2004 09:10:47 -0500
Message-ID: <1100787048.18452.37.camel@watt.suse.com>
References: <20041118120031.GE2767@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22413-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041118120031.GE2767@atrey.karlin.mff.cuni.cz>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: reiserfs-list@namesys.com, linux-fsdevel@vger.kernel.org

On Thu, 2004-11-18 at 13:00 +0100, Jan Kara wrote:
>   Hello!
> 
>   Attached patch makes reiserfs provide sync_fs() function. It is
> necessary for a new quota code to work correctly and expose quota data
> to the user space after quotaoff. Currently the functionality is hidden
> behind the write_super() call which also seems a bit non-intuitive to me.
> Do you think the patch is acceptable?


Looks fine.

-chris


