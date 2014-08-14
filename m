From: <doiggl@velocitynet.com.au>
Subject: Do these patches apply to reiser4-for-3.15.1.patch.gz version ?
Date: Thu, 14 Aug 2014 15:53:54 +1000
Message-ID: <eb16bdbc3416c9569dd881ab0826aa0f@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Do these patches apply to reiser4-for-3.15.1.patch.gz version ?
--Glenn

[PATCHv7 0/6] reiser4: discard support: simplified and race-free initial
implementation., Ivan Shapovalov

    [PATCHv7 1/6] reiser4: fix reiser4_post_{commit,write_back}_hook() and
their invocations., Ivan Shapovalov
    [PATCHv7 2/6] reiser4: make space_allocator's check_blocks()
reusable., Ivan Shapovalov
    [PATCHv7 4/6] reiser4: blocknr_list: use kmem_cache instead of kmalloc
for allocating entries., Ivan Shapovalov
    [PATCHv7 3/6] reiser4: add an implementation of "block lists",
splitted off the discard code., Ivan Shapovalov
    [PATCHv7 5/6] reiser4: blocknr_set: use kmem_cache instead of kmalloc
for allocating entries., Ivan Shapovalov
    [PATCHv7 6/6] reiser4: discard support: initial implementation using
blocknr_list, without extent padding., Ivan Shapovalov

Source: http://www.spinics.net/lists/reiserfs-devel/msg04089.html
