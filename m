From: prj@po.cwru.edu (Paul Jarc)
Subject: phantom corruptions
Date: Fri, 30 Aug 2002 17:11:40 -0400
Message-ID: <m3it1shx0d.fsf@multivac.cwru.edu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11353-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

I'm using Linux kernel 2.4.18 and reiserfsprogs 3.6.3.  I have two
filesystems where reiserfsck --check reports that there are
corruptions which can be fixed with --fix-fixable, but --fix-fixable
reports that there are no corruptions.  The full output of is
available here:
http://multivac.cwru.edu./prj/reiser.tar.gz
Should I resort to --rebuild-sb or --rebuild-tree?  Out of curiosity,
can those operations do any harm to a noncorrupted filesystem?


paul
