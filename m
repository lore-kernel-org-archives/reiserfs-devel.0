From: Edward Shishkin <edward@namesys.com>
Subject: Re: reiser4 panic in do_readpage_extent
Date: Fri, 09 Mar 2007 04:17:14 +0300
Message-ID: <45F0B59A.80801@namesys.com>
References: <45E888F0.7070604@free.fr> <45E88AAB.90701@free.fr> <45EC5141.6090807@stransky.cx> <45EC89D4.70505@free.fr> <45ED981E.501@namesys.com> <45EFFEF4.1030003@aon.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30593-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <45EFFEF4.1030003@aon.at>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Devils-Hawk <devilshawk@aon.at>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Devils-Hawk wrote:

> Recently tried switching from 2.6.18 + reiser4-for-2.6.18-r3.patch.gz, 
> which works perfectly fine to 2.6.19 + reiser4-for-2.6.19-r3.patch.gz
> I also tried 2.6.20 laurent riffard's reiser4-for-2.6.20. The last 
> both die somewhere during init when one of the 2 following asserts fails:
> extent_file_ops, Line 1160: assert("nikita-2688"),j)
> extent_file_ops, Line 1161: assert("vs-1426"),jnode_page(j) == NULL )
>

It seems, new file_read is not happy.
Thanks for the report, we'll take a look.

Edward.

> fs was fsck'ed with reiser4progs-1.0.5
>
> regards DevH
>
>

