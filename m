From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: reiserfsck --rebuild-tree on a big filesystem
Date: Thu, 19 Dec 2002 20:09:12 +0000 (UTC)
Message-ID: <att918$u36$1@genki.hungrycats.org>
References: <20021125143634.GC9006@mail.cekit.cz> <atsteb$44s$1@genki.hungrycats.org> <atsteb$44s$1@genki.hungrycats.org> <20021219200020.A7258@namesys.com>
Return-path: <reiserfs-list-return-12178-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <20021219200020.A7258@namesys.com>,
Oleg Drokin  <green@namesys.com> wrote:
>Part of this problem is solved - get latest 3.6.5-pre version of reiserfsprogs
>and give it a try.

In less than 7 hours pass 0 will be done, at 600-1900 blocks per second.
Memory usage is also constant now--the reiserfsck process has been at
24104K since it started.

>Also there is similar problem expected at semantic pass that was not dealt with
>because we are not yet sure how to solve that. 

I guess I'll find out in 7 hours what the semantic pass will be like.
Fortunately I don't need to use this particular filesystem until 2003,
so there is time to run little experiments like this...

-- 
Opinions expressed are my own, I don't speak for my employer, and all that.
Encrypted email preferred.  Go ahead, you know you want to.  ;-)
OpenPGP at work: 3528 A66A A62D 7ACE 7258 E561 E665 AA6F 263D 2C3D
