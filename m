From: Fabio Rosciano <malmostoso@email.it>
Subject: Re: [2.6.12-rc4] Oops in reiserfs_panic [please CC]
Date: Wed, 18 May 2005 09:02:52 +0200
Message-ID: <428AE89C.2020503@email.it>
References: <4255.24.115.31.119.1116366396.squirrel@mail.aigc.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <4255.24.115.31.119.1116366396.squirrel@mail.aigc.net>
Sender: linux-fsdevel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: jdz@aigc.net
Cc: linux-kernel@vger.kernel.org, vs@nl.linux.org, dsd@gentoo.org, gfraser@online.no, linux-fsdevel@vger.kernel.org, reiserfs-list@namesys.com, vs@namesys.com

Jesse D Zbikowski wrote:
> This looks to be the same bug reported by two Gentoo users against
> 2.6.12-rc4, as a regression from -rc3.  One reported data corruption.
> You should be able to work around by compiling with
> 
> CONFIG_REISERFS_CHECK=n
> 
> http://bugs.gentoo.org/show_bug.cgi?id=91968

Yep, it worked. Nasty bug though.

Thanks, for any other info just ask!

-- 
Best Regards, Jack
Debian Sid PPC
