From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Bug 3.4.5] reiserfs: mutex_destroy called with locked mutex
Date: Wed, 18 Jul 2012 14:25:02 -0700
Message-ID: <CA+55aFyHpgbJ9Pn5xn_ALkvzjQBOWog2qLbwwtrKbPHSGpa6pA@mail.gmail.com>
References: <5006491D.8070004@t-online.de> <CA+55aFzv5mntf6y9e_r5=v+beG19xBv67EpA=dP0-Zw1CQrGGg@mail.gmail.com>
 <20120718212044.GU31729@ZenIV.linux.org.uk>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:cc:content-type;
        bh=wT3eTmZZs1AZpukGQmfhzuKXMIa8nHN7A6KiVK81xe0=;
        b=HayK+HR9kAkwB9Lfgcqy2vhZArdsq9dUE2ZnxFdxCoYdY6OFN6+mSEOf6gBPzVYZ1b
         rxMSoJ+DNgcI1HEvjEuPmsRu2C6RoCTw9QKETz6UnryoDulZTabZjDDvcpLbDaD3G3DV
         wfb7qUAsv1txAjxS5tsqjPOqBEYqtMZ24WbfObi2edXCr3ug1dwUvNtfqIQMMnbVz/9B
         9wfDSDX7sIjt+cDipd8xYUUEdppd24I0fo4jTD50kwsbb8MvEua2CGSZzirpznkNeARE
         +zfrNl5/IlBq/v/5Qom+qLQYWX3i6uUS6zqTETZi9dI7Ufc6Gc9v0Q9UeBtaajca11DI
         7feg==
In-Reply-To: <20120718212044.GU31729@ZenIV.linux.org.uk>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Knut Petersen <Knut_Petersen@t-online.de>, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Wed, Jul 18, 2012 at 2:20 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
> On Wed, Jul 18, 2012 at 09:26:57AM -0700, Linus Torvalds wrote:
>>
>> So I don't think the freeing code could trigger, but a concurrent
>> lookup then trying to look up the new directory (and taking the new
>> directory i_semaphore lock) could happen, afaik.
>
> Umm...  The thing is, we'd get WARN_ON() in iput_final() triggering in
> that scenario before lockdep could complain.

Not for the "look up directory in the dcache, and then lock that
inode" case, afaik. You'd get the lock before iput_final(), no?

So then "unlock_new_inode()" would run with the inode mutex held,
which could explain the lockdep warning, no?

             Linus
