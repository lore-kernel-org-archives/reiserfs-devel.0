From: Matthew Johnson <matthew@psychohorse.com>
Subject: Re: what do you do that stresses your filesystem?
Date: Mon, 23 Dec 2002 10:54:22 -0800
Message-ID: <200212231054.22044.matthew@psychohorse.com>
References: <3E06F360.7000708@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12228-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E06F360.7000708@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS <reiserfs-list@namesys.com>

Some others I can think of...

Running Wine and winex applications

Running games, such as ut2003. I don't mean card games. Running game serv=
ers=20
too...

Starting large Window managers like KDE.

Mat

On Monday 23 December 2002 03:28 am, Hans Reiser wrote:
> We were discussing how to optimize reiser4 best, and came to realize
> that us developers did not have a good enough intuition for what users
> do that stresses their filesystem enough that they care about its
> performance.
>
> If you just do edits of files it probably does not matter too much what
> fs you use.
>
> Booting the machine seems like one activity that many users end up
> waiting on the FS for.  Yes?
>
> Starting up complex and big applications like xemacs and mozilla would
> be another.  Yes?
>
> Others?
>
> Hans
>
> PS
>
> reiser4 performance is up a lot recently, and within two weeks I think
> cp -r will have been optimized as much as is worth doing.  cp -r
> accesses files in readdir order, and that does indeed seem worth
> optimizing, but soon we will need to optimize more sophisticated access
> patterns than that.....
>
> Hans

