From: Amit Gud <amitgud1@gmail.com>
Subject: file as a directory
Date: Mon, 22 Nov 2004 19:24:36 +0530
Message-ID: <2c59f00304112205546349e88e@mail.gmail.com>
Reply-To: Amit Gud <amitgud1@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22492-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: linux-kernel@vger.kernel.org, reiserfs-list@namesys.com

Hi people,

 A straight forward question. Wouldn't adding a "file as a directory"
mechanism more logical in VFS itself, rather than having each fs (like
reiser4) to implement it seperately? My vision is to give archive-file
(.tar, .tar.gz, ...) support in the VFS itself, and of course
transparent to any fs and any user-land application. There are many
archive FSs around, but how feasible would it be to implement the
archive file support in the VFS at dentry-level? I'd be happy to share
my proposal.

AG
--
May the source be with you.
