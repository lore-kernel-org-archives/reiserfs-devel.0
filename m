From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Tue, 30 Mar 2004 15:35:46 +0300
Message-ID: <20040330123546.GA5229@nysv.org>
References: <1080620527.31924.117.camel@localhost.localdomain>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17591-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1080620527.31924.117.camel@localhost.localdomain>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Scott Young wrote:

>/home//attribute would be the an attribute on the home directory. 
...
>Could ..metas be renamed to a null string to get this effect on
>directories?

This sounds like the way it used to be, before the metas/ directory.
Please also note that it's metas/ officially now, not ..metas/

..metas/ is through Piotr Neuman's patch, which has gained some
popularity, but it's not official yet.

I think a double slash is a terrible idea. They are, probably by some
standard, interpreted as a single one in most cases.
As good as Reiser4 already is, it also poses threats to standards
and even some solid security issues with reserving names from the
filesystem.[1]

One concise directory is definitely the best way and I still stand
behind ..metas/ because it's most likely not to be clashed. Some
already pointed out problems with @ and .metas and such.

It's not good to think about lexicographic ordering, btw, because
readdir must not find this directory. Consider the following
times a million when taking a backup:
mjt@shrike:~/..metas/plugin/crypto/..metas/plugin/crypto/..metas$

[1]
Will there be a plugin suitable for for example html documentroots,
that disables the meta directory from its children?
It is unfair, to say the least, to have future users rewrite their
stupid php upload scripts, and every writing script for that matter,
to check that they don't conflict with metas.

It is also a good idea to implement a plugin like this if many people
will take up the habit of renaming their metas/ directories; one
server may have it by another name and that breaks hard-coded checks
in server software.

-- 
mjt

