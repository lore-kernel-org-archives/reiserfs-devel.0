Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CEE7E95A8F
	for <reiserfs-devel@archiver.kernel.org>; Mon,  9 Oct 2023 02:05:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344903AbjJICFg convert rfc822-to-8bit (ORCPT
        <rfc822;reiserfs-devel@archiver.kernel.org>);
        Sun, 8 Oct 2023 22:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232956AbjJICFf (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Sun, 8 Oct 2023 22:05:35 -0400
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 637D2B3
        for <reiserfs-devel@vger.kernel.org>; Sun,  8 Oct 2023 19:05:33 -0700 (PDT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-1dd053fb4f0so6335073fac.2
        for <reiserfs-devel@vger.kernel.org>; Sun, 08 Oct 2023 19:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696817132; x=1697421932;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cb8BJFOfJt/1KSmkcKeu7s/bXsY2CA0V26Ucc8VKgjw=;
        b=mUcscmPchWICGrtqe/nS8dn1wRMZjE9G/uz3NJ0VT8xSkEYoAXjL7f/3kF5ndqkWsL
         msxWG3oyfRo8l4gL3S7a4OZwqP+HBSzUI7Ygl83ECbizrEAhDYVdiFgs+ShtJgubuDgZ
         idHwbFOqcPxLzVJRGHjUNP+DMHjDqEHMhKhEuTZfb04v6bk6NnWY2YYVqK0mpVyH9CNU
         vXyX1dLP8Q3RQVVjI6URtqwV0NCaOoDahpjnNJV824VVjR6Lx+yZlieSbEEZuDCIFkDW
         mQIaB+FcS+qFieZnHzogSdREBmobBu9gHINgyZ6qHAg0G+aoD4AAE9ldbaKV8gPX8GxI
         rf4w==
X-Gm-Message-State: AOJu0Yyhep7GnVPpSviUL5w38ZMw0lpfaS08ok7wvuKOFSYh+XMjjgD+
        QzPUi2DH2aNfSaOOd2sa1orwbc6qJ5nseRTbr+TpX9CkGKSY
X-Google-Smtp-Source: AGHT+IELFqFN7QoMVYfsIY7r0QeAGPzrcev1WXJ9FLIcjCL1sovTwvIQxukZvcnCCdk9WKGEwgiUlAPYacJT+fS5YBjM7tUk1k16
MIME-Version: 1.0
X-Received: by 2002:a05:6871:3208:b0:1d5:a24a:c33 with SMTP id
 mo8-20020a056871320800b001d5a24a0c33mr5413341oac.8.1696817132668; Sun, 08 Oct
 2023 19:05:32 -0700 (PDT)
Date:   Sun, 08 Oct 2023 19:05:32 -0700
In-Reply-To: <0000000000001825ce06047bf2a6@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000071133306073f06ca@google.com>
Subject: Re: [syzbot] [reiserfs?] possible deadlock in super_lock
From:   syzbot <syzbot+062317ea1d0a6d5e29e7@syzkaller.appspotmail.com>
To:     axboe@kernel.dk, brauner@kernel.org, chao@kernel.org,
        daniel.vetter@ffwll.ch, hdanton@sina.com, jack@suse.cz,
        jaegeuk@kernel.org, jinpu.wang@ionos.com,
        linux-f2fs-devel@lists.sourceforge.net,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        mairacanal@riseup.net, mcanal@igalia.com,
        reiserfs-devel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
        terrelln@fb.com, willy@infradead.org, yukuai3@huawei.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

syzbot has bisected this issue to:

commit 7908632f2927b65f7486ae6b67c24071666ba43f
Author: Maíra Canal <mcanal@igalia.com>
Date:   Thu Sep 14 10:19:02 2023 +0000

    Revert "drm/vkms: Fix race-condition between the hrtimer and the atomic commit"

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=17fc0565680000
start commit:   2cf0f7156238 Merge tag 'nfs-for-6.6-2' of git://git.linux-..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=14020565680000
console output: https://syzkaller.appspot.com/x/log.txt?x=10020565680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=710dc49bece494df
dashboard link: https://syzkaller.appspot.com/bug?extid=062317ea1d0a6d5e29e7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=107e9518680000

Reported-by: syzbot+062317ea1d0a6d5e29e7@syzkaller.appspotmail.com
Fixes: 7908632f2927 ("Revert "drm/vkms: Fix race-condition between the hrtimer and the atomic commit"")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
