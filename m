From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [Testing Error] xfstests generic/263 - fsx exercising direct
 IO vs sub-block buffered I/O
Date: Mon, 08 Dec 2014 20:14:57 +0100
Message-ID: <5485F8B1.1000200@gmail.com>
References: <CADW=+3k72fV1RbUjd+kQtQLPWxrCbQay9AL2=fzoDjX9vZhm4g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=/wdtF13bVnKHLHBEjVcrb2y2ppEFK01f/KPCsWMJ9sM=;
        b=Pj0+Xxg8IORPGiBLLLvnVFjB2vkp4YG2cJjTMeG45+BXjcRdUZnOTYWfSYGt/ATWlp
         157l4gVFb3rTzfNAeOQo8gJBENPQbH9pX/osMzvpd9NzmYW3w0/LpjrffZgjf1MDAJdJ
         700Xv68w+dKTHljmd8YDs2RryKFgtPCK4+ACgCm934ugu7QLe5xuTIsmGJjSOIVsHPcu
         ANqhSgvJ3ZRGFlJjtgkk6SXVjRK6tW5+RvqtlGXnzAVCfVuK2MyYcB5nWM3UbXxi2vGr
         EcDZaZ9hYX2OJvddTDDEf2MBoT/7GI1wcwU/MwelV6YieF9yqWU3RsCJdsNoBgt8vzzX
         sj8A==
In-Reply-To: <CADW=+3k72fV1RbUjd+kQtQLPWxrCbQay9AL2=fzoDjX9vZhm4g@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Cc: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 12/05/2014 02:33 PM, Du=C5=A1an =C4=8Coli=C4=87 wrote:
> Code: http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git=
;a=3Dblob;f=3Dtests/generic/263;
> Patch: reiser4-for-3.16.2.patch
> Extra mount options: none
>
> diff -u tests/generic/263.out /root/xfstests/results//generic/263.out=
=2Ebad
> --- tests/generic/263.out       2014-12-04 21:04:20.000000000 +0100
> +++ /root/xfstests/results//generic/263.out.bad 2014-12-05
> 16:04:23.000000000 +0100
> @@ -1,3 +1,4 @@
>   QA output created by 263
>   fsx -N 10000 -o 8192 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z
> -fsx -N 10000 -o 128000 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z
> +fsx -N 10000 -o 8192 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z
> +/mnt/test/junk: Invalid argument


Also exclude so-called "generic" tests which exercise direct IO,
that we don't support, and I think that everything will be just fine.

Edward.


>
> On Fri, Dec 5, 2014 at 2:22 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gm=
ail.com> wrote:
>> I managed to get xfstests  (
>> http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=3D=
tree ) to
>> run on Reiser4 partition. Test for async, acl, quota still don't wor=
k but a
>> lot of the rest finishes successfully.
>> Tests were run on reiser4-for-3.16.2.patch
>> I'll post unsuccessful tests and their results in following e-mails.
>>
>> Dushan

--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
