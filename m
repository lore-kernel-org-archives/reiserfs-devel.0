From: "ndiowona" <v.ndiowona@aramiska.net>
Subject: filesystem corruption howto ???
Date: Fri, 11 Apr 2003 08:05:41 +0200
Message-ID: <KNEEIPAKDPLGFNIPLECJEELNHDAA.v.ndiowona@aramiska.net>
References: <20030411015312.GA20912@coloppl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13639-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030411015312.GA20912@coloppl>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hi,
I'm running RH linux  2.2.20 with reiserfs.I have some trouble with the wn
web server.
The system reports me the following message:

wnsd: can't create temp directory /tmp/wn_tmp99.
When I " cd /tmp",running "ls -ltr" reports me the following:
ls: wn_temp99: Input/Output error
ls: ftpcopy2.log: Input/Output error
-rw-r--r-- 1 root root 246 apr 10:02 ftpcopy1.log

Can someone tell me how to fix this problem?
I think it can be a filesystem corruption.tmp is not a partition but just a
directory under "/" partition

Many thanks for your help

Vincent



