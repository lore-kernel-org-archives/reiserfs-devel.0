From: Stefan Schweizer <sschweizer@gmail.com>
Subject: Reiser4 mount support, Grub support
Date: Thu, 19 Aug 2004 17:21:04 +0200
Message-ID: <e7963922040819082125b7d8aa@mail.gmail.com>
Reply-To: Stefan Schweizer <sschweizer@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20404-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com, Vitaly Fertman <vitaly@namesys.com>

Hi,

is there a patch for util-linux to support reiser4 w/o -t reiser4 in mount?

The grub support is not really ready yet.
Symlinks do not work.
And if I try to specify the direct path it is accepted.
But when I try to boot it says invalid compress format  :(


Stefan Schweizer
