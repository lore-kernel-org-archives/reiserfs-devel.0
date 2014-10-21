From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] [PATCHv3 7/9] reiser4: batch discard support: actually
 implement the FITRIM ioctl handler.
Date: Tue, 21 Oct 2014 12:14:02 +0200
Message-ID: <544631EA.6090502@gmail.com>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <1408312379-1990-8-git-send-email-intelfx100@gmail.com> <5444E9D5.1090908@gmail.com> <1474324.CcTjzLnQHn@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=hyxgwDp1+5qOTgd9ldyy/RbEsGWDSQCOC7r16sq4oIc=;
        b=FGPCM1LcHw+Pe7Nz6XFBqBOq689qJr8Igy6xKvybDZCunuDoE+j1rzhDhM8buM+u8F
         +BadQNUb3WzwBPe8YqY5vZ+3OmMiwej1t19uQfX05QZEdp1fRWnEHy7uHC9wtaJps7rB
         dx3Pc4K+IjctA27eTQxXERkKYH2NnknoJB+d8gkmGvT3hRQGiJmVrmPdU+r3mR1RuvTz
         OdT2vtiZ4K759zvQXLBwsXLHYmhqw7iMnxIkIDDpyGl6mrqdZ16kXc9MVMJydyLu8M9h
         V/lPeBHLNRT3kK5cMA0l0w0G6ar7ItT/2TOEvNMMKbDI+wgDxSSF+9vo7utbcf4+qjQI
         rjug==
In-Reply-To: <1474324.CcTjzLnQHn@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>, reiserfs-devel@vger.kernel.org


On 10/21/2014 12:39 AM, Ivan Shapovalov wrote:
> On Monday 20 October 2014 at 12:54:13, Edward Shishkin wrote:	
>> On 08/17/2014 11:52 PM, Ivan Shapovalov wrote:
>>> [...]
>>> +		/*
>>> +		 * Grab some sane amount of space.
>>> +		 * We will allocate blocks until end of the partition or until
>>> +		 * the grabbed space is exhausted.
>>> +		 */
>>> +		ret = reiser4_grab_reserved(super, 0, BA_CAN_COMMIT | BA_SOME_SPACE);
>>
>> reiser4_grab_reserved() grabs space from the reserved area (5%).
>> This is needed to make sure that unlink(), truncate(), etc. won't
>> fail, if there is no free space on disk. I don't think that FITRIM
>> ioctl needs this reserved area.
> Well, IIUC, it doesn't hurt:


"doesn't hurt" is not enough. If you want to take a resource,
you should be going to explain, why do you need this.


>   any "legitimate" user of the reserved space
> will block on the mutex and eventually proceed. At the same time, given
> a filesystem with (5% + eps) free space left, not using the reserved space
> will result in trimming of (eps) blocks at a time.
>
> Anyway, I should also fix calculation of space to grab in 1/9: if BA_RESERVED
> is not set, then the amount to grab should be calculated as 25% of non-reserved
> free space, not as 25% of all free space...
>
>> If BA_SOME_SPACE is set, then you lock a superblock, and grab 25% of
>> the current free space. It means that your grab will always succeed,
>> so that BA_CAN_COMMIT flag is also not needed.
> If we decide on dropping BA_RESERVED, then you're right here;
> reiser4_grab(...BA_SOME_SPACE...) won't return ENOSPC and so this is pointless.
>
> If we decide on keeping BA_RESERVED, then this should also stay in order not to
> trigger the assertion.
>
> Thanks,

