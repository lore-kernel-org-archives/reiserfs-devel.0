From: Andrew Morton <akpm@osdl.org>
Subject: Re: [Fwd: [PATCH] reiser4: fix a use after free bug in
 reiser4_parse_options]
Date: Mon, 22 Nov 2004 14:43:27 -0800
Message-ID: <20041122144327.2d4c0c52.akpm@osdl.org>
References: <41A2523F.2050201@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22516-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41A2523F.2050201@free.fr>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Laurent Riffard <laurent.riffard@free.fr>
Cc: reiserfs-list@namesys.com

Laurent Riffard <laurent.riffard@free.fr> wrote:
>
> This patch fix a "use after kfree" bug in reiser4_parse_options.

I'll add that to -mm.  In future, please don't allow your email client to
wordwrap patches.  Thanks.

