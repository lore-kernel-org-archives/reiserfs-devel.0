From: Chris Mason <mason@suse.com>
Subject: [PATCH CFT] tons of logging patches
Date: 02 Jun 2002 23:51:41 -0400
Message-ID: <1023076301.22608.1778.camel@tiny>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10483-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello everyone,

ftp.suse.com/pub/people/mason/data-logging

has beta code that gives you the following:

external logging devices
data logging mount option (makes fsync and O_SYNC faster)
ordered data mount option (no more garbage in your files after a crash)

optimizations to keep kupdate from triggering commits every 5 seconds
optimizations for tiny transactions to reduce CPU usage and IO.
optimizations for better locking and fewer calls to wakeup()

In short, it adds a bunch of features and makes everything faster.  The
changes are very large, but they also build on older patches that have
been circulating around for months.  It has been through a weekend of
load testing here, but I still won't be surprised if people find
corruption causing bugs.

It needs broad testing and benchmarking, in all the data modes, with a
standard and external journal.

-chris


