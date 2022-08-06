From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: 5.17.0-3+reiser4.0.2-amd64 SFRN 4.0.2 crash in local development
 machine part.
Date: Sat, 6 Aug 2022 12:34:53 +0200
Message-ID: <2689ffc5-b0a8-6199-4df5-55b462792d8a@gmail.com>
References: <20220805043523.E6E96A86C50@tezcatlipoca.metztli.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:cc:in-reply-to:content-transfer-encoding;
        bh=akdRVEUH241zFUlARmehFKlEyxn9+IeT+nWUi+XvxtQ=;
        b=bqCG/Pwu8G8evXcnUycSUPkGYR8n/IBYr89vfi/2s7d1QgbQYOK6FqjV8jRajoIp1h
         Gr/h0q6QB97YFJzsnEDocfI0JydFkr3QzxX5FKlhGSXvGVBlt16uP7PAPPQ2hU8bK0hu
         sKogleec1UnPj8gOPa5HfMQOxATYGz2wmwJPQD/7PH2KygXaK+YiaigOinuNHFZIfufH
         GqkQNKDuc69zjYeO+ESgoc/RmgLLykjeK0i7IqezHwLY9wIPDGCV9EWdoynAbA2sfYEr
         H3EVGEbShLt8axUFLjcJuSs/5tFkRK2jSAUyW43YLiYQdZqn7BPEbUlTMKy5DF6W70i4
         Yi+g==
Content-Language: en-US
In-Reply-To: <20220805043523.E6E96A86C50@tezcatlipoca.metztli.it>
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Metztli Information Technology <jose.r.r@metztli.com>
Cc: reiserfs-devel@vger.kernel.org

Hello.

This flood of warnings is because of no memory to perform compression
at transaction commit time, when the file system can not fail.
A possible solution is to fall back and commit uncompressed data.
Still in todo (AKA never-do :) list.

Edward.

On 8/5/22 06:35, Metztli Information Technology wrote:
> Niltze [Hello], Ed-
>
> Linux tezcatlipoca 5.17.0-3+reiser4.0.2-amd64 #1 SMP PREEMPT Debian 5.17.12-2+reiser4.0.2 (2022-06-10) x86_64 GNU/Linux
>
> Another (ugly) failure with the modified reiser4 SFRN 4.0.2 dealt with in my last email
> < https://marc.info/?l=reiserfs-devel&m=165861866731480&w=2 > to the list. I am just recovering from an local umount op which left
> another reiser4 SFRN 4.0.2 partition in an inconsistent state and while the recovery operation is ongoing I get this
> via dmesg:
> ...
>
> [355209.443969] reiser4[DOMCacheThread(23260)]: checkout_logical_cluster (fs/reiser4/plugin/file/cryptcompress.c:1992)[edward-1430]:
>                  WARNING: alloc stream failed with ret=-12
> [355209.443975] reiser4[DOMCacheThread(23260)]: assign_conversion_mode (fs/reiser4/plugin/item/ctail.c:1577)[edward-1021]:
>                  WARNING: convert_ctail: nothing to attach
> [355209.444008] reiser4[DOMCacheThread(23260)]: checkout_logical_cluster (fs/reiser4/plugin/file/cryptcompress.c:1992)[edward-1430]:
>                  WARNING: alloc stream failed with ret=-12


