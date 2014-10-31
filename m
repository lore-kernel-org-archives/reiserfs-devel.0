From: dE <de.techno@gmail.com>
Subject: Reiser4 corruption.
Date: Fri, 31 Oct 2014 22:07:33 +0530
Message-ID: <5453BACD.8040801@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=PI0x3jskxKFNrg+zYCCOkcPphYBYoIkZpwhfgtofONU=;
        b=rpqf2443xJh7lW0kfNZX2qn/mGP9Zi65T/ynwrPapJ2SPIN0FU1NluEFDEng+6UKM2
         Nkvabesz/cN8zh54pGm1iL0s27aNzgX+qaCtfI4kWJCd3QCCCHvjN9/tUENov8wNC9Pl
         mUYVcae8rgm8uXbyAHimkgSaE6RwVfMRgWVR0N0KKouY29m3n959+Qp4t/0elWdZPAkf
         g8LdcRKbaOOhGmpSeY9km8EW6qJuvHjoFQWgghAm/YLIwrEd4rN/dQXNdZCFpn4ItNNl
         bHpJgk+A20Xc8/Z8eWKkNG7ehySDjSDmRE6PKVEUg3miwc4RX9kP06/IEgZroPyZ/mvK
         lWlQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Hi!

I've encountered a corruption again.

This's what I get when accessing a certain file --

[ 2449.493892] reiser4[gwenview(7968)]: dc_check_checksum 
(fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
WARNING: Bad disk cluster checksum -1008173184, (should be -1553131906) 
Fsck?

[ 2449.493898] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
(fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
WARNING: Inode 3109170: disk cluster 0 looks corrupted
[ 2449.493926] reiser4[gwenview(7968)]: dc_check_checksum 
(fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
WARNING: Bad disk cluster checksum -1008173184, (should be -1553131906) 
Fsck?

[ 2449.493929] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
(fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
WARNING: Inode 3109170: disk cluster 0 looks corrupted
[ 2449.493971] reiser4[gwenview(7968)]: dc_check_checksum 
(fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
WARNING: Bad disk cluster checksum -1008173184, (should be -1553131906) 
Fsck?

[ 2449.493974] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
(fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
WARNING: Inode 3109170: disk cluster 0 looks corrupted
[ 2449.494145] reiser4[gwenview(7968)]: dc_check_checksum 
(fs/reiser4/plugin/file/cryptcompress.c:1025)[edward-156]:
WARNING: Bad disk cluster checksum -1008173184, (should be -1553131906) 
Fsck?

[ 2449.494157] reiser4[gwenview(7968)]: reiser4_inflate_cluster 
(fs/reiser4/plugin/file/cryptcompress.c:1192)[edward-1460]:
WARNING: Inode 3109170: disk cluster 0 looks corrupted

This again happened with the .mozilla/firefox dir.

Anything I can do to report?
