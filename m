From: Serkan Kaba <serkan@gentoo.org>
Subject: Re: Reiser4 for Linux-2.6.36
Date: Sun, 19 Dec 2010 11:43:22 +0200
Message-ID: <4D0DD3BA.9030909@gentoo.org>
References: <4CE87674.4090909@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4CE87674.4090909@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 21-11-2010 03:31, Edward Shishkin wrote:
> Changes since 2.6.35:
>
> . Fixed ->write_end() method: the old one didn't update i_size, and this
>  resulted in empty files and "orphan" items. The problem took place only
>  for splice users (loop devices, pipe2, etc).
I retried testing glib-2.24. The file size attribute is copied
correctly. But the file contents are still not copied. Thus resulting in
an empty file with non-empty filesize.

- -- 
Sincerely,
Serkan KABA
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.16 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk0N07oACgkQRh6X64ivZaJncgCfQrcVwmBP7oht2Q7qWAiiQsC2
OYoAnRj1y0AxuHZszsQ4rKcF2OB2TOqA
=Rpde
-----END PGP SIGNATURE-----
