From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Thu, 1 Apr 2004 19:14:25 +0200
Message-ID: <200404011914.25900.christian.mayrhuber@gmx.net>
References: <20040401163120.98834.qmail@web25006.mail.ukl.yahoo.com> <200404011837.57924.chrivers@iversen-net.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17650-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404011837.57924.chrivers@iversen-net.dk>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thursday 01 April 2004 18:37, Christian Iversen wrote:
> On Thursday 01 April 2004 18:31, Narcoleptic Electron wrote:
> > If there are other approaches not addressed here, or
> > clarification required, please feel free to revise
> > this list.
>
> I think someone suggested putting meta file information in /proc.
>
> So. Is this a bad idea? I think not.
>
> In this scheme, /some/file would have /proc/metas/some/file/* as meta
> information.
Reiser4 would have to mimic the device structure in /proc.
If someone wants to access meta information he would have
to lookup the device of his filesystem.
What about nfs?
This is not compatible, nor comfortable.

>
> This reduces the risk of conflict to 0.
>
> One other idea I have, is "...". That way,
>
> dir/. is the directory itself
> dir/.. is the parent
> and
> dir/... is the meta info.
Really elegant!
Not perfect, tough - it is not descriptive, but "." and ".." are not
better in this regard, too.

I don't know any software using "..." files, so I'd say go for it, it's the
best suggestion so far, IMHO.

-- 
lg, Chris

