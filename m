From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: preexisting 'metas'?
Date: Sun, 13 Jun 2004 13:00:23 +0300
Message-ID: <20040613100022.GI4990@nysv.org>
References: <40CBB63E.4060001@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19164-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40CBB63E.4060001@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: reiserfs-list@namesys.com

On Sat, Jun 12, 2004 at 09:04:46PM -0500, David Masover wrote:
>I finally got sick of having the metas directory named 'metas'.  I went
>in and found (quite easily -- clean-ish looking code) the label name and
>changed it to '...' (sanest option for me).

http://mjt.nysv.org/reiser/reiser4.metas.patch
Which is afaik incorporated in some patch sets is not big.

>metas dir pops back in.  Then I can't overwrite it again (make a new dir
>called '...', or move the old one back).

Hans once asked if we would be happy if we could rename the metas/ directory.
I at least opposed this, at least (iirc) as long as it's invisible to readdir,
which it should be until the end of time. Consider people losing their metas
directory, you'd have to be able to look up every name through /proc/ or
something for every cwd.

Thanks, you just tested something I've been thinking about testing for a long
time :)

Anything you decide to reserve from the fs namespace is bound to be reserved
for real use. It's the monkeys, typewriters and Hamlet[1]

[1]
Been years since I read that one, may misremember...

-- 
mjt

