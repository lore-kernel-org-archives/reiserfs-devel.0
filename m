From: Jon Smirl <jonsmirl@gmail.com>
Subject: Re: System freeze: __iounmap: bad address dfd00000
Date: Mon, 30 Aug 2004 21:19:52 -0400
Message-ID: <9e473391040830181941d62ed0@mail.gmail.com>
References: <1093735779.41311563b892b@webmail.pd.astro.it>
Reply-To: Jon Smirl <jonsmirl@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21135-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1093735779.41311563b892b@webmail.pd.astro.it>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "biscani@pd.astro.it" <biscani@pd.astro.it>
Cc: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

On Sun, 29 Aug 2004 01:29:39 +0200, biscani@pd.astro.it
<biscani@pd.astro.it> wrote:
> Aug 28 18:43:00 kurtz __iounmap: bad address dfd00000

That address looks like it might be a video card. cat /proc/iomem or
lspci -v will tell you the owner and give you a clue where to look for
problems.
