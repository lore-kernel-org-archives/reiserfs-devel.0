From: Devils-Hawk <devilshawk@aon.at>
Subject: reiser4 panic in do_readpage_extent
Date: Thu, 08 Mar 2007 13:17:56 +0100
Message-ID: <45EFFEF4.1030003@aon.at>
References: <45E888F0.7070604@free.fr> <45E88AAB.90701@free.fr> <45EC5141.6090807@stransky.cx> <45EC89D4.70505@free.fr> <45ED981E.501@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30590-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <45ED981E.501@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shishkin <edward@namesys.com>
Cc: "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Recently tried switching from 2.6.18 + reiser4-for-2.6.18-r3.patch.gz, 
which works perfectly fine to 2.6.19 + reiser4-for-2.6.19-r3.patch.gz
I also tried 2.6.20 laurent riffard's reiser4-for-2.6.20. The last both 
die somewhere during init when one of the 2 following asserts fails:
extent_file_ops, Line 1160: assert("nikita-2688"),j)
extent_file_ops, Line 1161: assert("vs-1426"),jnode_page(j) == NULL )

fs was fsck'ed with reiser4progs-1.0.5

regards DevH
