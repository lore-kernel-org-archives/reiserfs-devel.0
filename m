From: Chris Mason <mason@suse.com>
Subject: data logging and quota updated for 2.4.23
Date: Thu, 04 Dec 2003 11:04:49 -0500
Message-ID: <1070553889.27611.147.camel@tiny.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16225-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello everyone,

ftp.suse.com/pub/people/mason/patches/data-logging/2.4.23

Will have a new version of the data logging and quota code as soon as
the suse mirror system copies it over.

There are two changes here, first is 01-reiserfs-free-blocks, which
fixes a problem where reiserfs can falsely report the disk is full.

This required rediffing reiserfs-sync-fs and the data logging patch.

reiserfs-jh-3 has been removed while I work out a bug in it.  It
probably won't reappear in 2.4 form, since I'm trying to spend all my
time on 2.6 these days.  Aside from critical bug fixes (which I don't
expect ;) and minor merges with later 2.4 code, this should be the last
data logging/quota drop for 2.4

-chris


