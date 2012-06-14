From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 2.6.39
Date: Thu, 14 Jun 2012 11:33:03 +0200
Message-ID: <4FD9AFCF.6040306@gmail.com>
References: <4D9CE99B.2040306@tls-tautenburg.de> <4E7CE2B2.3000502@tls-tautenburg.de> <4E7F9F2C.90403@gmail.com> <4E880BF7.8030403@tls-tautenburg.de> <4E889A19.7010107@gmail.com> <4FD9A1F4.9000804@tls-tautenburg.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=/6ce6sH+ZEQKImpl3zfO3eXQPV4w+3QI6l6rosVFJl8=;
        b=mxCMKxiuaT6/SQ1GVRG8ublZeMq2zp9PU7mENsJNyVm0K0DJvEcbbzmutPkJj39D5b
         rfgUIiD9U89D33ENDtJ3gfiIDpM+zJCjydeXMb0PWlEEnNv6G+mmqx7HbxXHsJpaf8vi
         3pA4ahWRB+nTYl0ahDMiSAbvBSiBrpGyk8NnZs4YlJACGMNL0llZDKPMkmpETNVx6HhZ
         7RnpiDTx3m1o5IoM53ivsCbl92Ke8XrhTuEfTCfDMBITgKPKzLguwDnroz/pJ1KwBz48
         UF5ogobvZk9+LbS9ZUy3g2uy+mhOh5b1CaCY5QYNNtM5Y7U7pNIW6kteeUF3qw7eyiBM
         PD/g==
In-Reply-To: <4FD9A1F4.9000804@tls-tautenburg.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Bringfried Stecklum <stecklum@tls-tautenburg.de>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

Hi Bringfried,

This is still risky.

Reiser4 has bugs in INSERT_FLOW balancing primitive, which is used by
cryptcompress file plugin and unix (default) file plugin in the case
when file is built of fragments (tails).

For now only files built of extents are safe, so make sure that you
format your partitions with "-o formatting=extents" option.

Once the INSERT_FLOW primitive is fixed, I'll report to the mailing
list.

Thanks,
Edward.


On 06/14/2012 10:33 AM, Bringfried Stecklum wrote:
> Dear Edward,
>
> I only now noticed the patches you provided end of May. Am I right that
> using a compression plugin should be more safe now, and filling a
> partition poses no longer a risk? If so I'll make another try.
>
> with best Regards, Bringfried
>

