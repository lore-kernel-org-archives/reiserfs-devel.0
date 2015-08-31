From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Reiser4: Format 4.0.1: Meta(data) checksums
Date: Mon, 31 Aug 2015 17:21:04 +0200
Message-ID: <55E470E0.2070304@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:subject:to:message-id:date:user-agent:mime-version
         :content-type:content-transfer-encoding;
        bh=gw1/cSvFT0Lq3ODy0gQ1qOgnO4yN8hABzElHFDdjHRs=;
        b=GQIMDO2WlvVqDMyYvFIEhrtyGgCa3L7VW4mrIY46vis0jyDQ/cjGWjRR4Hx/Bjkf/B
         BOyk+Fcm3yMVOjCtJt0z/e1vKgMpyTn4UKttO8GadlZOxTFZDz+tF2wAdIRJg6GqI5xz
         jOy5ofke0Yb8g2CIZmJ3nRzU9ZQ2lIEkyhqX4ch2QxVEgBapk8JXI23dGQczZRemlqRL
         WlIWurxUNy5m6oG/iozGLGuA+Q9lz7yVZtH+AyQxJQOYGt5I1H/mJ83ZGdvmCWgCpOlj
         oJbcsi14r2oJ6bzVINd2G9Vv/8Osv2zq0ZG3rIeVAcYx5EMEa1tiRWfWxJpa3Hb8oT+T
         x+Nw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Hi all,

This is the first release of new software versions of reiser4 kernel
module and reiser4prods, which invoke the builtin mechanism of
tracking compatibility basing on versions of reiser4 plugin library.
More about this can be found here:
https://reiser4.wiki.kernel.org/index.php/Reiser4_development_model

Reiser4progs of the new software release version number 4.0.1
are provided by the package reiser4progs-1.1.0. Please find here:
https://sourceforge.net/projects/reiser4/files/reiser4-utils/reiser4progs

Reiser4 kernel module of the new software release version number
4.0.1 is provided by the patch reiser4-for-4.1.5. Please find here:
https://sourceforge.net/projects/reiser4/files/reiser4-for-linux-4.x/

At mount time disk format version of your partition's superblock will
be upgraded by the kernel, and you will be suggested to complete the
upgrade offline by fsck:

# dmesg | grep [rR]eiser4
Loading Reiser4 (format release: 4.0.1).
reiser4: sda5: found disk format 4.0.0.
reiser4: sda5: upgrading disk format to 4.0.1.
reiser4: sda5: use 'fsck.reiser4 --fix' to complete disk format upgrade.

You may ignore this suggestion and continue to work as usual.
However, I would suggest to find a time and complete the upgrade.

NOTE: after mount in the new kernel you won' t be able to
check your partition by reiser4progs-1.0.9 and older versions, so
please upgrade your reiser4progs BEFORE. Everyone who relies on
liveCDs with reiser4progs-1.0.9, or older versions: be careful!

More about reiser4 (meta)data checksums can be found here:
https://reiser4.wiki.kernel.org/index.php/Reiser4_checksums

Thanks,
Edward.
