From: "Alexander G. M. Smith" <agmsmith@rogers.com>
Subject: Re: [PATCH] "metas" in reiserfs v4 snapshot 2004.03.26
Date: Thu, 01 Apr 2004 08:00:47 -0500 EST
Message-ID: <86539716373-BeMail@cr593174-a>
References: <200404010546.i315kEvY019805@sirius.cs.pdx.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17641-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200404010546.i315kEvY019805@sirius.cs.pdx.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

Elliott Mitchell wrote on Wed, 31 Mar 2004 21:46:14 -0800 (PST):
> Also I feel it should be on the file itself. ie for the file /tmp/fooblah
> you should be able to access the file's metadata by open()ing/using
> readdir() on /tmp/fooblah/metas or (/tmp/fooblah/..metas or whatever).

Sounds good to me.  I just hope that directory operations are
cheap in the file system.  The alternative of just adding a
..meta. prefix to all attribute names would cut out one level
of directories (less disk space usage, less lookup time to
resolve a path, and no worry about the weirdness of attributes
accidentally getting attached to the ..metas directory itself).

/tmp/fooblah/..metas/mime-type
/tmp/fooblah/..metas.mime-type

Hmmm.  Which is better?  The weirdness factor worries me
more than the performance reduction.

- Alex
