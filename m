From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: broken out archives
Date: Fri, 01 Apr 2005 16:01:20 +0400
Message-ID: <1112356879.3754.15.camel@tribesman.namesys.com>
References: <1112308041.4916.6.camel@gentoo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-23750-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1112308041.4916.6.camel@gentoo>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jake Maciejewski <maciejej@msoe.edu>
Cc: reiserfs-list@namesys.com

Hello

On Fri, 2005-04-01 at 02:27, Jake Maciejewski wrote:
> The broken out archives for reiser4 on vanilla (eg.
> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.11/reiser4-for-2.6.11-broken-out.2.gz ) should be renamed to indicate that they're gzipped tarballs, not gzipped diffs.
> 
renamed to reiser4-for-2.6.11-broken-out.2.tar.gz

> It would also be convenient if Namesys supplied complete patches as was
> done with previous vanilla port releases.

ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.11/reiser4-for-2.6.11-3.patch.gz
(this contains 3 bug fixes:
support for mount -o sync
bug in safe link handling
fix for deadlock reported in
http://marc.theaimsgroup.com/?l=reiserfs&m=111213523422408&w=2)

Sorry, no broken-out version for this.

Thanks

