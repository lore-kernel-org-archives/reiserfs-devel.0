From: David Masover <ninja@slaphack.com>
Subject: Re: ".meta." as a Name Prefix
Date: Sun, 25 Apr 2004 14:33:54 -0500
Message-ID: <408C12A2.9010005@slaphack.com>
References: <2407572152-BeMail@cr593174-a> <4085C7B2.4010104@slaphack.com> <4085E2E1.8080302@pobox.com> <408B503B.30700@slaphack.com> <408BD43F.2070107@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18214-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <408BD43F.2070107@pobox.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "John D. Heintz" <jheintz@pobox.com>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

| David,
|
| Something I think I've understood from the code is that plugins aren't
| restricted to the metas directory. Any PSEUDO_PLUGIN can create a root
| name that is looked up everywhere.

Thank you for that clarification, though I'm not sure it's relevant
here.  Try replacing my use of "meta" in those examples with "foo".

Also, someone mentioned that a lack of namespace collisions was more of
a problem than the collisions themselves -- that everyone tries to make
a unique name, and comes up with many copies of the same thing which
really should be the same.  I'd suggest that it's better to have a bunch
of redundant but working plugins than a bunch of intuitive and
non-redundant but occasionally failing plugins.

| That doesn't mean that PSEUDO_PLUGINs that do this will be accepted into
| the codebase or distributions, but there is no actual boundary between
| adding new names to foo/ instead of foo/metas.

As far as what's accepted, I can't imagine that there'd be so much
complexity in the "standard" plugins that no one could go and check for
redundancy, and communicate with the plugin authors about it.

|
| John
|
| David Masover wrote:
|
| |> cat urn:namesys.com:reiser4:meta/shortName
| |> echo "..meta" > urn:namesys.com:reiser4:meta/shortName
|
| Revisiting this idea:  this is a good idea for what happens _inside_ the
| metas dir, for plugins.  But metas itself is a general enough,
| well-enough designed and probably lasting concept that I think we can
| use something like '...' or '..metas', or whatever is reasonably unique
| _now_, and assume that once reiser4 hits mainstream usage, people will
| be careful to develop around that name.
|
| Inside the metas dir, though, we have plugins.  And if plugins could be
| dynamic, even mostly in userspace, then we have the problem of plugins
| becoming so popular that we have namespace collisions there.  I like
| this solution, though -- it's kind of like the XML namespace concept,
| something which should be in every language.
|
| Using some mechanism, not sure what yet, you create a set of mappings:
|
| meta/r4 -> meta/namesys.com/reiser4
| meta/ -> meta/namesys.com/reiser4
|
| They aren't really symlinks because the second option is for making all
| children of meta/namesys.com/reiser4 available under meta/, so if you
| had:
|
| meta/namesys.com/reiser4/bmap
| meta/namesys.com/reiser4/plugin
| meta/slaphack.com/happyface/:)
|
| Now you have:
|
| meta/bmap
| meta/namesys.com/reiser4/bmap
| meta/namesys.com/reiser4/plugin
| meta/plugin
| meta/slaphack.com/happyface/:)
|
| More specific things would override less specific things, and in general
| these mappings aren't allowed to touch anything that isn't itself a
| mapping.
|
| I think you would use symlink() for setting these things up (cd meta; ln
| ~ -s namesys.com/reiser4 r4 || ln -s namesys.com/reiser4 .), and even if
| they were completely dynamic, the files themselves would read like
| symlinks.
|
| I heard someone say something like "reiser4 is almost shipped", so it
| may be too late to send in ideas (especially ones which I've probably
| said before), but I thought I'd drop this in anyway.  (sorry for the
| noise if I _have_ said it before.)
|>
|>

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQIwSnHgHNmZLgCUhAQLBIhAAkTsQLoQBBpQDHzX7HE6oc1j5s4D2oqcy
7tmBEtD5IeDERB37winb2EghAOnWXwNEHVSnQKkxmBJfttKytP2mv3UT077d+qEZ
xhCCHGMSA1EI+TyrgZVJsp8Qy34M8ciYTWoA97Cy8LOtou26YDxCZYVfB5j3PTkx
RTF9QB3F9ZcPu9HqYTpHQ5TqAyqzneZyHJYPPxI9ctWfbuJwKUUifz0CQ/1aY31L
IeV4vhGCMAPGGLF/Ll7d4q9VrrCxNQSfvxKmIK7ZSlo3gip4lxNOskRChXWEw7sR
Fng0kbsYAHkdtWfW/rP8NJe/YWgZsb+sldk/6M8zf5C8qssvU4lwOgyDSOBHqDtO
Lb+RCvJXBPJjeeRBM9RY8sLHVt9ie2uXC5hVVegynpMlMdN0lE81CCeeF9YtxA4F
icrQA6rtuOISY7Kw43v2P25/dHs9ZmsId1kV3gsVNMBi29wiRIru1lBdRuiJCZjg
yccDm53sZw46eq8ghuJ9niKyr9Unhnyz+RiJrJKr1v6juwm8YK3MnBr+RZwZRDei
FCfzScRp2rOz0gCXPKWBpt37Bv+ecAPn81gmL+wh+upY78FWqD5taPSZfq/1IGZQ
lnk5tSGQmS2lAfBjFnvCsUNmh/RFExpJew+zDbvHzsZy+G8JXb0VsPbxOJIjt0Bp
SUZZQQrya+0=
=o3i3
-----END PGP SIGNATURE-----
