From: Andi Kleen <ak@suse.de>
Subject: Re: reiser4 merging action list
Date: Tue, 28 Jun 2005 11:11:17 +0200
Message-ID: <20050628091117.GJ8035@wotan.suse.de>
References: <42BB7B32.4010100@slaphack.com.suse.lists.linux.kernel> <200506240334.j5O3YowB008100@laptop11.inf.utfsm.cl.suse.lists.linux.kernel> <20050627092138.GD11013@nysv.org.suse.lists.linux.kernel> <20050627124255.GB6280@thunk.org.suse.lists.linux.kernel> <42C0578F.7030608@namesys.com.suse.lists.linux.kernel> <20050627212628.GB27805@thunk.org.suse.lists.linux.kernel> <42C084F1.70607@namesys.com.suse.lists.linux.kernel> <p73vf3zuqzq.fsf@verdi.suse.de> <1119947829.3495.25.camel@tribesman.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24749-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1119947829.3495.25.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Vladimir Saveliev <vs@namesys.com>
Cc: Andi Kleen <ak@suse.de>, Hans Reiser <reiser@namesys.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, reiserfs-list@namesys.com, Andrew Morton <akpm@osdl.org>, Christoph Hellwig <hch@infradead.org>

On Tue, Jun 28, 2005 at 12:37:11PM +0400, Vladimir Saveliev wrote:
> have neither prof.[ch], nor spinprof.[ch] and we removed already some
> debugging code from spin_macros.h.

Yes, i was looking at some older tree with reiser4. Sorry, just
ignore what is already done.

But still spin_macros.h should be completely removed imho. Such
custom lock wrappers are strongly discouraged because it 
makes it hard for others to read your code.


> > statcnt.h: This is completely useless because you don't align
> > the individual fields for cache lines - so you will still
> > have false sharing everywhere. Also using NR_CPUS is nasty
> > because it can be very big - num_possible_cpus() is better. 
> > It should use the new dynamic per cpu allocator.
> > 
> statcnt.h is already removed.

Great.

-Andi
