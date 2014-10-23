From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv2 0/3] reiser4: space grabbing fixes.
Date: Thu, 23 Oct 2014 11:18:02 +0400
Message-ID: <1414048685-4224-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=plO9Fym/zk9LlsDMnDbvh653u89psOZh1S15aDp/eyM=;
        b=p4PB64M55FXihqc2Kg/9DWXpocuPNyNyU1d2oVGFoNUaCCM4TOX6Etnt42TJhwXo7P
         GhGCZdVLqxwl/dcBS7MbJER+sTp84wgYhsXDSqCsa1zk0I5QV/9C+AQNKBZqhOcKdEsH
         WVAx3RNIQVcUDq0FdnqXDEtjVYUGLrD2yf0L9hqeqrnZq+77WHP4DF8LWCMzRAvIc3lG
         WxNgGg0iq+XgP8+mfhvRC8wtes32qEZeKhK24kOBS/dSIbwDJuAgr4rukd116LFMXVFY
         Uccqn8aq9vIFhhunoVbwzmPn6Y/6ON1Z6NHykr+aNZZcfg9GCpwKx/bdZ/x5tE8fuXjK
         188w==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: Ivan Shapovalov <intelfx100@gmail.com>

These are mostly equivalent transformations (aside from the first patch)
I've done when I was experimenting with rwsems at zero-th iteration of
batch discard support.

v2: - disable grab in current context unconditionally, not only if !BA_FORCE

Ivan Shapovalov (3):
  reiser4: block_alloc: improve error handling in reiser4_grab_reserved().
  reiser4: block_alloc: sanitize grab_enabled modifications.
  reiser4: do not mess with grab_enabled; instead, use BA_FORCE.

 fs/reiser4/block_alloc.c                 | 57 +++++++++++++++++---------------
 fs/reiser4/plugin/file/file.c            | 12 +++----
 fs/reiser4/plugin/file/file_conversion.c |  3 +-
 fs/reiser4/plugin/file/tail_conversion.c | 11 +++---
 fs/reiser4/plugin/item/extent_file_ops.c |  3 +-
 fs/reiser4/plugin/item/tail.c            |  3 +-
 fs/reiser4/safe_link.c                   |  4 +--
 7 files changed, 44 insertions(+), 49 deletions(-)

-- 
2.1.2

