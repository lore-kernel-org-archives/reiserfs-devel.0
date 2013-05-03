From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: [patch 0/6] reiser4progs-1.0.8
Date: Fri, 03 May 2013 22:38:40 +0200
Message-ID: <51842050.9070904@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=UIR+A8tplcjsKZFWogJ0XiGc9XskLpZugXDVb87YXlk=;
        b=YDWBYlOsI/RorXwdstDfdsX1yGNcyBfvEW1i4L4SGjSdoQism6OIoid5xeOl43Ve2t
         Oz8kHqNhIzTepVLiiImxiICWDmcCzyd5/QvXLEUrilUGDbdG+El/kSlerEqx0ErqWhqh
         b0GF0/DoZWEq0HhILw+6WJSKzZ/8tfwy4CUpuHU37atBzIfFwuvoIwga1HtjQY52nbaU
         2KCR9aIcFrFCd/aD76zAgPcY+1+NEWs3/FeSDfjfW+3tiUvYqiGUcesjskulqscdEjcm
         aA2PZLT4v3BvQDAP2IZ4F5CuQTFb/15y2r9v97jB3LsJNx+FLlmP456iygMPAKFAcHUA
         YvxQ==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

Changes since 1.0.7:

. Fixups in fsck.reiser4: repair a special kind of corruptions
   appeared due to software bugs in earlier kernels.

. mkfs.reiser4 now enables intelligent compression with lzo1
   algorithm by default. If you want to create reiser4 without
   compression, then override the default plugin set with the
   "-o create=reg40" option.

   I remind that list of default plugins can be retrieved with
   "mkfs.reiser4 -p".


Please, find here:
https://sourceforge.net/projects/reiser4/files/reiser4-utils/reiser4progs/

Thanks,
Edward.
