From: prj@po.cwru.edu (Paul Jarc)
Subject: reiserfsprogs (3.6.9, .10, .11) installation problems
Date: Wed, 20 Aug 2003 19:51:04 -0400
Message-ID: <m3n0e3ript.fsf@multivac.cwru.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-15379-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

If pdksh is being used to run reiserfsprogs' ./configure, the script
triggers a bug in pdksh.  This line triggers the bug:
		fprintf(fout, "\t\\\" "\n");
AFAICT, this is supposed to become a C string containing tab,
backslash, an newline.  Right?  Then this will work for both bash and
pdksh:
		fprintf(fout, "\\t\\\\\\n");

Also, this earlier line is misspelled:
#define _GNU_SOURSE
It should be:
#define _GNU_SOURCE
                 ^
But since it works even when it's misspelled, it probably doesn't need
to be there at all.


paul
