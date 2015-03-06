From: <doiggl@velocitynet.com.au>
Subject: Re: Warning: mounting sdb with fatal errors, forcing read-only mount.
Date: Fri, 06 Mar 2015 18:49:11 +1100
Message-ID: <1f0ae4265db2b5099bdc591c6abbdb3a@mail.velocitynet.com.au>
References: <711c96e87d13f8b57fa62cce03bf0911@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <711c96e87d13f8b57fa62cce03bf0911@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

#dmesg shows:
NOTICE: Warning: mounting sdb with fatal errors, forcing read-only mount.
 reiser4: sdb: found disk format 4.0.0.
 reiser4[mount(21297)]: traverse_tree
(../fs/reiser4/search.c:725)[nikita-373]:
WARNING: not found on internal node: level: 6, lock_level: 1, stop_level:
1 lock_mode: read, bias: exact
 reiser4[mount(21297)]: key_warning
(../fs/reiser4/plugin/file_plugin_common.c:512)[nikita-717]:
WARNING: Error for inode 42 (-2)
