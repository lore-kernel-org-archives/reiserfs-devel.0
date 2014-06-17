From: <doiggl@velocitynet.com.au>
Subject: Reiser4 patching questions.
Date: Tue, 17 Jun 2014 18:16:44 +1000
Message-ID: <0fc18880c248b14848c22452f228146d@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hello,
Two questions.

Q1, Will the reiser4 patches listed [1] after 'Reiser4 for Linux-3.14' be
included, in the next reiser4 patch set ?.
Q2. Can these patches be applied after reiser4-for-3.14.1.patch to a
kernel ?.

--Glenn

These the the ones I see after 'Reiser4 for Linux-3.14'
[1]
[RFC] [PATCHv4 0/4] reiser4: discard support: initial implementation.,
Ivan Shapovalov
    [RFC] [PATCHv4 1/4] reiser4: discard support: make space_allocator's
check_blocks() reusable., Ivan Shapovalov
    [RFC] [PATCHv4 2/4] reiser4: add reiser4_debug(): a conditional
equivalent of reiser4_log()., Ivan Shapovalov
    [RFC] [PATCHv4 3/4] reiser4: discard support: initial implementation
using extent lists., Ivan Shapovalov
    [RFC] [PATCHv4 4/4] reiser4: discard support: enable discard
functionality through a mount option., Ivan Shapovalov

[RFC] [PATCHv2 0/5] reiser4: discard support: initial implementation.,
Ivan Shapovalov

    [RFC] [PATCHv2 1/5] reiser4: discard support: make space_allocator's
check_blocks() reusable., Ivan Shapovalov
    [RFC] [PATCHv2 2/5] reiser4: discard support: initial implementation
using extent lists., Ivan Shapovalov
    [RFC] [PATCHv2 3/5] reiser4: discard support: enable discard
functionality through a mount option., Ivan Shapovalov
    [RFC] [PATCHv2 4/5] reiser4: discard support: add assertions to all
code written within this feature., Ivan Shapovalov
    [RFC] [PATCHv2 5/5] reiser4: discard support: downgrade all
reiser4_log() to reiser4_debug()., Ivan Shapovalov

