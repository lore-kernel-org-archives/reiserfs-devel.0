From: David Masover <ninja@slaphack.com>
Subject: Re: Do xml-like namespaces make sense for Reiser4? (re: metas thread)
Date: Wed, 14 Apr 2004 19:28:13 -0500
Message-ID: <407DD71D.30902@slaphack.com>
References: <407AB9AE.3060801@pobox.com> <407ADCBF.8000609@namesys.com> <407AEA05.50004@pobox.com> <407BFBEA.5010006@pobox.com> <407C15D9.1080705@namesys.com> <407C1BE9.8010509@pobox.com> <407C279A.3060303@namesys.com> <407C3004.3070401@pobox.com> <407C316B.80606@namesys.com> <407C35B0.3080109@pobox.com> <407CA700.9070403@slaphack.com> <407D54F9.3020704@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17954-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <407D54F9.3020704@pobox.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "John D. Heintz" <jheintz@pobox.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

John D. Heintz wrote:
| David,
|
| I think you might be onto something, but doing this manually for each
| file isn't viable (in my opinion).

It applies recursively.  Let's assume for a moment that /..foo is a
directory containing pseudo-files, metadata, or whatever the current
term is, for the file '/'.  By creating the file /..foo/something as a
symlink to /..foo/<some long path>/something, you automatically create
/bar/..foo/something, which is a link to /bar/..foo/<same long
path>/something.

| What I think might work is applying symlinks to all files hierarchically
| so that all "*/nsa/*" names resolve to "*/nsa.gov/security/*".

Just what I described above, only it is local to the tree I apply it to,
and files deeper in the hierarchy take precedence.  So, for example, if
I create a link manually for /bar/..foo/something that points somewhere
else, then /bar and all subdirs (and subfiles) of /bar contain that same
link, instead of the one created for /.

| Can you explain more how views would contribute to this? I've read the
| proposal but don't yet see how they would work in practice.

Views are an alternative proposal in which you create a mapping that
looks, feels, and smells like the symlink idea proposed above, only it
works for a single process.  The advantage here is you avoid stepping on
other people's toes, and it could be useful for programs.  However, most
users don't continue to use the same program every time to access the
filesystem, and may want something persistant.

I like the non-view solution best, but I think both are necessary -- the
views are to prevent separate programs accessing similarly named plugins
from stepping on each other's toes.  Imagine we have nsa.gov and
NoSlackingAcademy.com as two "namespaces", and two programs (or shell
scripts) want to simultaneously abbreviate each one to "nsa", on the
same file.

