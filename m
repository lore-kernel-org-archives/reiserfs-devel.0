From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: fsck.reiser4 segfaults
Date: Fri, 16 Jul 2004 12:33:13 +0300
Message-ID: <20040716093313.GR4990@nysv.org>
References: <200407151559.41256.kos@supportwizard.com> <200407152245.57083.kos@supportwizard.com> <200407152309.10968.vitaly@namesys.com> <200407152322.22803.kos@supportwizard.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19655-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200407152322.22803.kos@supportwizard.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konstantin Sobolev <kos@supportwizard.com>
Cc: reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>

On Thu, Jul 15, 2004 at 11:22:22PM +0400, Konstantin Sobolev wrote:
>Yeah. Luckily I've found LiveCD with 2.6.7 sources patched with one of 
>autosnapshots that successfully mounted my /usr, so now I'll be able to build 
>new kernel. Can you recommend some more or less stable autosnapshot that I 
>can use?

Seems that generally later autosnapshots are better autosnapshots.

It is recommended you turn on assertion debuggings, especially if you
don't want any faster performance than "fast enough". Just in case.

-- 
mjt

