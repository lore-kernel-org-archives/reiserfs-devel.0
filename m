From: "Felix E. Klee" <felix.klee.reiserfs@gmx.net>
Subject: Quicker alternative to "find /"?
Date: Sun, 15 Aug 2004 23:16:40 +0200
Message-ID: <20040815231640.3c926886.felix.klee.reiserfs@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20304-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs-List@Namesys.COM

Hi,

I'd like to store the directory structure of a partition formatted as
ReiserFS into a file. Currently, I use

    find / >file

This process takes approximately 5 minutes (the result is 26MB of
data). Are there any alternative *quicker* ways to do this?

Felix

PS: To contact me off list don't reply but send mail to "felix.klee" at
the domain "inka.de". Otherwise your email to me might get automatically
deleted!
