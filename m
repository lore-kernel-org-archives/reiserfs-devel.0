From: "JP Howard" <jh_lists@fastmail.fm>
Subject: file-nr, file-max, and ReiserFS
Date: Tue, 22 Oct 2002 04:41:17 UT
Message-ID: <20021022044118.074F5ECC7@server2.fastmail.fm>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11734-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ReiserFS List <reiserfs-list@namesys.com>

We're currently testing ReiserFS on one of our servers. It's holding up
pretty well so far, except that we're seeing one perculiarity...

The ReiserFS server (running Cyrus and Postfix) has been hitting our max
FDs (/proc/sys/fs/file-max) a few times, which is set at 90,000. However,
we have an Ext3 server with almost the same # of users and overall load,
and it has only hit 20,000 open files (according to
/proc/sys/fs/file-nr).

Does ReiserFS use more file handles for some reason? Is there any
downside to setting file-max to something really big to avoid running out
of FDs? Do you think that this may actually indicate some problem with
our configuration, or this normal for ReiserFS?

Also, I checked with `lsof | wc -l` to see how many files it reported as
open. On the ReiserFS server it only showed 45,000 files as open (when
the system had actually used all 90,000 handles). On the Ext3 server is
showed 30,000 files as open (when the system had actually only used
20,000 handles according to file-nr). I guess I'm wrong to be thinking
that lsof and file-nr should show the same number of open files, but
could someone explain why?

TIA,
  Jeremy
