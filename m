From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: reiser4 on alpha
Date: Tue, 29 Jun 2004 20:38:29 +0400
Message-ID: <20040629163829.GT5080@backtop.namesys.com>
References: <20040626015101.3c47427d.pegasus@nerv.eu.org> <20040626064131.GN5080@backtop.namesys.com> <20040626095732.24379346.pegasus@nerv.eu.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19445-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040626095732.24379346.pegasus@nerv.eu.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jure Pe??ar <pegasus@nerv.eu.org>
Cc: reiserfs-list@namesys.com

On Sat, Jun 26, 2004 at 09:57:32AM +0200, Jure Pe??ar wrote:
> On Sat, 26 Jun 2004 10:41:31 +0400
> Alex Zarochentsev <zam@namesys.com> wrote:
> 
> > > {standard input}: Assembler messages:
> > > {standard input}:5: Warning: setting incorrect section attributes for
> > > .got
> > 
> > Does only reiser4 produce the above warning?
> 
> No. I get these from various parts of the kernel, but are a lot less
> frequent now on 2.6.7 than on previous kernels.
> 
> > > Looking at fs/reiser4/debug.h suggest that this is something done on
> > > purpose to guard against other problems.
> > 
> > yes, "duplicated case value" is a result of our compile-time assertion if
> > it fails.
> > 
> > But the assertion is wrong because the assumtion that struct coord has no
> > implicit padding is wrong on alpha.
> 
> Do i undestrand that right, the fix is just to comment out the c1->pad line
> there?

you can remove the wrong caccert.  

-- 
Alex.
