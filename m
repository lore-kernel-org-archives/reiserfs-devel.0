From: "Kathy KN (HK)" <kathy.kn@gmail.com>
Subject: What does reiserfs_do_truncate do?
Date: Thu, 7 Apr 2005 14:31:48 +0800
Message-ID: <f8ad67b305040623316b328b52@mail.gmail.com>
Reply-To: "Kathy KN (HK)" <kathy.kn@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23794-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Good day all,

I know that reiserfs_do_truncate is used to truncate
the tails of arbitrary files, but what does truncation
really do? Is it an action to remove the file? What do
you mean by packing the tails? Compressing it or
to delete them or?

Kathy
