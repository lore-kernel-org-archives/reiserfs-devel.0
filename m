From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: ".meta." as a Name Prefix
Date: Sun, 25 Apr 2004 10:02:16 -0400 EDT
Message-ID: <40428365695-BeMail@cr593174-a>
References: <408B503B.30700@slaphack.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-18207-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <408B503B.30700@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

David Masover wrote on Sun, 25 Apr 2004 00:44:27 -0500:
> Inside the metas dir, though, we have plugins.  And if plugins could be
> dynamic, even mostly in userspace, then we have the problem of plugins
> becoming so popular that we have namespace collisions there.  I like
> this solution, though -- it's kind of like the XML namespace concept,
> something which should be in every language.

Actually the problem in real life (from BeOS experience) is the lack of
collisions.   Everybody keeps on prefixing their new attribute set with
a unique identifier (usually looking like "UNIQUER:attribute" in BeOS)
so you end up with redundancies like MAIL:subject and PINEAPPLE:subject
which should really be the same thing (since e-mail messages and UseNet
news are so similar and I want to search all subjects when looking
for a lost message).  Of course, this could be worked around by having
aliases of attribute names (sounds like another plugin), but it would
be nice if we had a standard set of attribute names.  Dublin core, anyone?

- Alex
