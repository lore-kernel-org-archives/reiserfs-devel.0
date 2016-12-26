From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] Change /proc/mounts values to human readable form
Date: Mon, 26 Dec 2016 18:24:01 +0200
Message-ID: <58614421.70603@gmail.com>
References: <CADW=+3m4M7tpFtViYoXWyeqUn4qsozDU-Px9mKkZu9s6VPU-Vg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-transfer-encoding;
        bh=t0qsVKrptR1rhiKZy8tbATnorVVRnZ16SFjh1WDzH1I=;
        b=ZiFqHnnDazck7mVYNrbiuwixelCVhe1WU4eBeCgtW2wnXLQbPVBf1T6jNFFnqWZHVD
         o/DPqGLthjx3uq3vouE+1RuG1abOavLF1utGW50O70hVySSphc85mWw086JNnEUhGABu
         VVKukVXTDs/p7jMjAIwJTcx172E8ZaONWENUeNvyhqor64kHiw+OuL9z9fH6sGg3d0gg
         /5m98eZCZRD9qWGZJlvc20xpOLgQVhXWV67XGauRTqKMr4yaIXGiVMIyZIWvTemKrLuC
         oL0E992zIU+oBLCotU4diATwtt38szkN/yA1EGwlhZPAddkb7h+yZn4LsIeTpM1xOGpP
         6ukA==
In-Reply-To: <CADW=+3m4M7tpFtViYoXWyeqUn4qsozDU-Px9mKkZu9s6VPU-Vg@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?B?RHXFoWFuIMSMb2xpxIc=?= <dusanc@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

OK.

On 12/24/2016 07:43 PM, Dušan Čolić wrote:
> Values in /proc/mounts were in hex format so the attached patch
> modifies them to human readable form.
> It doesn't print out units (seconds, bytes, pages) but I can make it
> if it's desirable because it's not obvious that some values are in nr
> of pages.
>
>
>
> Dušan

