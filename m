From: Kuba Ober <kuba@mareimbrium.org>
Subject: Re: kernel panic with PAP-8252
Date: Tue, 30 Jul 2002 09:08:55 -0400
Message-ID: <200207300908.55739.kuba@mareimbrium.org>
References: <20020730151018.2D2C.K-MORIKAWA@stage.gr.jp> <20020730150340.A11654@namesys.com> <20020730211933.2D2F.K-MORIKAWA@stage.gr.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-11101-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020730211933.2D2F.K-MORIKAWA@stage.gr.jp>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "K.Morikawa" <k-morikawa@stage.gr.jp>
Cc: reiserfs-list@namesys.com

On wtorek 30 lipiec 2002 08:20 am, K.Morikawa wrote:
> Hello.
> Thank you for your reply.
>
> I understand that kernel-2.2.18 and reiserfs-3.5.29 is old.
> Also reiserfs-3.5.35(latest) is fixed many bugs too.
> However, it is unable to up the version immediately.
> because cause of this problem is indistinct and
> It's necessary the inspection of the middleware and application related.

By definition, user-level, unprivileged application errors shouldn't crash the 
kernel. So you should really forget about your application stuff and update 
the kernel to the latest 2.2, as well as latest reiserfs for 2.2. Or else 
you're asking for trouble.

Again: application stuff should not crash the kernel if the kernel is fine. So 
even if your apps were completely broken, the kernel should be running fine. 
If you're getting kernel crashes, it's the kernel at fault. *Do* update ASAP. 
*Really*. You know, updating the kernel is not such a big job after all.

Cheers, Kuba Ober
