From: "Marti Raudsepp" <marti@juffo.org>
Subject: Re: Undeletable directory in reiser4
Date: Wed, 11 Jul 2007 18:35:07 +0300
Message-ID: <2a12af650707110835u5e1f0ecfwd1bf41a19fef1da3@mail.gmail.com>
References: <2a12af650707101003i660dc33fv33ff1557ee84e3e2@mail.gmail.com>
	 <4694CDA7.504@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
        b=PsF0iHjuzUkBFfpqcWN2ShOkf3+8HNZfFUkPc+k4N8HvrE8paYKBjUUpvZSgOijWFnTNdUMYXCdHMSAn7h+69nZHWvMSu9b/0c+yiDxgi1mI164gSiS0wCBbSvHxtdgyQhZV354O9gt8FXjYEEUBRpAMAXCZljush6uJ5GBbEq0=
In-Reply-To: <4694CDA7.504@namesys.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shishkin <edward@namesys.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hi,

Forgot to Cc: the mailing list (I'm new to mailing lists), and also
forgot to mention that I'm on AMD64. The reiser4 file system lives on
a contiguous LVM2 volume.

Regards,
Marti Raudsepp

---------- Forwarded message ----------
From: Marti Raudsepp <marti@juffo.org>
Date: Jul 11, 2007 3:54 PM
Subject: Re: Undeletable directory in reiser4
To: Edward Shishkin <edward@namesys.com>

On 7/11/07, Edward Shishkin <edward@namesys.com> wrote:
> any ideas about kernel version that generated such
> inconsistency? It seems this is an old bug..

Oops, sorry, I knew I forgot something important in my rushed bug report.
I'm currently running kernel 2.6.21-gentoo-r3 with the appropriate
reiser4-for-2.6.21 patch. At the time the directory was created, I was
running 2.6.21-ck2.

> Please, check your partition by fsck.reiser4.

Here's what I got:
CHECKING THE SEMANTIC TREE
FSCK: obj40_repair.c: 223: obj40_stat_unix_check: Node (515), item (19),
[41aac:6c6f63616c6500:41aad] (stat40): wrong bytes (182), Should be (100).
FSCK: obj40_repair.c: 350: obj40_stat_lw_check: Node (515), item (19),
[41aac:6c6f63616c6500:41aad] (stat40): wrong size (3), Should be (2).
        Found 86670 objects (some could be encountered more then once).
        Time interval: Wed Jul 11 15:41:47 2007 - Wed Jul 11 15:42:00 2007
FSCK: repair.c: 550: repair_sem_fini: On-disk used block bitmap and
really used block bitmap
differ.
***** fsck.reiser4 finished at Wed Jul 11 15:42:00 2007
Closing fs...done

1 fatal corruptions were detected in FileSystem. Run with --build-fs
option to fix them.

I'll leave the file system in the broken state for now.

Regards,
Marti Raudsepp
