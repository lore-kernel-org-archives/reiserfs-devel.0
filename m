From: "David Dabbs" <david@dabbs.net>
Subject: RE: Fibration questions
Date: Wed, 21 Jul 2004 01:36:15 -0500
Message-ID: <20040721063607.1A09015C92@mail03.powweb.com>
References: <40FE0B47.3010600@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19718-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40FE0B47.3010600@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: 'David Masover' <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com



> |
> | No, not really, at least you (as a filesystem client) don't specify the
> | fibration when searching for an object. Yes, when the key is generated,
> of
> | course the fibration bits matter, but they simply come from a blackbox
> | plugin function that simply operates on the name and which may differ
> per
> 
> Thus, a fibration plugin must rely on the name to decide how to fibrate
> something, because at lookup time, this plugin is asked "I'm looking for
> a file named foo, how is that fibrated?"
> 
> | directory. As Hans pointed out, there may be an opportunity to offer
> some
> | explicit support for * via the syscall interface -- as to whether or
> not the
> | implementation would even involve fibration is open for discussion.
> 
> It might.  If I'm looking for *.foo and fibration is by last character
> in filename, then the system knows to only look in the *o files.
> 

Yes, which is where I started off. BTW, the default fibration plugin uses
the last filename character when period is the preceding character, though
that's the joy of plugins -- one can do whatever one wants! 


> | yet, for me at least. There's still so much to learn about what's here.
> 
> I agree.  I'd much rather get the practical things done -- a stable
> release, inclusion in distros, patches to common apps.
> 
> Also, I think I want to reimplement (a subset of) Lustre using reiser4
> as a cache.  If I do any coding, it'll be on that.
> 

I'll have to look into that more, too. So many things to do, so little time
to have fun.


David



