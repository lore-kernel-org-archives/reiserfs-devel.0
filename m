From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: [patch] Repacker stats
Date: Sun, 17 Oct 2004 17:25:43 +0300
Message-ID: <20041017142543.GI26192@nysv.org>
References: <200410171001.05150.sikkh@wp.pl>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22082-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200410171001.05150.sikkh@wp.pl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Piotr Neuman <sikkh@wp.pl>
Cc: reiserfs-list@namesys.com

On Sun, Oct 17, 2004 at 10:01:05AM +0200, Piotr Neuman wrote:
>
>This patch allows reading of repacker stats while it is working. It creates 
>two files in repacker sysfs hierarchy: formatted_nodes and unformatted_nodes, 
>which correspond to the stats that repacker prints after it has finished.

Cheers for the sikkhmeister :)

I started hacking something of an analyzer, but being in this very
tired mood and all, I think at least the math parts of it are broken ;)

Latest version:
http://mjt.nysv.org/reiser/repacker_stats/03-repackerstat.py

Kludgy to the max, but I hope I can teach it to do graphs at some point
and also to start and stop the repacker with different settings.
Once that's done, all it needs is a port to C and it should be shippable.

All help is appreciated, as always.

-- 
mjt

