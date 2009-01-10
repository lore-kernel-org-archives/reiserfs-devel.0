From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiserfsprogs-3.6.21
Date: Sat, 10 Jan 2009 19:28:49 +0300
Message-ID: <4968CCC1.1070106@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs mailing list <reiserfs-devel@vger.kernel.org>, Linux kernel mailing list <linux-kernel@vger.kernel.org>
Cc: Jeff Mahoney <jeffm@suse.com>

Hello everyone.

This contains the following changes since reiserfsprogs-3.6.19:

    Patches from Jeff Mahoney:
    - reiserfsprogs-mkreiserfs-quiet.diff
    - reiserfsprogs-large-block-warning.diff
    - reiserfsprogs-fsck-mapid.diff
    - reiserfsprogs-external-journal-changes.diff
    - reiserfsprogs-remove-stupid-fsck_sleep.diff
    - reiserfsprogs-mkfs-use-o_excl.diff
    - reiserfsprogs-enforce-block-limit.diff
    - reiserfsprogs-large-fs.diff
    - reiserfsprogs-better-fsck-a-behavior.diff
    - reiserfsprogs-remove-dependency-on-asm_unaligned.h.diff
    - reiserfsprogs-progress.diff
    - reiserfsprogs-reorder-libs.diff

    Patches from Ludwig Nussel:
    -
mkreiserfs-set-the-owner-of-the-root-directory-to-the-calling-user.diff

    Patches from Edward Shishkin:
    - reiserfsprogs-disable-small-block.diff
    - reiserfsprogs-new-version.diff

All the patches had been announced at reiserfs-devel mailing
list , and the stuff got testing as a part of latest SuSE distros.

Please, find at http://www.kernel.org/pub/linux/utils/fs/reiserfs

Thanks,
Edward.
