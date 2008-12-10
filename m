From: "David Backeberg" <dbackeberg@gmail.com>
Subject: Re: The reiser4 programming style is recursive?
Date: Wed, 10 Dec 2008 17:21:14 -0500
Message-ID: <3de056a30812101421p1c86ae57s454ce480a89f055c@mail.gmail.com>
References: <494035ED.4000706@gmx.de>
	 <b245135e0812101341k4aa15372ja2f72d0f53a7df77@mail.gmail.com>
	 <49403DBE.2070200@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=c8PperRh8ywEUpkTmKRvCDAK9YdFEdQmhtrApkuqyrQ=;
        b=j/fv1aUS8ioxC/cBvoBuienQ+dG6t1HznTfVTuavhY8rRp8snHDsK0IUqw7VPmeB8f
         0GCKtLzLvP5JhbbxtsN8v98W/4LXEf1OZVOYhlrupuBucPxiyt9RhW1Q0EfVUxoeJ/Yi
         4+CGXvzTWexkD8zzCPLqjWuOcMAQaWrf+P2l0=
In-Reply-To: <49403DBE.2070200@gmx.de>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

On Wed, Dec 10, 2008 at 5:07 PM, Ralph Ulrich <eulenreich@gmx.de> wrote:
> You didn' answer my main question:
>>> Is it true that the programming style of reiser4 is recursive style and

The code is open, and you're welcome to read it. I wouldn't call
recursion a "style" so much as an approach to solving a particular
problem. I think of "style" being things like whether your curly
braces go on the same line or on the next line, how much whitespace
you allow between code elements, etc. Perhaps you're just saying that
because English isn't your primary language?

>>> that this kind of style was rejected from the kernel developers?

Which rejection? And who are "kernel developers"?

The code is in Andrew Morton's tree, and I think "kernel developers"
would agree that Andrew Morton is a kernel developer.

If your actual question is "how come reiser4 is not in mainline?"

This question has been asked and answered repeatedly. In fact, try
typing "reiser4 mainline" into google and read the results.
