From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: v4 resizer?
Date: Sat, 17 Jul 2004 11:08:51 +0300
Message-ID: <20040717080850.GT4990@nysv.org>
References: <40F79A88.1040803@slaphack.com> <20040716113450.GS4990@nysv.org> <40F8327E.8030304@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19666-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40F8327E.8030304@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

On Fri, Jul 16, 2004 at 02:54:38PM -0500, David Masover wrote:
>
>Only if someone can assure me that the on-disk format will not change
>until there's a resizer available.

It has also been said on many occasions that the on-disk format will
not change. Not in the sense that it would require mkfs.

However, what I would _really_ like an answer to is what will happen
when hsets get implemented, since psets brought a minor fsck-fixable
change with them. Is it sure that we won't have to mkfs then either?

-- 
mjt

