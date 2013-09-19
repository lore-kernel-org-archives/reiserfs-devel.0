From: Christopher Gentile <cnjgentile@gmail.com>
Subject: Re: Reiser4 GIT and Kernel 3.11 patchs
Date: Thu, 19 Sep 2013 16:08:26 +0000
Message-ID: <CABYXC3a-idxzAt5xQmpbrCzmpwy=HkaKVOACb=__isMr3kTdnA@mail.gmail.com>
References: <20130919151403.Horde.VoBIXKovROrctv021aPeYw7@mail.thieu.so> <20130919155519.Horde.ECPL8bqkTU-l0OG4BvsgnA1@mail.thieu.so>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type;
        bh=LES9zSHihPPWb4QCTiEFujr9H7h6DBi34zdNRFqBmPs=;
        b=LBqOGvW7+xNFOO5B+xxhut9YygASTnCm/Dj6+JZ3G0cDL6m9zkidpTJkoOS+bzKAGY
         oYlPgoIlExphVh5gluBAc6v1owhr8HZ4bRna7m5nzRhCVrizDl0q06yjFhpfqw2KPv4r
         Amih41vGGuBlHC/fnVorVqcxxl/kBm28RdlQ8DrVnmRSpT5xHJXB0WPMbtAEvK4N+FEF
         hAjcKdDXoLPMPCZSLodMRLBfgmGc3mr6F4ePapbBf4bPgHEONS6n0WXhOaBUjs8fWpQ9
         bKEszPOqcZGH+IkNqAv907jhXfMOLn5dMr+M8wnIqYK3+WdeYOQLzcQa14coSWNLtPZw
         rgMw==
In-Reply-To: <20130919155519.Horde.ECPL8bqkTU-l0OG4BvsgnA1@mail.thieu.so>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mathieu Belanger <m@thieu.so>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Du?an ?oli? <dusanc@gmail.com>, Evgeniy <iron.udjin@gmail.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Ok let's try it out!


On Thu, Sep 19, 2013 at 3:55 PM, Mathieu Belanger <m@thieu.so> wrote:
>
> I have updated 3.12-rc1 in git. It compile and should work.
>
> Note that the shrinker API is gone so the code need to be adapted.
>
> Until that, I reverted the kill shrinker API patch to make it work.
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
