From: Russell Coker <bofh@coker.com.au>
Subject: Re: Reserved Blocks
Date: Mon, 16 Sep 2002 18:48:09 +0200
Message-ID: <200209161848.09466.bofh@coker.com.au>
References: <20020916102742.6538D2926@hofmann.snowcra.sh> <200209161450.g8GEorM4003750@turing-police.cc.vt.edu> <20020916161413.05CFC297C@hofmann.snowcra.sh>
Reply-To: Russell Coker <bofh@coker.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11480-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020916161413.05CFC297C@hofmann.snowcra.sh>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sam Vilain <sam@vilain.net>, Valdis.Kletnieks@vt.edu
Cc: reiserfs-list@namesys.com

On Mon, 16 Sep 2002 18:14, Sam Vilain wrote:
> Pragmatic concerns aside, it is still necessary on systems with a
> sound filesystem arrangement. /var/tmp is still on the same partition
> for everyone. Programs need space in /var/tmp, /var/run, etc.
> Therefore, without quotas or superuser reserved blocks, any user can
> fill up /var/tmp, which may be needed to write pid files and all the
> `per-system state information' we've come to expect in /var over the
> years.

I sometimes have /tmp be a symlink to /var/tmp/tmp, then /var/tmp may be a 
separate file system, or just part of the /var file system.

-- 
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

