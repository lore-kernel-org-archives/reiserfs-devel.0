Return-Path: <reiserfs-devel-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11013C07545
	for <reiserfs-devel@archiver.kernel.org>; Tue, 24 Oct 2023 11:33:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231648AbjJXLd4 (ORCPT
        <rfc822;reiserfs-devel@archiver.kernel.org>);
        Tue, 24 Oct 2023 07:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231437AbjJXLdz (ORCPT
        <rfc822;reiserfs-devel@vger.kernel.org>);
        Tue, 24 Oct 2023 07:33:55 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8052D7F;
        Tue, 24 Oct 2023 04:33:53 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC51DC433CA;
        Tue, 24 Oct 2023 11:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698147233;
        bh=X62QOZGcCHvGfKNC+rsSFzoHU54y9RQXxs/RK89NVxc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HU+aus46hGm70PmcX4/IPTBrSiVnbOW7VUGjUOqZ5+CMIrLFoQqsrbqqQPK85QxF4
         zb0vKN1OSZmiC3D/LcvRMIvBIaU6RnNPtAx/alRNdBOzKFy2prZkc94niKFcXAw1v5
         gtpmTH2teO3ZTPS3FU3N4fyQV7HZjN2imszkmNyBoNxemjbSon3jfFKLH1h6Q5ZmPz
         knhMCXgM+/CxKf0C/lmuG2vVODN5asV/qM90vhqqlCeJVbGM7lTlSxF8FBoJ6FRgYR
         PGtsHTHcnd4T529vg8Pe2YZ6MyOdXwlTisMAxvHu5bm5IzK+7CLHBm4xavjyoRzGwM
         AZw4EEEG3hecQ==
Date:   Tue, 24 Oct 2023 13:33:48 +0200
From:   Christian Brauner <brauner@kernel.org>
To:     Jan Kara <jack@suse.cz>
Cc:     Yikebaer Aizezi <yikebaer61@gmail.com>,
        reiserfs-devel@vger.kernel.org,
        "dchinner@redhat.com" <dchinner@redhat.com>, jlayton@kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: KASAN use-after-free Read in search_by_entry_key
Message-ID: <20231024-unmotiviert-bezog-0580682e4772@brauner>
References: <CALcu4raE3hoh7pLNJBjxWeWv18QOR1XPt4E=XWmdg_b9CN-5Cg@mail.gmail.com>
 <20231024100834.aqwedigye4qa3wfv@quack3>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231024100834.aqwedigye4qa3wfv@quack3>
Precedence: bulk
List-ID: <reiserfs-devel.vger.kernel.org>
X-Mailing-List: reiserfs-devel@vger.kernel.org

On Tue, Oct 24, 2023 at 12:08:34PM +0200, Jan Kara wrote:
> Hello!
> 
> On Tue 24-10-23 10:30:46, Yikebaer Aizezi wrote:
> > When using Healer to fuzz the  Linux 6.6-rc7 Linux kernel,  the following crash
> > was triggered.
> 
> Thanks for report but I don't think there's a big interest in fixing
> reiserfs errors found by a fuzzer. Reiserfs is scheduled for removal from
> the kernel so it would be mostly a wasted effort.

Agreed, but also note that this is from a private syzkaller instance
with google drive links which makes me shy away from this tbh.

I don't think we should encourage private syzbot reports as that will
end up a nightmare for us all.
