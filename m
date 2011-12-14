From: Matias Seco <matias.jose.seco@gmail.com>
Subject: Backup Configuration
Date: Wed, 14 Dec 2011 16:42:40 +0100
Message-ID: <CAMjNLwp73_4pAgkTDXrg9fHDh5Ukqrm-Ui090W+qyKKGVA-Fng@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=dEgtqqgS4dYefABC2txJeADgGkKmd4l9IXtnASN+lf4=;
        b=VsDL6Ud6+gf85szWSapVtZS3LcfExXlL3/P7s934U5XI7fr/X/ZMdOMCaXg31/nyR8
         hcQbFPqKdLOuIHoi0DM3P6PxTcGwGvzhbZmyiufPpqm09xn9tQTFxanoOLz5BETcNxsb
         THGQuv2zVW7wiIk7jh8ypjynR2UjOVQ8IxJsY=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

Greetings,
i've attemped to perform a backup of a reiser4 fs:
i've done this through:
rsync -a -v /mnt/gentoo/ /mnt/backup/ (mounted temporary)
/mnt/gentoo/ contains a reiser4 with base system files so being a / (
1 partition upon /dev/sdb)
/mnt/backup/ it's a partition of another hdd (/dev/sda1), with an ext4
fs (first partition with same size as sdb)

The command triggered many read errors for mapping of a file/ readdir/
readlink_stat, because of a "input/output error (5)"
Failing so to copy them.
Then they were domr gilr hsd vanished "file"

A) Is this caused because the r4 partition has gzip plugin or
something particular? (can i give further info ?)
B) Is there any tool/method you advice to backup a reiser4 fs ? (i can
use another one, since it will get the last consistent backup)

Salut, Matias
