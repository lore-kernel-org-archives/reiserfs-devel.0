From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: status of reiser4
Date: Mon, 20 Dec 2004 07:48:28 +0200
Message-ID: <20041220054828.GS26192@nysv.org>
References: <41C322ED.4000807@namesys.com> <1103309648.8570.28.camel@localhost>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22843-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1103309648.8570.28.camel@localhost>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: Hans Reiser <reiser@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Fri, Dec 17, 2004 at 12:54:08PM -0600, Jake Maciejewski wrote:
>Have there been any reports other than Isaac's of reiser4 working on
>AMD64? It still doesn't work for me, and I'd like to know if I'm the
>only one having problems.

I recently purchased an AMD64 setup.
Here's the catch; I did so because my old box went belly-up and now
it seems the GFX card is broken (The box shut itself down and doesn't
boot if the GFX card has its extra power cable connected, regardless
of the amount of other hardware. I hate hardware.)

Anyway, due to severe space limitations, I couldn't back my home up
so I'm hoping it'll work long enough for me to wiggle some stuff
somewhere else.

My plan for testing is to use Reiser4 in (at least) an x86 chroot,
which should hit amd64 bugs nonetheless, because the only difference
is how the software is compiled, yes?

Anything specific I should look out for? Nothing I have in my home
directory is _that_ critical for me to get out _now_, but I would
like to get it some day :>

Thanks guys!

-- 
mjt

