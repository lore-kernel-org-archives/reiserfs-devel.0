From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck --rebuild-tree on a big filesystem
Date: Thu, 19 Dec 2002 20:00:20 +0300
Message-ID: <20021219200020.A7258@namesys.com>
References: <20021125143634.GC9006@mail.cekit.cz> <20021125143634.GC9006@mail.cekit.cz> <20021125174846.A31778@namesys.com> <atsteb$44s$1@genki.hungrycats.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12177-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <atsteb$44s$1@genki.hungrycats.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zygo Blaxell <eazgwmir@umail.furryterror.org>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Dec 19, 2002 at 04:51:23PM +0000, Zygo Blaxell wrote:

> >> would take about 1 month to complete (started at 2000 blocks/sec, 
> >> but now running at 26b/s).
> My reiserfsck --rebuild-tree has been running for a little over an hour
> and has degraded to 49 blocks/sec (about 10 days).  r-fsck absorbs all

Part of this problem is solved - get latest 3.6.5-pre version of reiserfsprogs
and give it a try.

> Based on past events, the read speed will probably degrade to zero in a
> week or two, if the reiserfsck process doesn't run out of RAM+swap first.

No it won't.

> If you feel that 'debugreiserfs -p ... | bzip2' output would be helpful,
> I could generate it, but that's about 40GB of data.

No, we know what the problem with read speed degradation at pass0 is and
Vitaly have fixed it already.
Also there is similar problem expected at semantic pass that was not dealt with
because we are not yet sure how to solve that. But overall
3.6.5-pre1 should be noticeable faster.

Bye,
    Oleg
