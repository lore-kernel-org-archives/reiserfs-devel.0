From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Wed, 31 Mar 2004 11:52:42 +0300
Message-ID: <20040331085242.GF5229@nysv.org>
References: <200403311027.30359.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17616-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200403311027.30359.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Christian Mayrhuber wrote:

>The most important thing is that once there is an access pattern to meta
>information it is the same for all filesystems on Linux.

Next to impossible to implement probably. How many filesystems have
accessible metadata at the moment?

Besides, in different filesystems the metadata layout will probably
vary, even more than in Reiser4 with its plugin architecture.

However, it would be GREAT if Reiser4 defined a standard here, because
the current layout is poetically beautiful.

-- 
mjt

