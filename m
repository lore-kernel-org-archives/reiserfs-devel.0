From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: PATCH reiser4 support for Linux 5.8.10
Date: Thu, 24 Sep 2020 20:34:19 +0200
Message-ID: <8c0f0263-1da0-11e9-c7b0-98a0aad9a888@gmail.com>
References: <20200728222041.5d88b2e1@Phenom-II-x6.niklas.com>
 <20200728223440.0fd8681e@Phenom-II-x6.niklas.com>
 <20200805125317.10bf1d34@Phenom-II-x6.niklas.com>
 <CAHk-=wiGsj_R7pspFegPgtT4on1iYk5MmBz8uZZ3338EH3HO+Q@mail.gmail.com>
 <20200817105604.454981dd@Phenom-II-x6.niklas.com>
 <20200924132158.38fa279f@Phenom-II-x6.niklas.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7Edzs7KfQpjr+XIKPMKA2WjNrXyAz2LAzufBwtX3x8M=;
        b=cKEMiCs0WomV4/xV4B0+gLHm3U1+FwdE9YcfmloN/ox1tUpsDEkjTt6vz5QoJjLxN0
         szDVrEVDEfVrDnmm7NJ1k9pI3gJHHhnA1sn0cqNSCNsBOrd7R4TcvVTgLNmfBmNSpdxJ
         aJbc4Xlc+i6zZHVGOwlnwalw7Oq//ZDjP33bLCFWbSRfdsTUEJsiNtrkme/AF8YDZXfG
         XxaUqihhVomVV+e0LUw4NXACy/NOZ2+0WJKeUUqDSBgZpbKRjsiiZzIdeLF5Z5Pes5pu
         VYs2ZVWVVEFJF7ifODvVPpC8ao4GaG7g5yfragoti+Q6YuusP1y/ULP8BB0bdam80nVb
         YCtA==
In-Reply-To: <20200924132158.38fa279f@Phenom-II-x6.niklas.com>
Content-Language: en-US
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Niklas <Hgntkwis@vfemail.net>, reiserfs-devel@vger.kernel.org
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 09/24/2020 07:21 PM, David Niklas wrote:
> I'm a kernel dev newbie. Please double check my work if in doubt.
> 
> The patch for reiser4 support for Linux 5.8.1 didn't apply to 5.8.10. It
> needed only a one line change, but because of all the fuzzy matching and
> offset matching I thought I'd make a new one.
> The file that failed to patch is fs/fs-writeback.c. A struct got one of
> it's members removed. As the entire struct was removed by the patch

Hi David,

Precisely speaking, it is not removed, but moved to a header file.

Anyway, I guess that the missing member wasn't used by reiser4, so feel
free to ignore it.

Thanks,
Edward.


  I
> thought it good to ignore the missing member instead of trying to dig up
> what it was used for and why it was removed.
> 
> Thanks,
> David
> 
