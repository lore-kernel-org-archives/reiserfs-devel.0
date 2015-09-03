From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [xfstests/generic/285] Regression from R4 patch 4.0.9 to 4.1.6
Date: Thu, 3 Sep 2015 12:11:32 +0200
Message-ID: <55E81CD4.6090900@gmail.com>
References: <CADW=+3nso_whRtSB6op8rfYYoY_2oFef6-Q08JsoSS9ks_+8Hg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-type:content-transfer-encoding;
        bh=oYHfkI2OyzaLCvYOhajJkhYMcLb/LipHpel6QdUZT4c=;
        b=HEYjdqY4oeCAiJWXxD83ea5TlJTnGBlAZ55hGHPWZHBaxY2LGil4XBWdSTa0sx7CjE
         esE0nqMfH4zIVpWZAgmDu2Nxi38d4Ajr7VwWLmcariVQ5eN3T22VD0fqWeVe8KwXEapZ
         +2m4s70L0DB24TeIF5P0eLQY90TfIfxLOzXMAOKd5At6W1qHp2sUo3dx7YSAnna7KpUg
         t739rKXUD9Xzm97yX4IieTTT1agHZuyF5j+RRogv3yxyFzaO3ga/9m792gUvOXyA8pLR
         fiBrrH1ZvXK4XYsY/4hY9NYhRLA6oR2rURjrvLU0+O391jIK5PGkaZNZzyk41ea7gtn8
         1QfQ==
In-Reply-To: <CADW=+3nso_whRtSB6op8rfYYoY_2oFef6-Q08JsoSS9ks_+8Hg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Hi Dushan,

Could you say "sync" on another console? Does it help?

Thanks,
Edward.

On 09/03/2015 11:57 AM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> Kernel: linux 4.1.6 and 4.0.9
> R4 patch: 4.1.5 and 4.0.9
> Test: xfstests/genersic/285
> "SEEK_DATA/SEEK_HOLE sanity tests."
>
> http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=3Db=
lob;f=3Dtests/generic/285;hb=3DHEAD
>
>
> With node40 and node41 and both ccreg40 and reg40 plugin on 4.0.9 and
> 3.18.6 test passes in 1s but on 4.1.6 with same .config it works for
> hours.
> Nothing in /var/log/messages
>
> vmstat 2
>
>   procs -----------memory---------- ---swap-- -----io---- -system--
> ------cpu-----
>   r  b   swpd   free   buff  cache   si   so    bi    bo   in   cs us=
 sy id wa st
>   2  0      0 460268   3200  28132    0    0     0     0  252   15 14=
 87  0  0  0
>   1  0      0 460268   3200  28132    0    0     0     0  252   12 13=
 87  0  0  0
>   1  0      0 460268   3200  28132    0    0     0     0  253   14 13=
 88  0  0  0
>   1  0      0 460268   3200  28132    0    0     0     0  252   14 12=
 88  0  0  0
>   1  0      0 460268   3200  28132    0    0     0     0  252   14 11=
 90  0  0  0
>
> ps -aux | grep sanity
> root      1323 99.7  0.6   5392  3124 pts/0    R+   13:43   1:31
> /root/xfstests/src/seek_sanity_test /mnt/test/seek_sanity_testfile
>
>
> Reproducible with command:
>   ./check 'generic/285'
>
> with this local.config file for xfstests:
>
> [r4ccHybrid]
> MODULAR=3D0
> TEST_DEV=3D/dev/hda5
> TEST_DIR=3D/mnt/test
> SCRATCH_DEV=3D/dev/hda7
> SCRATCH_MNT=3D/mnt/scratch
> RECREATE_TEST_DEV=3Dtrue
> RESULT_BASE=3D"`pwd`/results/`date +%d%m%y_%H%M%S`"
>
> FSTYP=3Dreiser4
>
> MKFS_OPTIONS=3D" "
> MOUNT_OPTIONS=3D"-o noatime"
>
> [r4Hybrid]
> MKFS_OPTIONS=3D"-o create=3Dreg40"
> MOUNT_OPTIONS=3D"-o noatime"
>
> [r41ccHybrid]
> MKFS_OPTIONS=3D"-o node=3Dnode41"
> MOUNT_OPTIONS=3D"-o noatime"
>
> [r41Hybrid]
> MKFS_OPTIONS=3D"-o create=3Dreg40 -o node=3Dnode41"
> MOUNT_OPTIONS=3D"-o noatime"
>
> If you need any other info I'll send it.
>
> Have a nice day
>
> Dushan

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
