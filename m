From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [BUG]Reiser4-for-4.12 kernel: reiser4[rsync(9841)]:
 reiser4_write_dispatch
 (fs/reiser4/plugin/file/file_conversion.c:582)[edward-1544]:\x0aWARNING:
 Inode 98653: file plugin conversion failed (-2)
Date: Tue, 2 Jan 2018 15:14:41 +0100
Message-ID: <762d9f56-1e76-d861-7e2f-2e042ded95ae@gmail.com>
References: <CADW=+3mv7Ly-Bd3ZTdGEGyZ0iAUmjmqxoe9C-DGNUmXtuA0hUw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=7kYxB1t+Hmc1a/QH6vzXc6xuNx5dOsbDRKFlPgORfhE=;
        b=I73/ow4szxyCbYwmm/0UMwlmwzSEtAaBPIkHd33KDkiGWgPfcQzNzzTamZ07lRmbcc
         mkA+3zzlDuHWDrE6YsdKT1fZfVuPZ1jfdUZJAEYqBrM9CmTPhLX0/u0kyV4AepuP44SZ
         xvEJS2KA/LhyXjk2d8S9qp8Wc/OVSswEu0Mn6E9eGB4Sb2JbDJIGn/sbSDfV6+SeMXlr
         TP0vYPNajrO4JbZnjYJRwLrbPYZDBP/6Py2wFXSoSw9rE372eIiUYRqHwFRdTYs5oyBu
         kgTxkJl/GtbiwUIYT6f/sKvPUx7uuMqBV5m/1dfkzPeb62mOLk2ZcuezovhuEUvd/ZNr
         0SVQ==
In-Reply-To: <CADW=+3mv7Ly-Bd3ZTdGEGyZ0iAUmjmqxoe9C-DGNUmXtuA0hUw@mail.gmail.com>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hi Dushan,

Does this problem (failed plugin conversion) take place in 4.14?

Thanks,
Edward.

On 01/02/2018 08:52 AM, Dušan Čolić wrote:
> Hello
>
> On kernel 4.12 while rsync-ing /home to newly created reiser4
> partition I get lots of messages in logs:
>
> kernel: reiser4[rsync(9841)]: reiser4_write_dispatch
> (fs/reiser4/plugin/file/file_conversion.c:582)[edward-1544]:\x0aWARNING:
> Inode 98653: file plugin conversion failed (-2)
>
> Partition was created with mkfs.reiser4 /dev/md125

