From: Randy Dunlap <rdunlap@xenotime.net>
Subject: building reiserfsprogs, no asm/unaligned.h
Date: Thu, 29 Nov 2007 22:15:24 -0800
Message-ID: <20071129221524.1135f0f9.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hi,

I was just trying to build reiserfsprogs-3.6.19 (got tarball
from Debian mirror since namesys.com is offline).

include/reiserfs_fs.h #includes <asm/unaligned.h>, but I don't
have that file in /usr/include/asm-*.
Has anyone addressed this?

Thanks,
---
~Randy
