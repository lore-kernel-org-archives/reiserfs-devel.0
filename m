From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: fsck.reiser4 (libaal-1.0.5) segfault
Date: Mon, 07 Feb 2011 11:27:08 +0100
Message-ID: <4D4FC8FC.6000705@gmail.com>
References: <4D4B1887.3020306@gmail.com> <4D4F2079.2080407@gmail.com> <4D4FB99B.80606@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=ZikxQXVEzwengSox2rz2cvNkMu1rFqepKJuw2ryP8xw=;
        b=kmUmlFpDFOLx+NokuuxIoVV6vRSyI9xL6LUP5jKSy09eadLgTRlrcbbDEf7SDnWgFC
         b2hbOtqkr6Qd93jSvtlgCVkhyiEL9UocZGobgCyCNMRZpcvDi3rAKMyj8CKfn/SPmYLG
         Ws88ZgQnMKuJv4SnA9cJzQ0sB/CuQUfzFe+lE=
In-Reply-To: <4D4FB99B.80606@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gleb Baryshev <gleb.baryshev@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 02/07/2011 10:21 AM, Gleb Baryshev wrote:
> 07.02.2011 01:28, Edward Shishkin writes:
>> Hello.
>>
>> I have taken a look at your problem on weekends.
>>
>> Please, apply the attached patch to reiser4progs-1.0.7,
>> and check your partition again. The patched fsck after
>> check phase should report about minor corruption and
>> suggest to repair it with --fix option.
>>
>> Please, report about results.
>>
>> Thanks,
>> Edward.
>
> It went as expected, FS is consistent now.


Data of 2 files with inode numbers 282983 and
282984 are lost. You might want to recreate them.

Edward.
