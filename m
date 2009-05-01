From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [PATCH] reiserfs: Expand i_mutex to enclose lookup_one_len
Date: Fri, 1 May 2009 20:37:22 +0400
Message-ID: <a4423d670905010937k395a0a2r2e2b3b68ffe68851@mail.gmail.com>
References: <49FB1F20.8040400@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=B8SO3gW22cyA1lnlCcEQH07Klxuf67QXVN9iFNBDobY=;
        b=BeSp1CIAsYjyrntMB4fzBrjYjoacfptqAq/M7WC+6JrCJI6cX6fMdiqz7PlZE88XKF
         F81i6ahNWr4Y3EKZkfsBhXC6FrLL/o2kvp2H2QQrBwJQVdMssnIwFYoQdBZ+sHkbi9cz
         +Ebd6aBzjn5nbaERSeuEWokzPg2uvI7cbnbas=
In-Reply-To: <49FB1F20.8040400@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Al Viro <viro@ftp.linux.org.uk>, David <david@unsolicited.net>

2009/5/1 Jeff Mahoney <jeffm@suse.com>:
> =C2=A02.6.30-rc3 introduced some sanity checks in the VFS code to avo=
id NFS
> =C2=A0bugs by ensuring that lookup_one_len is always called under i_m=
utex.
>
> =C2=A0This patch expands the i_mutex locking to enclose lookup_one_le=
n. This was
> =C2=A0always required, but not not enforced in the reiserfs code sinc=
e it
> =C2=A0does locking around the xattr interactions with the xattr_sem.
>
> =C2=A0This is obvious enough, but it survived an overnight 50 thread =
ACL test.
>
> Signed-off-by: Jeff Mahoney <jeffm@suse.com>
Tested-by: Alexander Beregalov <a.beregalov@gmail.com>

It works, thanks.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
