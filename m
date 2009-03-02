From: Ilario Pittau <ilariopittau@gmail.com>
Subject: Re:
Date: Mon, 2 Mar 2009 13:04:04 +0100
Message-ID: <17c9de980903020404y25ace3cah90a166d2e9d97c71@mail.gmail.com>
References: <17c9de980903011521o4603b9d0kbfceb04e27dd540c@mail.gmail.com>
	 <49AB3AA2.90509@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=CC35x474gpj3ix/4sFRQsAQVj9dHdRhpdnCsquWRUIw=;
        b=NXj9+sJ/6/hfC1GX6Ptv/nKQT1vBar5umhoKrwbyuzLJqMyYATy7MjkpZAVT90/tYD
         h7BvTlA967Eyy0vL8G+2zXkI7JQfNigZprDU1lO/kfxbFw6Er/wpWJ0k3LwAd5G02EZO
         M5i0gLZMsVTYzni57nZFTSzQDqMk2OJRJy3Ak=
In-Reply-To: <49AB3AA2.90509@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org

On Mon, Mar 2, 2009 at 2:47 AM, Jeff Mahoney <jeffm@suse.com> wrote:
>
> Ilario Pittau wrote:
>> Hi,
>> I have a problem with the REISERFS_CHECK module.
>> When I include it in the kernel the system boots correctly and it's
>> possible read from the reiserfs partition.
>> But when I try to write on, the system crash and go in kernel panic.
>> If I compile the kernel without the REISERFS_CHECK module it's
>> possible to write also, and the system does not crashes.
>
> Without seeing the actual crash, it's tough to say what your problem is.
> It could be a little-used check that is just wrong now, or it could be
> file system corruption.
>
> - -Jeff
> - --
> Jeff Mahoney
> SUSE Labs
>

I think the first since the "reiserfsck - check" does not show any
corruption in the file system.
I'm compiling the kernel 2.6.28 stable.


-- 
Ilario Pittau
