From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Tue, 30 Mar 2004 16:38:26 +0300
Message-ID: <20040330133826.GB5229@nysv.org>
References: <200403301513.01851.christian.mayrhuber@gmx.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-17593-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200403301513.01851.christian.mayrhuber@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Christian Mayrhuber wrote:

>What about introducing an separator for meta information, like
>it is / for directories.

This is per se not a bad idea, imo.

>This separator could be turned into a mount option to avoid
>breakage of some apps.

I dislike mount options, but it may be worth a thought.

We talked on IRC about having a dynamic name for the metas/ directory,
possibly defined in make config, possibly controlled via sysfs and
many other alternatives. Also that it could be used through a read-only
envirinonment variable set by the kernel.

Nikita Danilov shot this idea down and I'm glad he did, although it
was my idea, because it smells like a kludge.

>With the @ separator access to plugin/crypto/ would turn into
>mjt@shrike:~@plugin/crypto/

I think this is not bad, but what would be the way to see the
contents of @? would it be
mjt@shrike:~$ ls @
bmap  items  locality  nlink  pagecache  pseudo   rwx   uid
gid   key    new       oid    plugin     readdir  size
or something?

But we must think rationally. What are the odds that the guys at
Namesys will induce any changes to the naming scheme being this
close to releasing?
How many man-hours would this take, seeing that it does not break
VFS or anything?

We already have one system for this which is, in all honesty,
in my opinion at least, good.
It just needs two things, made secure for servers without rewriting
userland software, that is, making sure no-one gets unwarranted
write access to pseudofiles AND having a non-offensive name.

I wouldn't stand against having @ as a separator, necessarily,
but it isn't my choice and I think we can be satisfied with what
we have. Even if it takes manually adding two dots to one line of code ;)

-- 
mjt

