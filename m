From: Berny <berny@dwami.com>
Subject: Re: File copy problems kde 4.5 to 4.6.1 with reiser4
Date: Wed, 09 Mar 2011 16:55:05 +0000
Message-ID: <4D77B0E9.4040507@dwami.com>
References: <201103090918.47762.berny@dwami.com> <AANLkTikRbBP=XeNtvMkN=jYDVcuTZdqAM5bM=5NeAn=q@mail.gmail.com> <4D7774D7.3030908@dwami.com> <4D77AD8B.7030009@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4D77AD8B.7030009@gentoo.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Dear Serkan, yeah, that were what I intended to say, may be also 
kde-libs use that system call to copy files now, may be from the 4.5 
that was the first version mentioned in the post.
It seems (if you count also gnome problems) this bug being around almost 
from one year now.
Hope someone will be able to understand what is the problem, also 
because I'm using reiser4 on my work computer and I will not like to 
lose data :-) I tried also with thunar and same problems, it seem that 
all graphical file managers are affected from this reiser4 bug/behavior. 
I forgot to say that actually I'm on Arch Linux.

Cheers and many thanks,
Paolo


On 03/09/2011 04:40 PM, Serkan Kaba wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 09-03-2011 14:38, Berny wrote:
>> I never know that kde was using this splice for copying things.
> I don't think kde is using glib but they might have done a similar
> change in their libraries.
> Unmount test case is weird. I didn't try that, may try later on.
> - --
> Sincerely,
> Serkan KABA
> Gentoo Developer
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2.0.17 (GNU/Linux)
> Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/
>
> iEYEARECAAYFAk13rYsACgkQRh6X64ivZaKe2gCfUsQA1Oj681JotTARgHH8Ygjd
> pcEAn2LEOJ82F+Fg2GIU7hAQqXX6e+w2
> =hW/P
> -----END PGP SIGNATURE-----
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

