From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for Linux-4.14, Reiser4progs-1.2.0, Libaal-1.0.7, Format
 4.0.2
Date: Mon, 27 Nov 2017 21:05:49 +0100
Message-ID: <8a29e976-de48-dabe-2b2f-a7149002251e@gmail.com>
References: <2cf6aac6-650d-4940-359d-316dc70a183d@gmail.com>
 <1511788205.5344.2.camel@z-51.de>
 <8db85297-34f8-980c-dab9-c98b95fb592c@gmail.com>
 <1511796421.5344.6.camel@z-51.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=o6vODa95Y4U9RlIjmTELCCb0GpoxjwRzlEX7bj8NS+Y=;
        b=TQJl7tQEVB+SnGrkQGfR5CTzEko7Yknp+/j2zQsmBMICGjyOrXMgWDwx7NyYniOU3A
         MoCy7Siw6AI0s0cns363l3nxV7WKzs73cVN7Ld6YW9kSSEz6VUAWS/mmCUUSgV9MJ1Qd
         36gAM2oTJEfqWvGNYtS4wylvD7Lheq9t/PRGQAI4h2+G7Miys+hCWG2GYzIQEHp3f45X
         GF+hhJwaMqTdzYM5FEE6ZMYGhHmFs8did+LLo9bHfHSUHqIq364udNNjmdJNpMkh2Gnk
         mb4v/8Wvlxidzgh19kISqoUJ4cE1CSNHwXqRnJr/mFEO3a0HOotsUIaQUiEEKdt9JXVg
         87aQ==
In-Reply-To: <1511796421.5344.6.camel@z-51.de>
Content-Language: en-US
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Felix Zielcke <fzielcke@z-51.de>, ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>
Cc: Christian Kujau <lists@nerdbynature.de>

Hi Felix,

Thank you for the hint!
It seems that the following patch is incomplete (missing rename of 
align_loop_flag):
https://github.com/edward6/reiser4progs/commit/2b74e05bdde4f84a224bc235814d1fc51793a2c8
I'll prepare a new release basing on your fixup.

Edward.

On 11/27/2017 04:27 PM, Felix Zielcke wrote:
> Am Montag, den 27.11.2017, 14:46 +0100 schrieb Edward Shishkin:
>> Hi Felix,
>>
>> Thank you for the report, I'll try to find out, what is wrong.
>>
>> Edward.
>>
> Hi Edward,
>
> I got now a hint on the Debian bugtracker
> The problem seems to be the variable used in the configure.ac check for
> falign-loops
> This patch seems to fix it:
>
> --- a/configure.ac
> +++ b/configure.ac
> @@ -408,7 +408,7 @@
>   fi
>    
>   # Force no alignment to save space.
> -if test "x$falign_loop_flag" = xyes; then
> +if test "x$falign_loop_flag_cv_" = xyes; then
>          ALIGN_FLAGS="-falign-jumps=1 -falign-loops=1 -falign-functions=1 \
>   -falign-labels=1 -fno-inline -fstrength-reduce"
>   else
>
> Regards
> Felix

