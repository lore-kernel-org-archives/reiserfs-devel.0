From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: viewprinting processes and process oriented permissions got funded
Date: Wed, 14 Apr 2004 12:44:26 +0300
Message-ID: <20040414094426.GK14134@nysv.org>
References: <407CB314.8020700@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17921-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <407CB314.8020700@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hans Reiser wrote:

>I am still thinking through how we will implement views in Reiser4.

A question of grace, again, if you please.

Does the current plugin architecture allow views to be implemented
directly or will it affect the on-disk layout in a manner which
requires mkfs?

I'm fairly certain that it should not require mkfs, but as something
of the local Reiser4 advocate I just want to make sure :)

BTW, the READ.ME for 2004.04.26:
d. readdir() over NFS has known problems.

I think I may be something of a successful advocate; a friend is considering
Reiser4 for his RAIDed NFS file server, because it needs an overhaul.

Although it's not a production system, I think his input on possible
failures would be welcome and of course some stability (no need to mkfs
a big-assed system) on the filesystem's part would be good to guarantee.

So, basically, have you decided on when the next snapshot is due
with NFS issues fixed? ;)

Thanks!

-- 
mjt

