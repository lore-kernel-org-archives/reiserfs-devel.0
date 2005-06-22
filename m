From: Edward Shishkin <edward@namesys.com>
Subject: Re: How to make Reiser4 plugins&namespace magic work?
Date: Wed, 22 Jun 2005 19:32:19 +0400
Message-ID: <42B98483.1000209@namesys.com>
References: <1119450117.2429.35.camel@rik-note.loc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24464-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1119450117.2429.35.camel@rik-note.loc>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: rik@osrc.info
Cc: ReiserFS List <reiserfs-list@namesys.com>

Roman I Khimov wrote:

>Hello.
>
>Andrew Morton mentioned that "patches still contain all the
>reiser4-specific namespace enhancements, only it is disabled, so it is
>effectively dead code" and it seems this explains why I didn't see any
>of Reiser4 namespace magic last time I've tried to play with it.
>
>But actually I want to see it and I want to play with it - any recipe
>for how to revive this code?
>
>Thanks.
>
>  
>
Hello.
You might want to enable pseudo interface having
 #define ENABLE_REISER4_PSEUDO (1)
in reiser4.h, build the kernel and read this paper:
http://thebsh.namesys.com/v4/pseudo.html
Note, that this paper is not updated, so use "...." instead of "metas".
Also in order to use this interface for regular files the last ones 
should have an executable flag.

Thanks,
Edward.

