From: Evgeniy <iron.udjin@gmail.com>
Subject: Re: [PATCH] reiser4: fix problem of non-deletable directories
Date: Sat, 27 Sep 2014 05:22:07 +0300
Message-ID: <CAL2jS+nSR9gc57sEhvhthkDB9oy16VhjQHmphKtcLz0568ogKA@mail.gmail.com>
References: <5425C5FD.6020907@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=WcbhvecLxa+LwoKRSd6S/yZaTctZaNLpc4ZGnt9AoK4=;
        b=P/SP1d8azodzLM1SmPMfQTeXrmhWrkqkIS4xjLn5IhZOoJxCJwW9pIJjkZcQUBaMDL
         ojhV1zmowiF/gzAinDKBkGcf9uffdvx8yWgGhDduehQt245EL7HwiT++VcWIux0jKB0W
         aB26pmkkNS7vJHDXACChMUfWjA0mFARO/EwHcoKy8xlv54MF0cTrg6+O94GMP47ViNyV
         dkV8IpyuoPlF0tRNBrM0rq/fhAD+06utDtDx9/2HEvZIsagqd0WrJdxUot/FwVB4UFvU
         kiGqlM/aEJFBnbvNOJtB/LQGM3pzgNHkINIJsmX97E4U/8Uzw5HrKKRrGssXZNwK8RI5
         QvMA==
In-Reply-To: <5425C5FD.6020907@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: ReiserFS development mailing list <reiserfs-devel@vger.kernel.org>

Thank you very much, Edward. I was waiting for this patch a few years.
:) I just tested it and seems it fixes the problem with non-deletable
directories. I'll test it a week or two and I'll provide feedback
about the problem.

Thank you Edward and Ivan for your work, I'm really glad to see
activity in development here.

On 26 September 2014 23:01, Edward Shishkin <edward.shishkin@gmail.com> wrote:
>
