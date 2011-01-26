From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Quick & dirty r4 for 2.6.37
Date: Wed, 26 Jan 2011 21:49:39 +0100
Message-ID: <4D4088E3.8080800@gmail.com>
References: <AANLkTi=Mi1QEC+Wjr5ka4uMZH72WytvsszC+yycRKaqq@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <AANLkTi=Mi1QEC+Wjr5ka4uMZH72WytvsszC+yycRKaqq@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Kaelyn Uhrain <Kaelyn.Alexi+reiserfs@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Kaelyn Uhrain wrote:
> Here's a quick patch I just made for the resier4-for-2.6.36 patch to
> compile against the 2.6.37 sources.  To use, apply
> resier4-for-2.6.36.patch to the 2.6.37 kernel sources (ignoring the
> one rejected chunk which just adds a comment at the end of
> fs/fs-writeback.c) then apply this patch.  My patch is a revert of
> 766f9164193f6dda1497bbf3861060198421fb92 along with three very small
> one-liner changes to fix compilation issues; I haven't had a chance to
> test it beyond building the kernel itself, and won't until after I'm
> off work tonight.  I also make no claims as to the correctness of my
> patch since it is my first venture into the reiser4 and linux fs code.
>
> Cheers,
> Kaelyn
>   

Hello.

Correct, but not enough:
return value BIO_EOPNOTSUPP has gone with WRITE_BARRIER,
and vfs changes in default_llseek() now cause self-blocking in ->llseek()
reiser4 file operation path.

Actually, I have already prepared the patch for .37 at last weekends
(still testing), will be available soon.

Anyway thanks!
Edward.
 

