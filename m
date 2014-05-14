From: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH V2] fs/reiserfs/stree.c: remove obsolete __constant
Date: Thu, 15 May 2014 00:08:34 +0200
Message-ID: <CAFLxGvzp_8Qgg0wN2v0SncAB+eDEn4s-p86ZW9+DzosBKb53yw@mail.gmail.com>
References: <20140503223324.4357f591dc8994b74f456440@skynet.be>
	<20140514220143.GA20841@quack.suse.cz>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=ehcERONonhNKd5zWyYVoVGIhq8lgyN3DAPGvsxRBDHk=;
        b=OmAiyGEl0iGgm50ATbU6aTDfJOsOMygLdSPvU7k76/g593APAhzxSorehD8jug62/i
         YOinA6EcC5uxbcYFNpeUA4NAxVmi9XjHZjhT9fyfzlVKodHdXbmI2pDSA5UCV1PML84f
         7O6r8qKLC8SICM/ZTb1NSQOYTCPlmM3FIJBiipGOUGP3UxS5EIBkAz4vCUWZmhJ+PajE
         wK4f8mVwBZvLkx1SnzekRIMF0I2uYwTK7gFHslEg9qGuHIaxJ7bNvB+INOX5KtOpHdlW
         38Y0BcsNfxb45H08O8D4lG6aVwmXh0uIaWp/M4sWXEHghHDiTg+ufCVbyMQjvuAw6Yd9
         6JMA==
In-Reply-To: <20140514220143.GA20841@quack.suse.cz>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Kara <jack@suse.cz>
Cc: Fabian Frederick <fabf@skynet.be>, linux-kernel <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org, akpm <akpm@linux-foundation.org>

On Thu, May 15, 2014 at 12:01 AM, Jan Kara <jack@suse.cz> wrote:
> On Sat 03-05-14 22:33:24, Fabian Frederick wrote:
>> __constant_cpu_to_le32 converted to cpu_to_le32
>>
>> Cc: reiserfs-devel@vger.kernel.org
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Signed-off-by: Fabian Frederick <fabf@skynet.be>
>   Just for my education, where have you learned that __constant_...
> functions are obsolete?

IIRC checkpatch.pl barks if you use __constant_... outside of include/uapi/

-- 
Thanks,
//richard
