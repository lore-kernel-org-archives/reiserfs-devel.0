From: Chris Mason <mason@suse.com>
Subject: Re: I would like to see ReiserFS V3 enter a feature freeze real
	soon.
Date: Tue, 01 Jun 2004 07:37:07 -0400
Message-ID: <1086089827.22636.3391.camel@watt.suse.com>
References: <20040528122854.GA23491@clipper.ens.fr>
	 <1085748363.22636.3102.camel@watt.suse.com>
	 <1085750828.1914.385.camel@tribesman.namesys.com>
	 <1085751695.22636.3163.camel@watt.suse.com>  <40BB61C0.5020902@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18941-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40BB61C0.5020902@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: Vladimir Saveliev <vs@namesys.com>, Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Andrew Morton <akpm@osdl.org>, Alexander Zarochentcev <zam@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>

On Mon, 2004-05-31 at 12:48, Hans Reiser wrote:
> While I like and appreciate the data journaling stuff, and I think it 
> should go in, real soon now I think we should avoid adding new features 
> to V3.  Let the mission critical server folks have a reiserfs version 
> that only gets bug fixes added to it, and let V4 be for those who want 
> excitement.
> 
> Are there any things which Chris and Jeff think should go in besides 
> data journaling/ordering and bitmap algorithm changes?
> 

We've got io error fault tolerance that needs to go in after the barrier
code has stabilized.  I can't promise that I'll never making another
change in there, but my goal is to keep them to a minimum.

> Also, I would like to see some serious benchmarks of the bitmap 
> algorithm changes before they go in.  They seem nice in theory, and some 
> users liked them for their uses, but that does not make a serious 
> scientific study.  Such a study has a high chance of making them even 
> better.;-)
> 

Some benchmarks have been posted on reiserfs-list, but I'd love to
coordinate with you on getting some mongo numbers.  I can spout off a
long list of places where the code does better then the original v3
allocator, but that's because those were the ones I was trying to fix
;-)

> zam, I view you as the block allocator maintainer, please review that 
> bitmap code from Chris.
> 
> Chris and Jeff, can you propose a benchmarking plan for the bitmap code?

A good start would be to just rebenchmark against v4.

-chris


