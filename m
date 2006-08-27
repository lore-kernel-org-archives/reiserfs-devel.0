From: "Ray Lee" <madrabbit@gmail.com>
Subject: Re: Reiser4 und LZO compression
Date: Sun, 27 Aug 2006 01:49:50 -0700
Message-ID: <2c0942db0608270149r4755cc1dj5a970ecd44dc2350@mail.gmail.com>
References: <20060827003426.GB5204@martell.zuzino.mipt.ru>
	 <20060827010428.5c9d943b.akpm@osdl.org>
Reply-To: ray-gmail@madrabbit.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29697-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20060827010428.5c9d943b.akpm@osdl.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Morton <akpm@osdl.org>
Cc: Alexey Dobriyan <adobriyan@gmail.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

On 8/27/06, Andrew Morton <akpm@osdl.org> wrote:
> On Sun, 27 Aug 2006 04:34:26 +0400
> Alexey Dobriyan <adobriyan@gmail.com> wrote:
>
> > The patch below is so-called reiser4 LZO compression plugin as extracted
> > from 2.6.18-rc4-mm3.
> >
> > I think it is an unauditable piece of shit and thus should not enter
> > mainline.

Sheesh.

> Like lib/inflate.c (and this new code should arguably be in lib/).
>
> The problem is that if we clean this up, we've diverged very much from the
> upstream implementation.  So taking in fixes and features from upstream
> becomes harder and more error-prone.

Right. How about putting it in as so that everyone can track
divergences, but to not use it for a real compile. Rather, consider it
meta-source, and do mechanical, repeatable transformations only,
starting with something like:

mv minilzo.c minilzo._c
cpp 2>/dev/null -w -P -C -nostdinc -dI minilzo._c >minilzo.c
lindent minilzo.c

to generate a version that can be audited. Doing so on a version of
minilzo.c google found on the web generated something that looked much
like any other stream coder source I've read, so it approaches
readability. Of a sorts. Further cleanups could be done with cpp -D to
rename some of the more bizarre symbols.

Downside is that bugs would have to be fixed in the 'meta-source'
(horrible name, but it's late here), but at least they could be found
(potentially) easier than in the original.

Ray
