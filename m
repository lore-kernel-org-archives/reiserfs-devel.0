From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: fsck 0.5.5 time
Date: Fri, 18 Jun 2004 15:14:58 +0300
Message-ID: <20040618121458.GH4990@nysv.org>
References: <20040618110112.GG4990@nysv.org> <40D2D82B.3090301@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19250-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40D2D82B.3090301@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com

On Fri, Jun 18, 2004 at 03:55:23PM +0400, Vladimir V. Saveliev wrote:

>Can you just leave it to work? When you will be back - everything will 
>be done

I would love to, but the point lies in taking the desktop with me and doing
work from elsewhere. Actually a LAN Party but I will spend most my time
there working.

>>Are there any risks in using the read-only mounted /home/ while fscking?
>If it mounts - you can probably use it. Just do not be surprised with 
>EIO, ENOENT, etc

I'm not doing anything heavy with it, as most software wants to write
something to the disk. Watching a music DVD and using ssh is now
going on.

>How do you run fsck.reiser4?

With -v --fix

FSCK: Node (8134683), item (0), [29:0:2a] (stat40): needs pset member (6) set
to
(stat40). Added. 
FSCK: Directory [104d1:61767300000000:104d2] (dir40), node [2064563], item
[6],
unit [10]: entry has wrong offset 
[104d2:0(NAME):1616c6976616c74:696f736968746565:30a1a50eff86ab5c]. Should be 
[104d2:0(NAME):1616c6976616c74:696f736968746565:7b6737fc14d277c]. 

Besides that there is no output. I don't really know what else there could
be, maybe something like the weird data in --build-sb[1] or anything
that lets the end-user know something is actually happening.

Or maybe I'm the only one who wants verbosity to be real verbose :)

[1] 
What does that --build-sb info mean?
Coordinates in the tree or something? But they fluctuate at what looks close
to random.

Thanks for the reply!

-- 
mjt

