From: Stefan Schweizer <sschweizer@gmail.com>
Subject: Re: http://www.namesys.com/snapshots/2004.08.09-internal.testing/
Date: Mon, 9 Aug 2004 23:18:43 +0200
Message-ID: <e796392204080914182c9dcc7a@mail.gmail.com>
References: <200408092355.13380.vitaly@namesys.com> <e796392204080913384ac39553@mail.gmail.com> <200408100057.57087.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20110-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200408100057.57087.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

ok, it makes it compile, but it does not work for me:

grub> kernel (hd0,1)/
Error 17: Cannot mount selected partition

Perhabs this is related to not converting my reiser4 partition to the
new format due to the segfault.

Stefan
