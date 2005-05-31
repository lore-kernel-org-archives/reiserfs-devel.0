From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: File as a directory - VFS Changes
Date: Mon, 30 May 2005 20:20:58 -0400 EDT
Message-ID: <75229416615-BeMail@cr593174-a>
References: <17050.62052.318426.711322@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24223-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17050.62052.318426.711322@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <nikita@clusterfs.com>
Cc: leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com

Nikita Danilov wrote on Mon, 30 May 2005 15:00:52 +0400:
> Nothing in VFS prevents files from supporting both read(2) and
> readdir(3). The problem is with link(2): VFS assumes that directories
> form _tree_, that is, every directory has well-defined parent.

At least that's one problem that's solveable.  Just define one of
the parents as the master parent directory, with a guaranteed path
up to the root, and have the others as auxiliary parents.  That
also gives you a good path name to each and every file-thing.

The VFS or the file system (depending on where the designers want
to split the work) will still have to handle cycles in the graph
to recompute the new master parents, when an old one gets deleted
or moved.

- Alex
