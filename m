From: Oleg Drokin <green@namesys.com>
Subject: Re: vs-5150: search_by_key: invalid format found in block 30690. Fsck?
Date: Mon, 18 Aug 2003 17:35:31 +0400
Message-ID: <20030818133530.GE10536@namesys.com>
References: <200308151939.03324.vadim_t@teleline.es> <20030818060852.GB16183@namesys.com> <200308181000.23244.vadim_t@teleline.es>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15362-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200308181000.23244.vadim_t@teleline.es>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vadim <vadim_t@teleline.es>
Cc: reiserfs mailing list <reiserfs-list@namesys.com>

Hello!

On Mon, Aug 18, 2003 at 10:00:16AM +0200, Vadim wrote:

> Excuse me if this is a stupid question, but hdparm doesn't seem 
> to have any arguments to disable write cache. How do I do that?

hdparm -W0 will do that.

> I did know ReiserFS is supposed to be used without write cache, 
> but for some reason I thought that my old disk probably wouldn't 
> have one. Perhaps ReiserFS should automatically disable write 
> cache on the disks it's used on?

This is not reiserfs' business.
But the solution called IDE barriers is going to be implemented soon (at least
in 2.6, there is standalone patch that does this in SuSE kernels, too)

Bye,
    Oleg
