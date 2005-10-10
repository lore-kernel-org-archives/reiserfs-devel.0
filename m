From: Matt Stegman <matts@ksu.edu>
Subject: Re: Reiser4 file recovery
Date: Mon, 10 Oct 2005 11:11:04 -0500 (CDT)
Message-ID: <Pine.GSO.4.44L.0510101106550.21679-100000@unix2.cc.ksu.edu>
References: <200510101723.53412.chrivers@iversen-net.dk>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-26456-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200510101723.53412.chrivers@iversen-net.dk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Mon, 10 Oct 2005, Christian Iversen wrote:
> Since you lost all the metadata, recovery of the filesystem structure is
> impossible. What you can still do, however, is attempt automated recovery
> using file "magic"-signatures. One very good program that does exactly this,
> is Jonas Jensen's Magic Rescue:
>
> http://jbj.rapanden.dk/magicrescue/
>
> This has many "recipes" for finding files. The included ones can search for
> png, jpeg, zip and several others. I know there's a recipe for MP3s as well.
>
> Let us know how it works out.

Just hope and pray your files aren't fragmented at all.  If they are, then
you NEED the metadata to know which fragments belong to which files (and
with Reiser's tail packing, file tails are located in tree nodes [I think]
which would be even harder to reconstruct).

In short, never throw away data if you want to have a chance of recovery.
If you can get that first disk back, do so before trying anything.

-- 
Matt Stegman



