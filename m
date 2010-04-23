From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Long rm times of ccreg40 R4 files
Date: Fri, 23 Apr 2010 12:08:13 +0200
Message-ID: <4BD1718D.808@gmail.com>
References: <z2la08621851004230137s75d5c7e4h89ee72477fca56ba@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=/+mfLW5h21/HBQ468TKL5uH71TbZGFqlhuAqs2T47zQ=;
        b=ZcDsPvcyHcy/NXr61jCTBofxYBKasph7BAP5zjEq9fno8LMAg3lEI367J3IWshaUBv
         QwBfkOCORy1cMLiykWNLLDhotN7R3v8PLmgvFe2UHLzVHV31YOhVRVucsa56+AdVH7hS
         74k09SUDzSe5mspVsVPBALDvlNYIKL1IqRN2s=
In-Reply-To: <z2la08621851004230137s75d5c7e4h89ee72477fca56ba@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dushan Tcholich <dusanc@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

Dushan Tcholich wrote:
> I was restructuring my partition layout on some disk where I had plain
> R4, and while doing it I deleted some large files.
> I was suprised how short delete times were.
> So on cc partition I created incompressable file ( as per Edwards
> instructions http://marc.info/?l=reiserfs-devel&m=121262617103900&w=2)
> and:
>
> localhost ~ # ls -l /w*
> -rw-r--r-- 1 root root 2600005632 Apr 23 10:22 /windows.qcow2
> localhost ~ # time rm /windows.qcow2
>
> real    0m0.537s
> user    0m0.000s
> sys     0m0.456s
>
> But when that file is managed with ccreg40 plugin on same partition:
> localhost ~ # ls -l /w*
> -r--r--r-- 1 root root 2600005632 Apr 23 10:29 /w.qcow2
> localhost ~ # time rm /w.qcow2
>
> real    1m1.523s
> user    0m0.000s
> sys     0m17.685s
>
>   

Data of a large ccreg40 file is scattered on many-many formatted
nodes, so in order to delete such file we need to scan the tree and
perform expensive surgery.

While a reg40 file is just one extent pointer in a formatted node :)

Edward.

> iotop: 2044 be/4 root       16.23 M/s   16.25 M/s  ?unavailable?  rm /w.qcow2
>
> If I can give any more data feel free to ask
>
> Have a nice day
>
> Dushan
>
> PS.
> localhost ~ # uname -a
> Linux localhost 2.6.31-hh #1 SMP Sat Feb 6 17:58:52 CET 2010 x86_64
> Intel(R) Core(TM)2 CPU 6400 @ 2.13GHz GenuineIntel GNU/Linux
>
> /dev/md2                /               reiser4         noatime         0 0
>
> Partition on Raid1 created with plain mkfs.reiser4 -o create=ccreg40
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

