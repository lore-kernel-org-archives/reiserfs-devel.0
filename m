From: syzbot <syzbot+abe01a74653f00aabe3e@syzkaller.appspotmail.com>
Subject: Re: [syzbot] possible deadlock in vfs_fileattr_set
Date: Sun, 13 Nov 2022 17:49:38 -0800
Message-ID: <000000000000c7f9c605ed6473c8@google.com>
References: <00000000000041665a05ed5c17db@google.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <00000000000041665a05ed5c17db@google.com>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-graphics-maintainer@vmware.com, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, sroland@vmware.com, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de, zackr@vmware.com

syzbot has bisected this issue to:

commit 6dd6b7643e723b4779e59c8ad97bd5db6ff3bb12
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Mon Jan 18 13:14:19 2021 +0000

    drm/vmwgfx: Remove reference to struct drm_device.pdev

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1418e6a5880000
start commit:   f8f60f322f06 Add linux-next specific files for 20221111
git tree:       linux-next
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1618e6a5880000
console output: https://syzkaller.appspot.com/x/log.txt?x=1218e6a5880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85ba52c07cd97289
dashboard link: https://syzkaller.appspot.com/bug?extid=abe01a74653f00aabe3e
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=138b76ae880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16ab1bfe880000

Reported-by: syzbot+abe01a74653f00aabe3e@syzkaller.appspotmail.com
Fixes: 6dd6b7643e72 ("drm/vmwgfx: Remove reference to struct drm_device.pdev")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
