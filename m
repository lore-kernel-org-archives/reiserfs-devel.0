From: Sander <sander@humilis.net>
Subject: Re: Collect data?
Date: Wed, 23 Nov 2005 13:17:51 +0100
Message-ID: <20051123121751.GC26252@favonius>
References: <200511171447.41362.mail@earthworm.de> <20051123104847.GA22178@favonius> <438450EA.5050409@namesys.com> <200511231253.37328.mail@earthworm.de>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-27107-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200511231253.37328.mail@earthworm.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Hesse, Christian" <mail@earthworm.de>
Cc: "Vladimir V. Saveliev" <vs@namesys.com>, sander@humilis.net, reiserfs-list@namesys.com, "E.Gryaznova" <grev@namesys.com>

Hesse, Christian wrote (ao):
> For Sander's list:
> 
> http://www.earthworm.de/tmp/reiser4-fsync.c
> strace -T -e sync,fsync reiser4-fsync

I've added this one, but it segfaults at my system:

$ gcc -o reiser4-fsync reiser4-fsync.c 
$ strace -T -e sync,fsync ./reiser4-fsync
Segmentation fault

Any idea?

> Good kernels is everything 2.6.13* and before.

Added, thanks!

-- 
Humilis IT Services and Solutions
http://www.humilis.net
