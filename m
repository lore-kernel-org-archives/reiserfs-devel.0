From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [RFC] [PATCHv2 0/2] libaal: add device "discard" operation.
Date: Sun, 11 May 2014 13:33:26 +0400
Message-ID: <1399800808-4855-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=oNmGBQV1/5DScU5MFrG5osDj7yD+ziIPzcXd2Loh9sA=;
        b=mSKfx1f3slBqgQxEGkSA3BMuQVUOVHrkBa5xkFOZ+jSgwLx/wfnWKAJED63v5Hy5Hf
         ua6x+w6z2IiSrmlUlUT9AK4e8pqWFXurLc8upOG03Mpdt6lO2F8ZsPQNbCCNQaIDBpDk
         4j8yfwApZqx1BdbqepYdtp7q7tJ9nP++180RpftliZRJ4A2hQ/5gR0AyeU+GMn/p74Ow
         SfW74GHt1OacaPRsNX826lNIpa5JhY4cBU1X04z9ZdVNvNZGx6OO65eYxZz+mj9Qf9lh
         exDWZOf1kCDLKnal4EM7szdWK2f0wf6BBsIF4NmPLwuGbUn0oSdqxWciXOxdzVWHemE8
         EExA==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

This implements device discard functionality in libaal to be used
by mkfs and friends.

Note that the build system is _not_ regenerated, so the direct result of
applying these patches won't build.

v2: remove a wrong assertion (result of copy-pasting), fix indentation.

Ivan Shapovalov (2):
  configure.in: check for fallocate() and related headers.
  Add aal_device_discard() function and implement it for file-based device.

 configure.in         |  4 +--
 include/aal/device.h |  4 +++
 include/aal/types.h  |  3 +++
 src/device.c         | 14 ++++++++++
 src/file.c           | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 5 files changed, 97 insertions(+), 2 deletions(-)

-- 
1.9.2

