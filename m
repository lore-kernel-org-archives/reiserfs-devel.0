From: Oleg Drokin <green@namesys.com>
Subject: Re: [PATCH] various allocator optimizations
Date: Thu, 13 Mar 2003 15:10:44 +0300
Message-ID: <20030313151044.A10203@namesys.com>
References: <1047433739.8215.487.camel@tiny.suse.com> <20030312101222.A8452@namesys.com> <1047475876.8215.507.camel@tiny.suse.com> <3E6F3D80.80306@namesys.com> <20030312170522.A2128@namesys.com> <3E6F3F55.2030503@namesys.com> <20030312171718.C2128@namesys.com> <3E6F8909.7080805@namesys.com> <20030313091129.B3026@namesys.com> <3E707449.5070007@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13243-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E707449.5070007@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Chris Mason <mason@suse.com>, reiserfs-list@namesys.com, Alexander Zarochentcev <zam@namesys.com>

Hello!

On Thu, Mar 13, 2003 at 03:06:33PM +0300, Hans Reiser wrote:
> >>>True for repacker. I do not see for allocate on flush will help.
> >>>I see how relocate on flush may help ;)
> >>If you don't allocate it until flush, you don't need to reallocate at 
> >>flush time...;-)
> >But what if we have some free space in already existing node, and new file 
> >information
> >perfectly fits in there?
> We reallocate dirty nodes that are not in the most optimal location when 
> we flush them.

Yes, that's what I am saying. Relocation on flush (for existing node).
Allocation on flush (for new nodes) won't help in above-described scenario.

Bye,
    Oleg
