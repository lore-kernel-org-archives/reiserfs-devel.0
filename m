From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: Broken reiser4 FS
Date: Wed, 25 Aug 2004 15:29:44 +0300
Message-ID: <20040825122944.GO1284@nysv.org>
References: <412C7634.3040908@flipperit.net> <1093436551.10608.7.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20499-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1093436551.10608.7.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Saout <christophe@saout.de>
Cc: Ari =?iso-8859-1?Q?Sovij=E4rvi?= <apz@flipperit.net>, reiserfs-list@namesys.com

On Wed, Aug 25, 2004 at 02:22:31PM +0200, Christophe Saout wrote:
>
>I've also seen a bunch of these on my notebook. I'm ruling out memory
>problems, my hardware is reliable.

Wasn't there some discussion that there may be some issues with Reiser4
still committing journals during umount which leads to data loss in -mm4?

Or was it so that this was fixed in -mm4?

That should not destroy the directory plugin type, though.

>My notebook is sometimes low on memory and swaps a lot while I'm doing
>some disk I/O. This is perhaps increasing the chance of getting this
>corruption, I'm not sure.

That might be consistent with something about files being in swap during
umount and thus not commited?

I don't know if this is a shot in the dark or clutching at straws ;)

Any Namesys guys around? :)

-- 
mjt

