From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Tue, 30 Mar 2004 15:13:01 +0200
Message-ID: <200403301513.01851.christian.mayrhuber@gmx.net>
References: <20040330123546.GA5229@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17592-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040330123546.GA5229@nysv.org>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

What about introducing an separator for meta information, like
it is / for directories.
This separator could be turned into a mount option to avoid
breakage of some apps.

My suggestion is "@" to become the default separator, because XPath uses
it for attributes and it is THE accepted standard so far.
Filesystems are just a new domain.

On Tuesday 30 March 2004 14:35, Markus TXrnqvist wrote:
> Scott Young wrote:
> >/home//attribute would be the an attribute on the home directory.
"/home@attribute" would be my favour notion in this regard.
A listing of all attributes could be obtained by the notion "/home@*"

I'm not sure if this naming clashes with the reiser4
"A directory is a file" notion.
It won't clash if it is impossible to have
# ls -l 
drwxr-xr-x   11 foo     foo           712 2004-01-21 14:45 bla
-rw-r--r--   11 foo     foo           712 2004-01-21 14:45 bla
on reiser4.

>
> One concise directory is definitely the best way and I still stand
> behind ..metas/ because it's most likely not to be clashed. Some
> already pointed out problems with @ and .metas and such.
the clash of "@" does only occur if the notion is "/home/@", but not
with "/home@".
With the separator being a mount option, this can be turned into 
a non issue.
The separator must turn into an illegal char for filenames, which is not
too limiting, I guess.

> It's not good to think about lexicographic ordering, btw, because
> readdir must not find this directory. Consider the following
> times a million when taking a backup:
> mjt@shrike:~/..metas/plugin/crypto/..metas/plugin/crypto/..metas$
readdir must not see names with are denoted as meta information.

With the @ separator access to plugin/crypto/ would turn into
mjt@shrike:~@plugin/crypto/

PS: I don't know if the introduction of a new separator for meta information 
breaks the vfs standard in any way.

-- 
lg, Chris

