From: Tom Vier <tmv@comcast.net>
Subject: Re: reiser4: first impression (vs xfs and jfs)
Date: Wed, 7 Jun 2006 13:58:28 -0400
Message-ID: <20060607175828.GA4670@zero>
References: <20060523155102.GB25889@zero> <20060606134459.GA18513@zero> <1149604706.6389.40.camel@tribesman.namesys.com>
Reply-To: Tom Vier <tmv@comcast.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28758-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1149604706.6389.40.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Tue, Jun 06, 2006 at 06:38:26PM +0400, Vladimir V. Saveliev wrote:
> reiser4 has an option for that.
> mount -o tmgr.atom_max_age=N
> N is decimal number of seconds. Changes older than N will be forced to
> commit.

Unfortunetly, this causes even more read pauses from the source, when
running rsync. I also tried cpio (-p mode) and cp -a, same pauses. When
syncing, r4 seems to have about a 5 second pause, then a burst of seeks and
writes. I also tried disabling clock throttling, no difference. I have a
fast system. Two single core 2.6ghz opterons. CPU time during the pause
after sync and before the writes doesn't seem to very high. I thought r4
might be cpu bound, but it doesn't seem to be. I'm not sure what's causing
this pause. If i had more free time, i'd setup kernel profiling.

-- 
Tom Vier <tmv@comcast.net>
DSA Key ID 0x15741ECE
