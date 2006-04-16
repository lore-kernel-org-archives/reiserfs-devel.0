From: Paul Pluzhnikov <ppluzhnikov@gmail.com>
Subject: Re: "reiserfsck --fix-fixable" says corrected; but doesn't
Date: Sat, 15 Apr 2006 22:25:22 -0700
Message-ID: <4441D542.8020000@gmail.com>
References: <4441BEA6.3020103@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28499-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4441BEA6.3020103@gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Paul Pluzhnikov wrote:

> Running with '--fix-fixable' finds the same errors, and says
> that it fixed them; but running again finds the same problem again.

Additional clues: the FS (being version 3.5) does not support files over 
2GB.

All 3 files with the problem are a result of a (recent) program
attempting to create a file that is larger than 2GB.

So, AFAICT:
- attempts to write large files on a 3.5 formatted FS (mounted without
  "-o conv") result in an error returned to a client program, and in
  filesystem corruption (actual size (as computed by reiserfsck) exceeds
  the limit) -- kernel BUG!
- attempts to fix such corruption with the latest reiserfsprogs
  don't actually fix it -- reiserfsprogs BUG!

I have removed the 3 offending files (by moving them into lost+found first),
and can do "ls" again :)

However this resulted in additional corruption which wasn't there before :(

  bad_leaf: block 18522164, items 12 and 13: The wrong order of items: 
[134215 570889 0x1 DRCT (2)], [134215 570890 0x1 IND (1)] ...
  Fatal corruptions were found, Semantic pass skipped
  1 found corruptions can be fixed only when running with --rebuild-tree

I'll probably just back up the data and reformat the FS.

Cheers,
