From: Yury Umanets <umka@namesys.com>
Subject: Just to mention...
Date: Wed, 06 Aug 2003 17:18:38 +0400
Message-ID: <1060175917.16296.11.camel@haron.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15173-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-dev@namesys.com
Cc: reiserfs-list@namesys.com

Hello all,

I just want to let our developers and testers know, that mkfs and
another reiser4 utility programs has changed their options recently. So,
it is probably needed to update benchmarks, scripts, etc.

For instance, to create reiser4 with short keys you need to type
something like this:

mkfs.reiser4 -qf /dev/test_device -o key=key_short

and to create reiser4 with particular tail policy you need to type the
following:

mkfs.reiser4 -qf /dev/test_device -o policy=(tails|extents|smart)

To list all available plugins and current profile use 
mkfs.reiser4 -p and mkfs.reiser4 -P correspondingly.

See corresponding manual pages for details.

Happy testing.

Regards.


