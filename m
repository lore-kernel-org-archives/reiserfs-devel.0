From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4 for 3.11
Date: Mon, 09 Sep 2013 12:44:01 +0200
Message-ID: <522DA671.9040006@gmail.com>
References: <3473565.3piOE8Lf58@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=tH3qhXaHP1ePcYQj8cUJCmsv95gx4AfFhtE55u/19dg=;
        b=XhxUH6X0E55upgcGNfKCmlI4clLA5+iueSV0NfZreF0Q9UxUu1qnYkTJkt/OnLzyvy
         3muXkz+N0o0mpTqrvT5MVKSjS1Edx4l3iI8drvZ0HWe4yZAvZHE3TvysgnhmkpMNs4cZ
         yCUMRPgfN/uXGoUynQ2lLjaEI2QtI3tgpVcP9j5PBV6wJhlROmfFnG0Xz/vlMwcWZkCD
         3aaCeGggzSZEn+0ETzUjU2L7zpmy/Gya1Nt93EYdUWwQfXpaMUE4OgAqszGWiXT1Wph3
         HjgspqcBqCvqlTZKGC3rIReOuKLAogXbRMUnecPfxg6QJrEnJSxOrjijqgJLb7GaL3PW
         r5fg==
In-Reply-To: <3473565.3piOE8Lf58@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel <reiserfs-devel@vger.kernel.org>

On 09/06/2013 07:36 AM, Ivan Shapovalov wrote:
> Hi Edward!
>
> I'm sorry for the silence... The summer, as it usually happens, turned out to
> be not-easier-than-studying-days (personal life and all), so unfortunately
> there is not much progress with TRIM implementation for reiser4. There is some
> code, but it's stability is zero.
>
> Anyway, here is my usual attempt to port reiser4 to next kernel. 3.11 got a
> significant API change (readdir() of file_operations changed to iterate()),
> and I'm unsure if I done that correctly. But it works, unlike TRIM. :)


Cool. Thanks!!!


>
> (FYI, iterate() differs from readdir() mostly in that it works with a copy of
> f_pos instead of with f->f_pos directly.)


AFAIK they fixed races in readdir() and friends.
I'll take a look at this more carefully...


Edward.
