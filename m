From: Michael Weissenbacher <webmaster@dermichi.com>
Subject: Re: IO randomly blocked for >1 minute while disk writes still in
 2.6.16.1 + 2.6.16-reiser4-1
Date: Thu, 30 Mar 2006 21:42:42 +0200
Message-ID: <442C34B2.70506@dermichi.com>
References: <20060330023909.GA7547@rvalles.homedns.org.> <442BD204.4030402@namesys.com> <442C32A0.8030200@dermichi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28415-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <442C32A0.8030200@dermichi.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,
Sorry to quote myself here:
> Another problem i had was specific to the reiser4-for-2.6.16-1.patch.gz
> patch. I got a kernel crash two times now, but wasn't yet able to log
> the error message anywhere because it would not let me write to the
> reiser4 partition after the error. It never corrupted any data though,
> fsck.reiser4 always reported a consistent fs. I'll try to trigger that
> problem again and make another post.
I've just noticed that this second problem i had is identical with the
the thread "Re: kernel BUG at
/usr/src/sources/linux-2.6.16-rc5/fs/reiser4/plugin/file/tail_conversion.c:29"

kind regards,
-- 
/============================================================\
|       Michael Weissenbacher <webmaster@dermichi.com>       |
|                  http://www.dermichi.com/                  |
\============================================================/

