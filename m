From: Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>
Subject: Re: ReiserFS problems
Date: Wed, 6 Aug 2003 21:21:07 +0200
Message-ID: <20030806212107.A3975@bitwizard.nl>
References: <20030806182055.A28562@bitwizard.nl> <3F31303A.6020408@namesys.com> <3F314BE8.50300@suse.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15199-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3F314BE8.50300@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jeff Mahoney <jeffm@suse.com>
Cc: Hans Reiser <reiser@namesys.com>, Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

On Wed, Aug 06, 2003 at 02:41:44PM -0400, Jeff Mahoney wrote:
> What is the workload that is producing the horrible slowdowns?

write at 20Mb per second into files of 1Gb each. 

It was reported, and you guys told me it was a bug that had 
been fixed.  we refused to upgrade to the recommended version
back then. But we might have gotten an upgrade due to a general
kernel upgrade since then. But we try to keep the filesystem
at < 90% full anyway. 

Recommendation: Make that "10%" a variable, settable by the
"reserved-for-root" parameter...

Is there a way that allows me to see the fill-percentage of
our block groups?

	Roger. 

-- 
+-- Rogier Wolff -- www.harddisk-recovery.nl -- 0800 220 20 20 --
| Files foetsie, bestanden kwijt, alle data weg?!
| Blijf kalm en neem contact op met Harddisk-recovery.nl!
