From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Plugin for corruption resistance?
Date: Fri, 11 Feb 2005 13:58:59 -0500
Message-ID: <e692861c05021110583585f84e@mail.gmail.com>
Reply-To: Gregory Maxwell <gmaxwell@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Anyone ever given a though to adding support to reiserfs to store a
cryptographic checksum along with a file?


The idea is that files get a hidden attribute that contains their SHA1 hash.
If the file is modified, the hash is marked as 'unclean'. A trusted
cleaner comes by eventually and hashes the file, OR the file is hashed
right away if someone tried to read the attribute while the file is
unclean.

Fsck could be optionally told to go check the hash on every file.
Files could also be tested via a background process that randomly
tests some files every night.

Why would this be useful?

1. Lots of applications today (such a P2P sharing systems) need the
hashes of files.. it's inefficient to keep recomputing them.  The file
system always knows when a file changes, so it can be setup to always
return the correct hash.

2. Random disk corruption can go undetected (even if the drives ECC is
sufficient to prevent corruption there could be memory, bus, or kernel
issues the corrupt data, a hash will help it be detected).

3. Although there are encrypted block devices available in Linux, none
of them can provide authentication.. So it's possible for an attacker
(with access to your disk) to replace hunks of files with random (and
potentially chosen depending on the chaining mode) crud without
detection.

4. It could greatly speed up casual verification of files for changes
(if you don't trust the kernel to report the true hash, then you
couldn't trust it to return the real file to some userspace file
verifier either).... it could also be used to help locate duplicates
in a very efficient manner..
