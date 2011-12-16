From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Backup Configuration
Date: Fri, 16 Dec 2011 19:09:14 +0100
Message-ID: <4EEB894A.5060506@gmail.com>
References: <CAMjNLwp73_4pAgkTDXrg9fHDh5Ukqrm-Ui090W+qyKKGVA-Fng@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAMjNLwp73_4pAgkTDXrg9fHDh5Ukqrm-Ui090W+qyKKGVA-Fng@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Matias Seco <matias.jose.seco@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 12/14/2011 04:42 PM, Matias Seco wrote:
> Greetings,

Hello.

> i've attemped to perform a backup of a reiser4 fs:
> i've done this through:
> rsync -a -v /mnt/gentoo/ /mnt/backup/ (mounted temporary)
> /mnt/gentoo/ contains a reiser4 with base system files so being a / (
> 1 partition upon /dev/sdb)
> /mnt/backup/ it's a partition of another hdd (/dev/sda1), with an ext4
> fs (first partition with same size as sdb)
>
> The command triggered many read errors for mapping of a file/ readdir/
> readlink_stat, because of a "input/output error (5)"


any related kernel complaints being?


> Failing so to copy them.
> Then they were domr gilr hsd vanished "file"
>
> A) Is this caused because the r4 partition has gzip plugin or
> something particular? (can i give further info ?)
> B) Is there any tool/method you advice to backup a reiser4 fs ? (i can
> use another one, since it will get the last consistent backup)
>
> Salut, Matias
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

