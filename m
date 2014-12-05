From: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>
Subject: Re: [Testing] Testing Reiser4 with xfstests
Date: Fri, 5 Dec 2014 14:46:31 +0100
Message-ID: <CADW=+3=QtDv6--1BNAVo8dcKX4QPeZWYeJJQvuiJu+dqec0aug@mail.gmail.com>
References: <CADW=+3nVaodqG2YX0g8kajU=ZPKOPw167Sm98vHQBFvmqfL4xg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=R2xe5hDMRAeM7nPZMhko0aKAUxt2Q8zgjn27zJNVE1Q=;
        b=OkMsCdBw1Z66hrXjgRLrFOmNk43nQiKFfMRWtkgApkvIfD/XVcYwyHIWPXGWi8bY9a
         SIrK6n2qLsotELIsX9PUpGhTL0/9Q0OcNp1cy7V8TSyyt4hwNseebHNJtHZkUQo/AIPp
         0kGmJp6JIEpHSFzdT92BeW9o8IxwG7a+PG2AYtJVhVZNJ74dtRQld7BrsNuphcWYn/GX
         7SWcM6RjAawvuQ6rO6NEkzfjjn4+CKQZMZewx6OQd2WPkbm5jlulXu+G/WOV96FbxZru
         +TMMFqnjo4QoEZmrcEQvu9CQI38RGCLpD+r+fyKYLbrSiHH6STv7boDJ7NSIn9oQjlq3
         UcdA==
In-Reply-To: <CADW=+3nVaodqG2YX0g8kajU=ZPKOPw167Sm98vHQBFvmqfL4xg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Edward Shishkin <edward.shishkin@gmail.com>, Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

On Fri, Dec 5, 2014 at 2:22 PM, Du=C5=A1an =C4=8Coli=C4=87 <dusanc@gmai=
l.com> wrote:
> I managed to get xfstests  (
> http://oss.sgi.com/cgi-bin/gitweb.cgi?p=3Dxfs/cmds/xfstests.git;a=3Dt=
ree ) to
> run on Reiser4 partition. Test for async, acl, quota still don't work=
 but a
> lot of the rest finishes successfully.
> Tests were run on reiser4-for-3.16.2.patch
> I'll post unsuccessful tests and their results in following e-mails.
>
Btw. these tests can stress test fs and I could also test with
different mount (block size?) or mkfs options (reg40) and automate it
easily to test multiple combinations, so if there's any ideas what
would be useful please tell me.

Thanks
Dushan


> Dushan
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
