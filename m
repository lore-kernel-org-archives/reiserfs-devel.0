From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: [xfstests/generic/083] Warning: setattr_truncate (fs/reiser4/plugin/file/file.c:2597)[vs-1588]:
Date: Sat, 14 Feb 2015 13:05:44 +0100
Message-ID: <CADW=+3m0j+RGOC8gBmqEj3baVcYPDAd7oCEkio9+EpwumnFPOA@mail.gmail.com>
References: <CADW=+3mSS+Haod3OzdS0dv8odjyn9RgJ_fZxRQkEqGcMsQGGvQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=1hp56jk3nxm1JTNw09Hr4brWCKQVy5UIqYOgI/mfB9w=;
        b=RuyNi37b0UXuYhYM+CGypT9VeEcP9agTqvkE4svYuxTBfzEa+DCHKxPplQHAQt1o/c
         qCaLU2UnPIulD3spAXaBT3x9gClMXX5PkErBsLOLR2Rvh7ixeLTlmJjz7xM4eSkf94+I
         Jn0MmiBwx3fy46/buP/CqdoynzanlrRZmAxkGaeKaKtRzLu5z8dzajX5Y3HOpOrkKYw6
         ifaD4Dm4swcYJwOF/5liG7CEXT8HGNzwfdVTWJeSRml1xsPjZDeaGnFWTEUEx7u9CbkK
         VeM85U9MHtOonwkhw480Pdm3FOdGk8/McvgudMZ95cIUX0MwYGkmBcD4ue4WzqIARoh1
         w2PQ==
In-Reply-To: <CADW=+3mSS+Haod3OzdS0dv8odjyn9RgJ_fZxRQkEqGcMsQGGvQ@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Sat, Feb 14, 2015 at 11:54 AM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gm=
ail.com> wrote:
> When running [1] xfstests/generic/083 test [3] on ccreg40 partition
Typo: it's reg40 partition
> under reiser4 3.18.6 I get a lot of  warnings[2] when disk gets full
> during test:
>
>
> [1]:
> reiser4 xfstests # ./check -s r4Hybrid 'generic/083'
> SECTION       -- r4Hybrid
> FSTYP         -- reiser4
> PLATFORM      -- Linux/i686 reiser4 3.18.6
> MKFS_OPTIONS  -- -o create=3Dreg40 /dev/hda7
> MOUNT_OPTIONS -- -o noatime /dev/hda7 /mnt/scratch
>
> [2]:
> Feb 14 13:46:06 reiser4 kernel: WARNING: truncate_file failed: oid 67=
772, old si
> ze 0, new size 855601, retval -28
> Feb 14 13:46:08 reiser4 kernel: reiser4[fsstress(1318)]: setattr_trun=
cate (fs/re
> iser4/plugin/file/file.c:2597)[vs-1588]:
>
> [3]:
>
>  FS QA Test No. 083
>
> Exercise filesystem full behaviour - run numerous fsstress
> processes in write mode on a small filesystem.
>
> http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=3Db=
lob;f=3Dtests/generic/083;hb=3DHEAD
>
> Have a nice day
>
> Dushan
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
