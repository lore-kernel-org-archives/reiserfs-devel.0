From: Oleg Drokin <green@namesys.com>
Subject: Re: (yet another) attempt to access beyond end of device
Date: Wed, 21 Aug 2002 13:33:03 +0400
Message-ID: <20020821133303.A12839@namesys.com>
References: <20020821124007.A12576@namesys.com> <Pine.LNX.4.33L2.0208210204460.16503-100000@ns.they.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11268-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33L2.0208210204460.16503-100000@ns.they.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Max Power <ratty@they.org>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Aug 21, 2002 at 02:26:18AM -0700, Max Power wrote:

> # > Aug 21 00:33:46 stroke kernel: attempt to access beyond end of device
> # > Aug 21 00:33:46 stroke kernel: 16:41: rw=0, want=1411977092, (=0x54290f84), limit=1411977092
> # > I've tried all manor of reiserfscking repeatedly. Each time it seems to
> # > fix something different. I've read about the issues with fdisk and not
> # > rebooting and admit that this _could_ be my issue but that doesn't explain
> # > why all the "want" and "limit" numbers are identical. I'm also curious why
> # What do you mean by "identical"? I see they are different each time and this is
> # very strance since limit should be always the same.
> I was referring to the per-line sameness. In some of the mail list
> archives I looked thru the "want" number was different than the "limit"
> number each time. Mine are the same. And I don't get why if I "want" X and
> the "limit" is X then why can't I have X?

Ah, I see now. Very strange indeed. Can you try some stock kernel (say 2.4.19)
and see what happens there because I am not familiar with what is in
Mandrake kernels.

Bye,
    Oleg
