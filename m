Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9197DCD6102
	for <reiserfs-devel@archiver.kernel.org>; Mon,  9 Oct 2023 16:16:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377175AbjJIQQv (ORCPT
        <rfc822;reiserfs-devel@archiver.kernel.org>);
        Mon, 9 Oct 2023 12:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377121AbjJIQQu (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Mon, 9 Oct 2023 12:16:50 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B448F9E;
        Mon,  9 Oct 2023 09:16:49 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0892C433C7;
        Mon,  9 Oct 2023 16:16:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696868209;
        bh=swirnpz3e3fWcjLmgi6by8ipKj4lVyg+lDEqGTHcfmA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fY11XBPSFf1CZRYMlPsIkgSedR0XRd7y62OS/FmthnJWsvigidLYyO8uxE+BrT6B2
         c10pYsyCYeHbqxLvcVeMcICh58rxfLuqJZbc2yiMzfM9bRPmLGJ8pTH78fBCsrm08K
         o59FVRkS6x1LeeBQC5jTglyB+vVDdFspowspHiOpmV5/rzGq3LRJxjqhqLRRMXfaNb
         TFa7C/qLCCRIVRirc9ubniqJB8Z3O2bODdgYetaUt9aVsH77SxkFkB4LQUpK7wjryM
         tKJ6AnBHuPRLG1N0DzVVm4SXOqMjtI/1bTbMSmFsNUFuqHqpGNTNiSb8/hfu9nibDd
         TRzIRZZjhv4uA==
Date:   Mon, 9 Oct 2023 18:16:45 +0200
From:   Christian Brauner <brauner@kernel.org>
To:     Jan Kara <jack@suse.cz>, Christoph Hellwig <hch@lst.de>
Cc:     reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        syzbot+062317ea1d0a6d5e29e7@syzkaller.appspotmail.com
Subject: Re: [PATCH 4/4] reiserfs: fix journal device opening
Message-ID: <20231009-sachfragen-kurativ-cb5af158d8ab@brauner>
References: <20231009-vfs-fixes-reiserfs-v1-0-723a2f1132ce@kernel.org>
 <20231009-vfs-fixes-reiserfs-v1-4-723a2f1132ce@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231009-vfs-fixes-reiserfs-v1-4-723a2f1132ce@kernel.org>
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Mon, Oct 09, 2023 at 02:33:41PM +0200, Christian Brauner wrote:
> We can't open devices with s_umount held without risking deadlocks.
> So drop s_umount and reacquire it when opening the journal device.
> 
> Reported-by: syzbot+062317ea1d0a6d5e29e7@syzkaller.appspotmail.com
> Signed-off-by: Christian Brauner <brauner@kernel.org>
> ---

Groan, I added a dumb bug in here.
