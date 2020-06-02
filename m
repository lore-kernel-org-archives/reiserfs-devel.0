From: Metztli Information Technology <jose.r.r@metztli.com>
Subject: Re: [GIT PULL][PATCH v5 0/8] Add support for ZSTD-compressed kernel and initramfs
Date: Tue,  2 Jun 2020 06:20:51 -0700 (PDT)
Message-ID: <20200602132051.A89BA6095180@huitzilopochtli.metztli-it.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1591104055; h=From: Date: Message-Id: Cc: To: Subject: Sender;
 bh=TAsRPfKbTy6wQKeY54GoiEPQoaLtaNTmbgeoV1jTBA0=; b=Qv8Uty7+T6RRF1BCz96qfkCmGvTquKN9o/NqK23tvxMINLxOrYXEPr3YCytm4VACAwf7Ga5y
 9zCE+tmNaazBYETcfVELqwCSNy/PxOvVNbChZpTwJapPlSG9NgzytNJnQ7vG/6lOGGcPOCcB
 PghPKsxBopU9S1wcvs0mfB5ubiU=
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: nolange79@gmail.com
Cc: nickrterrell@gmail.com, akpm@linux-foundation.org, Kernel-team@fb.com, clm@fb.com, gregkh@linuxfoundation.org, keescook@chromium.org, kilobyte@angband.pl, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@kernel.org, oss@malat.biz, patrick@stwcx.xyz, patrickw3@fb.com, rmikey@fb.com, sedat.dilek@gmail.com, terrelln@fb.com, x86@kernel.org, reiserfs-devel@vger.kernel.org, edward.shishkin@gmail.com

On Mon, Jun 1, 2020 at 2:59 PM Norbert Lange <nolange79@gmail.com> wrote:
>
> The series seems to be stuck in limbo, and I got the hint to bring
> this to Andrew's attention [1].
> Hope this will finally end in upstream, been using these patches for ~2 years.
>
> Regards, Norbert
>
> [1] - https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=955469

Began using your patch for Debian Buster backport of 0.136 initramfs-tools, and Nick Terrel's kernel patch for 5.6 -- but modified for 5.5.17-19 in my reiser4 builds -- and set both defaults to zstd.

Thus far, as long as there exists 'a priori' the Zstd package, the combination works in both local and my custom Google cloud instances installations.

Best Professional Regards.


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Buster w/ Linux 5.5.19 AMD64
---------------------------------------------------------------------------------------------
feats ZSTD compression https://sf.net/projects/metztli-reiser4/
-------------------------------------------------------------------------------------------
Official current Reiser4 resources: https://reiser4.wiki.kernel.org/
