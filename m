From: eazgwmir@umail.furryterror.org (Zygo Blaxell)
Subject: Re: reiserfsck --rebuild-tree on a big filesystem
Date: Fri, 20 Dec 2002 16:12:01 +0000 (UTC)
Message-ID: <atvfgh$9tr$1@genki.hungrycats.org>
References: <20021125143634.GC9006@mail.cekit.cz> <atsteb$44s$1@genki.hungrycats.org> <20021219200020.A7258@namesys.com> <att918$u36$1@genki.hungrycats.org>
Return-path: <reiserfs-list-return-12188-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

In article <att918$u36$1@genki.hungrycats.org>,
Zygo Blaxell <eazgwmir@umail.furryterror.org> wrote:
>I guess I'll find out in 7 hours what the semantic pass will be like.
>Fortunately I don't need to use this particular filesystem until 2003,
>so there is time to run little experiments like this...

reiserfsck has gotten to pass 3 and is now doing a search of the
filesystem tree file-by-file.  It appears to be progressing without
any major CPU or memory problems.  

Traversing the filesystem tree on this machine (e.g. with 'find')
normally takes 3 days, so I guess we'll know if it works just in time
for Christmas.  ;-)

Is it normal to see hundreds of 

	vpf-10680: The file [5029518 5034490] has the wrong block count in the StatData (16) - corrected to (8)

messages?

-- 
Opinions expressed are my own, I don't speak for my employer, and all that.
Encrypted email preferred.  Go ahead, you know you want to.  ;-)
OpenPGP at work: 3528 A66A A62D 7ACE 7258 E561 E665 AA6F 263D 2C3D
