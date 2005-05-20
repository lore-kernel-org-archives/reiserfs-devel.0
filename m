From: Chris Mason <mason@suse.com>
Subject: Re: [PATCH] Make reiserfs BUG on too big transaction
Date: Thu, 19 May 2005 20:11:23 -0400
Message-ID: <200505192011.24550.mason@suse.com>
References: <20050519093613.GB1871@atrey.karlin.mff.cuni.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24088-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20050519093613.GB1871@atrey.karlin.mff.cuni.cz>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Kara <jack@suse.cz>
Cc: reiserfs-list@namesys.com, akpm@osdl.org

On Thursday 19 May 2005 05:36, Jan Kara wrote:
>   Hello!
>
>   Attached patch makes reiserfs BUG() when somebody tries to start a
> larger transaction than it's allowed (currently the code just silently
> deadlocks). I think this is a better behaviour. Can you please apply the
> patch?

Ack, looks ok.  In theory, we could return an error instead and force the FS 
into readonly mode, but it's better to catch the offending caller.

-chris
