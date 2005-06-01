From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: File as a directory - VFS Changes
Date: Tue, 31 May 2005 22:11:13 -0400 EDT
Message-ID: <585501533-BeMail@cr593174-a>
References: <17052.12223.708707.757538@gargle.gargle.HOWL>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24252-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <17052.12223.708707.757538@gargle.gargle.HOWL>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Nikita Danilov <nikita@clusterfs.com>
Cc: leocomerford@gmail.com, reiserfs-list@namesys.com, ninja@slaphack.com

Nikita Danilov wrote on Tue, 31 May 2005 13:34:55 +0400:
> Cycle may consists of more graph nodes than fits into memory. Cycle
> detection is crucial for rename semantics, and if
> cycle-just-about-to-be-formed doesn't fit into memory it's not clear how
> to detect it, because tree has to be locked while checked for cycles, and
> one definitely doesn't want to keep such a lock over IO.

Sometimes you'll just have to return an error code if the rename operation
is too complex to be done.  The user will have to then delete individual
leaf files to make the situation simpler.  I hope this won't happen very
often.

On the plus side, the detection of all the files that may be affected
means you can now delete a directory directly, contents and all, if all
the related inodes fit into memory.

- Alex
