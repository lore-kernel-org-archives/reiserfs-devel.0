From: =?iso-8859-2?Q?Artur_Mak=F3wka?= <juice@ursynow.2a.pl>
Subject: reiser4 crashes
Date: Wed, 28 Sep 2005 15:20:05 +0200
Message-ID: <002a01c5c42f$589e6610$0300a8c0@JUICE1>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-26295-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: reiserfs-list@namesys.com

Hello, my server crashed few times latetly, and the only strange thing i 
found in logs, are reiser4 entries just before every crash:

#1 crash:

kern.log:Sep 27 21:09:06 werewolf kernel: reiser4[pure-ftpd-mysql(18871)]: 
parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
kern.log:Sep 27 21:09:06 werewolf kernel: reiser4[pure-ftpd-mysql(18871)]: 
extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
kern.log:Sep 27 21:09:06 werewolf kernel: reiser4[pure-ftpd-mysql(18871)]: 
release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(15867)]: 
parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(15867)]: 
cut_tree_object (fs/reiser4/tree.c:1723)[nikita-2861]:
kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(18812)]: 
parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(18812)]: 
extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(18812)]: 
release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(18883)]: 
parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(18883)]: 
cut_tree_object (fs/reiser4/tree.c:1723)[nikita-2861]:
kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(18883)]: 
extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(18883)]: 
release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(15867)]: 
parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
kern.log:Sep 27 21:09:08 werewolf kernel: reiser4[pure-ftpd-mysql(15867)]: 
cut_tree_object (fs/reiser4/tree.c:1723)[nikita-2861]:
kern.log:Sep 27 21:15:31 werewolf kernel: reiser4[pure-ftpd-mysql(18809)]: 
parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
kern.log:Sep 27 21:15:31 werewolf kernel: reiser4[pure-ftpd-mysql(18809)]: 
extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
kern.log:Sep 27 21:15:31 werewolf kernel: reiser4[pure-ftpd-mysql(18809)]: 
release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
kern.log:Sep 27 21:26:48 werewolf kernel: reiser4[pure-ftpd-mysql(18685)]: 
parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
kern.log:Sep 27 21:26:48 werewolf kernel: reiser4[pure-ftpd-mysql(18685)]: 
extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
kern.log:Sep 27 21:26:48 werewolf kernel: reiser4[pure-ftpd-mysql(18685)]: 
release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
kern.log:Sep 27 21:33:16 werewolf kernel: reiser4[pure-ftpd-mysql(18548)]: 
parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
kern.log:Sep 27 21:33:16 werewolf kernel: reiser4[pure-ftpd-mysql(18548)]: 
extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
kern.log:Sep 27 21:33:16 werewolf kernel: reiser4[pure-ftpd-mysql(18548)]: 
release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:

#2 crash:

Sep 28 13:55:42 werewolf kernel: reiser4[pure-ftpd-mysql(31716)]: 
parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
Sep 28 13:55:42 werewolf kernel: WARNING: Wrong level found in node: 1 != 
227
Sep 28 13:55:42 werewolf kernel: reiser4[pure-ftpd-mysql(31716)]: 
extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
Sep 28 13:55:42 werewolf kernel: WARNING: Partial conversion of 4774068: 0 
of 1: -5
Sep 28 13:55:42 werewolf kernel: reiser4[pure-ftpd-mysql(31716)]: 
release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
Sep 28 13:55:42 werewolf kernel: WARNING: Failed to convert in 
release_unix_file (4774068)
Sep 28 13:55:42 werewolf kernel: reiser4[pure-ftpd-mysql(1826)]: 
parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
Sep 28 13:55:42 werewolf kernel: WARNING: Wrong level found in node: 1 != 
227
Sep 28 13:55:42 werewolf kernel: reiser4[pure-ftpd-mysql(1826)]: 
cut_tree_object (fs/reiser4/tree.c:1723)[nikita-2861]:
Sep 28 13:55:42 werewolf kernel: WARNING: failure: -5
Sep 28 13:56:04 werewolf kernel: reiser4[pure-ftpd-mysql(31745)]: 
parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
Sep 28 13:56:04 werewolf kernel: WARNING: Wrong level found in node: 1 != 
227
Sep 28 13:56:04 werewolf kernel: reiser4[pure-ftpd-mysql(31745)]: 
cut_tree_object (fs/reiser4/tree.c:1723)[nikita-2861]:
Sep 28 13:56:04 werewolf kernel: WARNING: failure: -5
Sep 28 13:56:04 werewolf kernel: reiser4[pure-ftpd-mysql(31745)]: 
extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
Sep 28 13:56:04 werewolf kernel: WARNING: Partial conversion of 4774081: 0 
of 1: -5
Sep 28 13:56:04 werewolf kernel: reiser4[pure-ftpd-mysql(31745)]: 
release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
Sep 28 13:56:04 werewolf kernel: WARNING: Failed to convert in 
release_unix_file (4774081)
Sep 28 13:56:04 werewolf kernel: reiser4[pure-ftpd-mysql(1826)]: 
parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
Sep 28 13:56:04 werewolf kernel: WARNING: Wrong level found in node: 1 != 
227
Sep 28 13:56:04 werewolf kernel: reiser4[pure-ftpd-mysql(1826)]: 
cut_tree_object (fs/reiser4/tree.c:1723)[nikita-2861]:
Sep 28 13:56:04 werewolf kernel: WARNING: failure: -5
Sep 28 13:57:25 werewolf kernel: reiser4[pure-ftpd-mysql(30789)]: 
parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
Sep 28 13:57:25 werewolf kernel: WARNING: Wrong level found in node: 1 != 
227
Sep 28 13:57:25 werewolf kernel: reiser4[pure-ftpd-mysql(30789)]: 
extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
Sep 28 13:57:25 werewolf kernel: WARNING: Partial conversion of 4773762: 0 
of 1: -5
Sep 28 13:57:25 werewolf kernel: reiser4[pure-ftpd-mysql(30789)]: 
release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
Sep 28 13:57:25 werewolf kernel: WARNING: Failed to convert in 
release_unix_file (4773762)
Sep 28 13:59:06 werewolf kernel: reiser4[pure-ftpd-mysql(30231)]: 
parse_node40 (fs/reiser4/plugin/node/node40.c:746)[nikita-494]:
Sep 28 13:59:06 werewolf kernel: WARNING: Wrong level found in node: 1 != 
227
Sep 28 13:59:06 werewolf kernel: reiser4[pure-ftpd-mysql(30231)]: 
extent2tail (fs/reiser4/plugin/file/tail_conversion.c:666)[nikita-2282]:
Sep 28 13:59:06 werewolf kernel: WARNING: Partial conversion of 4773593: 0 
of 1: -5
Sep 28 13:59:06 werewolf kernel: reiser4[pure-ftpd-mysql(30231)]: 
release_unix_file (fs/reiser4/plugin/file/file.c:2297)[nikita-3233]:
Sep 28 13:59:06 werewolf kernel: WARNING: Failed to convert in 
release_unix_file (4773593)


this is quite traffic-heavy server (free hosting with lots of accounts)

im using reiser4 , kernel 2.6.12.3 with 2.6.12 latest reiser4 patches,
reiser4progs 1.0.5, and its Debian.

those entries i pasted logged like few minutes (or even less) before every 
crash, and they happen other than these 'crashing' situations..

can you help me?


