From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: [PATCHv2 0/3] reiser4: discard support: perform discard before all deallocations.
Date: Mon, 21 Jul 2014 22:19:28 +0400
Message-ID: <1405966771-12575-1-git-send-email-intelfx100@gmail.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id;
        bh=qMhU0I3ToDkOCJ+6qrmyLD6Lksey5t/FZwJW2d4I1fQ=;
        b=e30r0eINk06j1lm+IFyearr9uK5JDBUjMI6IszviOKFFJO+UDz01vm/mBQv2FrvkFH
         pKCh39EUIgeb1TWpN4wkdlO72o+iLsZaOV5t0q0XkJtkfSJdkiTxuGno5crkzNXGLFZ/
         rNrHBUnyYSlf82jiJCZC2TPzg2otIIu7hh/LSbFUjcQYrjCnNmoIN9QWHL5oyiXqVpvV
         Xsr0iEL+eG/lyxSF8+hVhzooO1LEFspraNn3G1v4ZBjfOlX0igLNd3klsmBm4okZyhNa
         s/JR/QCB8Lz2bATs7Fa0o1IXtAFqVCvPPMqrAi4qJzIqx3awDsjdO2NjM2mddSzf8Z2T
         U5Wg==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org
Cc: edward.shishkin@gmail.com, Ivan Shapovalov <intelfx100@gmail.com>

This applies on top of PATCHv6 of "initial implementation".
The first patch has been already sent some time ago, but I've included it
here for sake of clarity.

v2: fix disk space leak in error path, fix comments and commit messages, etc.

Ivan Shapovalov (3):
  reiser4: fix reiser4_post_{commit,write_back}_hook() and their invocations.
  reiser4: discard support: use reiser4_post_write_back_hook() for discarding and completing deferred deallocations.
  reiser4: discard support: perform discard before all deallocations.

