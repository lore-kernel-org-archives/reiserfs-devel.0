From: Soeren Sonnenburg <reiserfs@nn7.de>
Subject: Re: Promise raid controller writes to disk, anybody know where?
Date: 16 Apr 2003 23:26:06 +0200
Message-ID: <1050528366.13617.16.camel@fortknox>
References: <3E9D83B7.4050904@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13690-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E9D83B7.4050904@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs-List@namesys.com

On Wed, 2003-04-16 at 18:24, Hans Reiser wrote:
> I just bought this motherboard with a promise raid controller builtin 
> whose manual mentions that it writes information to disk (volume and 
> config info I believe).  Anybody know where it does this, and whether I 
> need to be worried about it stepping on something?

Yes, I just threw 2 promise controllers away because the drivers are
damn instable (at least for kernels 2.4.19- 21pre7).

If you don't want to risk unnecessary crashes buy a controller that is
*really* supported like the highpointech/cmd/3ware/via ones.

Soeren.

