From: Nikita Danilov <Nikita@Namesys.COM>
Subject: V4: pseudo files, RFC
Date: Fri, 27 Jun 2003 19:29:00 +0400
Message-ID: <16124.25276.200844.669916@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14732-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello,

now, that after so long time spent developing core reiser4 functionality
we became bored, we would like for a diversion to get some feedback and
comments on advanced semantical capabilities featured by it.

As readers of http://www.namesys.com/v4/v4.html know, one of the goals
of reiser4 (and whole reiserfs project at the larger scale) is to extend
file system name space to cover information not usually available
through path names.

Reiser4 already made some progress here and at
http://www.namesys.com/v4/pseudo.html one can examine a list of "pseudo"
files, implemented in the latest code, with descriptions and examples of
their usage.

Any comments, questions, and proposals are welcome.

There is, however, one particular question, that we would like to
discuss. UNIX traditionally treated read and execute permissions on the
directories as permissions for readdir and lookup respectively. In
reiser4 it is possible to have valid path name of the form A/B, where A
is a regular file (not directory). As path name resolution is handled at
the VFS layer (above reiser4), pseudo files are only accessible when
user possesses execute permission for its host. Two obvious solutions
are

1. ignore problem, and,

2. add another type of permission (lookup), teach VFS to use it for
directory lookups, mapping it back to execute by default. This would
probably complicate the process of the integration of reiser4 into the
core kernel.

Nikita.
