From: Vitaly Fertman <vitaly@namesys.com>
Subject: reiserfsprogs-3.6.4-pre2
Date: Tue, 17 Sep 2002 17:23:08 +0400
Message-ID: <200209171723.09026.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11494-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com


Hi all,

A new reiserfsprogs pre release is available at
ftp.namesys.com/pub/reiserfsprogs/pre/reiserfsprogs-3.6.4-pre2.tar.gz

Changes went into 3.6.4-pre2:

fix-fixable sets correct item formats in item headers if needed.
rebuild got some extra checks for invalid tails on pass0.
fsck check does not complain on wrong file sizes if safelink exists.
check dma mode/spead of harddrive and warn the user if it descreased 
  -- it could happen due to some hardware problem.

Bugs:

during conversion tails to indirect items on pass2 and back conversion 
  on semantic pass.
not proper cleaning flags in item headers.
during relocation of shared objects.
new block allocating on pass2 (very rare case).

Changes went into 3.6.4-pre1:

Correction of nlinks on fix-fixable was disabled, because
  fix-fixable zeroes nlinks on the first pass and wants to
  increment them on semantic pass. But semantic pass is skipped
  if there are fatal corruptions.
Exit codes were fixed.
Warning/error messages were changed to more user friendly form.

Changes which got into 3.6.3-pre1, but were not included into the 
release:

Great speedups for pass2 of reiserfsck.

Thanks,
Vitaly Fertman
