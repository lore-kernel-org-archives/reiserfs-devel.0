From: "Mpriyan" <mpriyan@coolgoose.com>
Subject: Help on reiserfs documentation
Date: Tue, 21 Sep 2004 16:11:18 -0500
Message-ID: <1095797478.862934535@as03.coolgoose.com>
Return-path: <reiserfs-list-return-21866-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Hello All,

I'm learning about reiserfs. So, I'm looking for some documentation that can
explain how the file data is organized on disk in reiserfs 3.6. The
documentation that is available in www.namesys.com says that it is for reiserfs 4.

Do reiserfs 3.6 and reiserfs 4 have same ondisk structure ? I understand that
they differ in the way they provide the atomicity. But other than that do they
have the same layout ?

Does reiserfs 3.6 use B+ tree for storing its data ? In the source code,
it looks like they use some stree. Are there standard definitions of stree
? Or is it a variant of B+ tree with a different name ?

If someone can point me to some documentation, it would be of great help.

-M
