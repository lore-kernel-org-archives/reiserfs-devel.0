From: kalium@gmx.de
Subject: Master file/metadata table? dualistic trees?
Date: Sat, 18 Jun 2005 03:14:37 +0200 (MEST)
Message-ID: <32198.1119057277@www30.gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24410-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com

ReiserFS/Reiser4 is supposed to be something like an efficient storage DB
for lots of small files. Problem: perusing the files' metadata information
(last modified time, file size etc.) takes much too much time -- most
probably because that data is scattered all over the disk.

The rsync tool, for example, is mostly used to keep extremely large file
repositories in sync. But, on reiserfs, it definitely takes much to much
time to compile only the file list. I think this is pretty much an every day
task and it should be used as a benchmark for ReiserFS/4.

Couldn't ReiserFS just be divided into two trees using _two_ root nodes? One
tree could be located at the beginning of the disk, the other one at the end
of it. The first one would contain all metadata information, the second one
all file data. The first one would in most cases be rather small and
therefore almost always reside in the read cache of the OS.

I don't know if the separation of metadata and file data would cause a
degredation of performance in other use cases. Has someone already tested
this?

Would be really great if I had not to wait a few minutes just to find and
copy over a few updated files within my repository.

-- 
Weitersagen: GMX DSL-Flatrates mit Tempo-Garantie!
Ab 4,99 Euro/Monat: http://www.gmx.net/de/go/dsl
