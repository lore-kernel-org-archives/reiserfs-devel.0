From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCH 0/3] reiser4: precise discard: fixes on top of everything
Date: Fri, 13 Feb 2015 08:02:55 +0300
Message-ID: <1423803778-19698-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=gO0ZnM28Uf9FAvNXynNln+ojU4YVk2hyrrUQw2oe5pI=;
        b=UxmbyZmhoMu6tIzQnyQTfMnXMswVl6BxfoQkkq97Q/t68qFvjWbS55VN1sNwLAnPMB
         ie/L9XmGwgXHEBiTpAPHYBMrBQGuaF3aB7/ldMNwJH0fOke2IHberp2IUxfTGZEX8A/m
         NF9AptbgSxz0IhGuwbCRvnxNglxBqm1ZOwhBNPj4MFsg0HC8H+irsnCYuYv6mU0BO/cL
         YHCnBGTZUpo4nR52UG3GPam9s8BGvjptB/1cA/3Gp6jvmz8Tr1rIm1q21NbkVY4bEUSk
         VzmT0mMaUmbKmBNnaymYNZQVSQ/SxvviWzWrqL4pZmZxyZAO8qzErS7tA/u9IMFUV8i9
         aT6Q==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

Here we fix two bugs in the precise discard implementation.
The first one is handling of "nearby" tail and head paddings which are parts
of the same disk block. Our block checking function is not idempotent, and
repeatedly calling it on the same block results in a false-negative. The fix is
to remember the last checked range (the tail padding) of an extent, and then
use this information during checking the head padding of the next extent.
Information about preceding blocks is never needed.

The second one is handling of discard extents at the end of the partition: we
must avoid checking blocks outside of the partition. The similar check already
exists for the first erase unit in the partition.

Ivan Shapovalov (3):
  reiser4: discard: signify non-idempotence of check_free_blocks() by changing its name.
  reiser4: discard: avoid checking same blocks multiple times.
  reiser4: discard: handle incomplete erase units at the end of a partition.

 fs/reiser4/discard.c | 194 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 165 insertions(+), 29 deletions(-)

-- 
2.3.0

