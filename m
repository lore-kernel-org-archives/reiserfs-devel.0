From: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [Bug 3.4.5] reiserfs: mutex_destroy called with locked mutex
Date: Wed, 18 Jul 2012 15:37:52 -0700
Message-ID: <CA+55aFx_soQ2sKAcY0yhSFOchkjH55Kvu=jTUW0PJLNxRk9rGQ@mail.gmail.com>
References: <5006491D.8070004@t-online.de> <CA+55aFzv5mntf6y9e_r5=v+beG19xBv67EpA=dP0-Zw1CQrGGg@mail.gmail.com>
 <20120718212044.GU31729@ZenIV.linux.org.uk> <CA+55aFyHpgbJ9Pn5xn_ALkvzjQBOWog2qLbwwtrKbPHSGpa6pA@mail.gmail.com>
 <20120718213355.GV31729@ZenIV.linux.org.uk>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:sender:in-reply-to:references:from:date
         :x-google-sender-auth:message-id:subject:to:cc:content-type;
        bh=zunKT210cizdEfPBlu/uIyGdybCVrZ/eT5n5/9XKpxc=;
        b=WZ6UYHvW+mwNBTVPhUGKnDP0aYhRW7WGRgAhCQAQ0CSzizHZ8Yc2/7ID7+4y2KxLDx
         ph5Cu8bccebjJfpWrNILevm6BZfYUO6njAlujc1/sHZpvZHb6Gu42+u6lHRDkMNzivU8
         IJSZWVFqIcwWOw/th6YBFdzAFe+1iahlO414kqqF0wZOp7nqV4TM/GuRxmprmG16sL/R
         P30xT+yXp0s3lgu3uU+hfoFEBiXsYJ84dTBPYRJM7IQx0ryy677L60AfdODnEUYm/h6l
         zZlYuJQR7zTcjcijdcTBq1+QhWeAyoQsKqqM1JMJlRMTLlJ3nyRWGMzFoVcnjSkKzYvd
         OvGA==
In-Reply-To: <20120718213355.GV31729@ZenIV.linux.org.uk>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Knut Petersen <Knut_Petersen@t-online.de>, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org

On Wed, Jul 18, 2012 at 2:33 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
>  The only questions
> are "is this the WARN_ON() Knut had stepped on" (and I agree with your
> scenario now) and "is it critical enough to shove it into the tree
> less than a week before -final".  Up to you...


I agree that it isn't critical. Even the lockdep thing is just a
warning, and is apparently quite hard to trigger.

Will you hold on to the patch in your VFS tree, and we can just merge
it for 3.6?

                    Linus