However, the view solution is nice for when a user has some plugin, say
from nsa.gov, that they use manually a lot ("echo 'bar' >
baz/..foo/security") and on almost every file.  It wouldn't affect any
programs that used different concepts, because they would always create
the links they needed first.

I am not sure how views actually work under the hood, so I don't know
how to implement it, but I would suggest that even when trying to make
typing easier, we need to hide these shortcuts somewhere, because
although it looks and acts like a symbolic link, this kind of shortcut
behaves very differently.  This '..metas' (among other suggestions)
sounds like exactly the thing needed here -- symlinks created in there
would be treated as namespace abbreviations and would be duplicated on
all children that didn't already have such a link already.

One more detail about "views" -- assuming we are using '..metas', on
creating a view for this purpose, all symlinks in '..metas' should be
removed, to avoid confusion.

By now I'm sure I've abused several concepts before learning what they
are.  Time to go check the whitepaper for updates...


|
| Thanks for the reply.
|
| John
|
|
| David Masover wrote:
|
| John D. Heintz wrote:
| | Hans Reiser wrote:
| |
| |> John D. Heintz wrote:
| |>
| |>>
| |>> Does some sort of syntactic shorthand actually break the set
| |>> theoretic naming system rules?  Or is this just something you view as
| |>> needless complexity?
| |>
| |>
| |>
| |> precisely what syntactic shorthand?
| |
| |
| |
| |
| | foo/nsa:permissions -> foo/nsa.gov/secure-linux/permissions
| |
| | This assumes a mapping from "nsa" -> "nsa.gov/security/".
| |
| | The characters up to the ':' would be looked up in a namespaces map,
| and
| | if found the substituion would occur before further name-> object
| | resolution. I don't think this breaks the goals set out in the "Future
| | Vision" white paper, but I guess that is exactly what I am asking
| you ;-)
|
| Since we are allowed "views", how about this:  make foo/nsa a symlink to
| foo/nsa.gov.  Or, alternatively, make foo/nsa/permissions a symlink to
| foo/nsa.gov/secure-linux/permissions.  These symlinks would only exist
| for either the process (and its children) which established them, or for
| all children of the file with that linkfarm, I'm not sure which.
|
| In the first example, you'd do something like this:
|
| ln -s /..some.pseudo.file/nsa.gov/secure-linux/permissions \
| /..some.pseudo.file/nsa/permissions
| (hoping it handles directory creation here)
|
| The problem here is only children of 'ls' are affected, meaning shell
| scripts don't work unless shells are modified, which is why I like this
| better:
|
| ln -s foo/nsa.gov/secure-linux/permissions foo/nsa/permissions
|
| now we have
|
| foo/nsa/permissions -> foo/nsa.gov/secure-linux/permissions
|
| but now, if foo is a directory, we also have
|
| foo/bar/nsa/permissions -> foo/bar/nsa.gov/secure-linux/permissions
|
| The only thing here is, if foo is a directory, we probably want to hide
| the whole construct somehow anyway.  I'll leave that to others -- I
| joined this discussion a little too late to _really_ know what I'm
| talking about.
|
| Either way, some sort of shortcut (and I'm suggesting symlinks to keep
| it Unix) controlled from user-space keeps the main advantage of XML
| namespaces -- you can have much more than just "nsa.gov/secure-linux",
| but any arbitrary length you want, and users handle the namespace
| collisions for you (that would result from creating something like
| foo/permissions)
|>
|>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQH3XHXgHNmZLgCUhAQJSJQ/+IZEMPe9d/zovn1JgRKhGe6cCNeX5c19D
2BDmYeCiXbmK+TtR9Q7KeS4nPE5RgvmEtkHZ00LoMTblxL9WNsRoQSCxJEEdTYGe
ioFEKbPVNmmrd7RJsYSQVx7+Dx299JmCoOHmUuB45raATdV6yzKNVb3I819xFtrI
cS4egyfMlIs4NQtq1GrrXMVXFCstiWuPsZcbbc78eTCIb0pTcs/mkWWcB9kl1VjQ
kWIrHR6Qb0epLKSR0NrqikQK3rT3sqA5IZNYqgiVIu1tO+grkzEyUydcrZZTYV8f
9ZM3OIy5rbuMn/Ki+TnTQCN4nQ71o/JzhuAQq73EHYmTwot9IYhJGb74SWfD2Usg
Tw9WvWzKaSo5ev261/6zQkIuvB0dvvt6FdbA2KR6ok1ckaJnVyeUjIqEAF42b5Dt
JMkR3DGHE+CyzL2sjPxQA3nCK5JZ4Osq/N6yQXnD+8nfPjqlv6hy1fzjlDLAdWJC
zGxBIpr7jKHfweE1zRCJlO+IpTokWibSw7E/oTSqZZKGGayXu/x+AFmQPY8N8cz/
PBkTgieqSKSUuIvNhetMvL8QPmqz3+eou9051aPSaf838NTTFA5D6JXkfAMhCaBb
9ji/QyQgp7QwrXX/yOB9h40zaSSIkm57IGo3LK74928wiLIkhhE9wh7aztgVQtcE
j2nbiT/XRzU=
=TEE5
-----END PGP SIGNATURE-----
