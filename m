From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: Split Trees (my design, similar to binary treaps)
Date: Thu, 22 May 2003 19:27:59 -0400 EDT
Message-ID: <10375659311-BeMail@cr593174-a>
References: <3ECD53A5.40801@namesys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14216-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3ECD53A5.40801@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com

Hans Reiser wrote on Fri, 23 May 2003 02:48:05 +0400:
> Do nodes contain both pointers and data?

Yes, that's a common way of doing skip lists.  Or the node could contain
the level pointers and a data pointer.  The nodes are also awkwardly
variable sized due to the random number of levels.  That leads to
allocation fragmentation unless extra steps are taken.

I don't know how the split trees approach does it.

- Alex
