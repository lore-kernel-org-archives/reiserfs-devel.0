From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Wed, 31 Mar 2004 11:43:35 +0300
Message-ID: <20040331084335.GE5229@nysv.org>
References: <200403310620.i2V6K7D9018881@sirius.cs.pdx.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17615-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200403310620.i2V6K7D9018881@sirius.cs.pdx.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Elliot Mitchell wrote:

>But how often do you need to access meta information directly from a
>shell? Most of the time it would be a GUI tool accessing the extra data,
>do you normally need to use `file` before doing anything?

Assumptions are bad things. If I understood this correctly, in my
caffeine-depraved just-woken-up state.
(So I'm making an assumption too ;)

It seems a GUY tool accessing the extra data is way off in the future.
I might write some pyglade toy for this some day, but in general I
don't use GUI software. I know many others who don't either.

So the shell is the way to go.

On a sort-of other note:
I'm not sure either what Hans Reiser meant by a macro, does that mean
a settable variable? It's a decent compromise, I think. As someone
else stated, let's just hope for an inoffensive default.

-- 
mjt

