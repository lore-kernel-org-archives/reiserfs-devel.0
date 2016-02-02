From: Tiago Ilieve <tiago.myhro@gmail.com>
Subject: Re: Booting uncompressed kernel images
Date: Mon, 1 Feb 2016 23:31:48 -0200
Message-ID: <CALdTKe_mKLEUiZH34xcRCwoM=XvP_vAy-DVUpqg6-rozWyv_dQ@mail.gmail.com>
References: <CALdTKe-JA3LfHzqjSWKxjEYdfg=dGSC+juH-rm3ZvFN2FrXn7A@mail.gmail.com>
 <CAM12Q5T5ZJDCUDyExcBrCUK71NH=r00LwsEqZ5AgR9yF9U4M+Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=bcxb7zLQEy7HHJ8Rywyb4WQZ8oumKnAj5gWCNIsybE8=;
        b=pm6vhE/EiBSflpIiMvjNzVolXdj1IQGf2pwUyxUFbGcHHNN/7A21G/NKXDED96NmtL
         yA+lvrx3dBZqZLw+ItmG/gzz+dzApsgqgjicl29aGdlpozoji0UJlL/rnD2RvK/f2Pzf
         yqmOR9mcVwslMdciwgsTbL+/5a2f4CTF7aabsSFTSuYv1aZ0KurB6xy5IclM2iHJZFyC
         u9frtp+beoe8J1NKGJiaBCTUvh1ozVzVG2xM8MFsC/kiP54Z+umwzcu3ID9J9u64jYDA
         uFae25SI2Y8WnkZS4s9FlFu3LrAqyTNoudwgWnIcGD8IIcxZI3BiW2fJax0t4ggQeY3y
         KK2w==
In-Reply-To: <CAM12Q5T5ZJDCUDyExcBrCUK71NH=r00LwsEqZ5AgR9yF9U4M+Q@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-kernel@lists.debian.org
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Hi Jose,

I'm dropping off the cc of "debian-cloud at l.d.o", because this is
really a kernel matter, so I see no reason for cross-posting. I can
post the outcome in there when we reach a solution.

On 1 February 2016 at 08:37, Jose R R <Jose.r.r@metztli-it.com> wrote:
> Does the kernel boot after after you rebuild it with GZIP=y?

Yes it does. The only problem with this approach is the effort needed
to rebuild the package and keep it updated.

> The script is not without its issues, apparently, but you can modify
> xxx[1] in script if that is causing your hang.

From what I understood in the reference, one should do this only if
the "mktemp" call fails. This doesn't looks to be related to the
problem I encountered.

> In Google Cloud Engine (GCE) I have not experienced those issues as I
> have created several images in Jessie and Stretch -- manually at the
> moment. They are Debian vanilla except for Reiser4 -patched kernel and
> root (/) Reiser4 -formatted.

You are rebuilding/recompiling the kernel packaging like I did? Or are
you talking about decompressing the kernel image? Because, as I said,
I had no problem with the first one. What I'm reporting here is solely
related to an uncompressed (or compressed with other method than XZ)
kernel.

> PS I have also found binwalk [2] useful when examining contents of
> compressed kernel
> apt-get install binwalk

Thanks for the tip - although I got a little bit surprised with so
many dependencies in what should be a simple command-line utility.

Here's what I got from "binwalk /boot/vmlinuz-3.16.0-4-amd64":

DECIMAL       HEXADECIMAL     DESCRIPTION
--------------------------------------------------------------------------------
0             0x0             Microsoft portable executable
18356         0x47B4          xz compressed data
3108600       0x2F6EF8        xz compressed data

Not sure about what bytes "0-18355" means. Maybe a false-positive?

If I run it with "-e", it get two files ("47B4.tar" and "2F6EF8.tar")
that can't be decompressed with "tar"/"unxz".

-

Ben,

On 1 February 2016 at 06:03, Tiago Ilieve <tiago.myhro@gmail.com> wrote:

> Yesterday, Ben Hutchings itself (...)

Sorry. It should be "himself". If it helps you to accept my apologies,
I have written that message at 6 AM after tackling this issue
overnight. :-(

Regards,
Tiago.

-- 
Tiago "Myhro" Ilieve
Blog: https://blog.myhro.info/
GitHub: https://github.com/myhro
LinkedIn: https://br.linkedin.com/in/myhro
Montes Claros - MG, Brasil
