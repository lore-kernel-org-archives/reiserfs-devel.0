From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [RFC] [PATCHv3 7/9] reiser4: batch discard support: actually
 implement the FITRIM ioctl handler.
Date: Tue, 21 Oct 2014 18:21:56 +0200
Message-ID: <54468824.8060402@gmail.com>
References: <1408312379-1990-1-git-send-email-intelfx100@gmail.com> <1474324.CcTjzLnQHn@intelfx-laptop> <544631EA.6090502@gmail.com> <4858515.SiX86K8HSN@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=2mBFdk1+AEcq7/94C+aie2DZ+LBOxtFj7WJAobZVoqU=;
        b=ycQqagbxyl2uvYz0y3TMXhvtHTHWyjhPRlM0HNgfItUsh1F7ZYIiMoI/eRdUP7NyeY
         /zyueA/1wefC76cug0Pym+qjppwBdySBro9Z4knMJKgrHyZdivd07iUXD8ob5wAeRj+a
         w+UzOo0a5y+tGOauXU1sx4Cq8Qux+VpbJY/fDq/I8jTWHseIxZoTcWYEpxPxY5guvA+6
         yCFHIQcX0LGcxSg1JMIn+SyGOCzKtrKMTRPaTlyB4E6+0soqVC1kec2MMxBVoVGXCqVq
         MkT0mqbRlsGSPiSyPQCztgUG0/iLZqTtAwb3U9PpqOKeJngn3qskXIWfnS0Cf4e3y3T5
         W+aQ==
In-Reply-To: <4858515.SiX86K8HSN@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 10/21/2014 06:18 PM, Ivan Shapovalov wrote:
> On Tuesday 21 October 2014 at 12:14:02, Edward Shishkin wrote:	
>> On 10/21/2014 12:39 AM, Ivan Shapovalov wrote:
>>> On Monday 20 October 2014 at 12:54:13, Edward Shishkin wrote:	
>>>> On 08/17/2014 11:52 PM, Ivan Shapovalov wrote:
>>>>> [...]
>>>>> +		/*
>>>>> +		 * Grab some sane amount of space.
>>>>> +		 * We will allocate blocks until end of the partition or until
>>>>> +		 * the grabbed space is exhausted.
>>>>> +		 */
>>>>> +		ret = reiser4_grab_reserved(super, 0, BA_CAN_COMMIT | BA_SOME_SPACE);
>>>>   any "legitimate" user of the reserved space
>>>> will block on the mutex and eventually proceed. At the same time, given
>>>> a filesystem with (5% + eps) free space left, not using the reserved space
>>>> will result in trimming of (eps) blocks at a time.
>>>>
>>>> reiser4_grab_reserved() grabs space from the reserved area (5%).
>>>> This is needed to make sure that unlink(), truncate(), etc. won't
>>>> fail, if there is no free space on disk. I don't think that FITRIM
>>>> ioctl needs this reserved area.
>>> Well, IIUC, it doesn't hurt:
>>
>> "doesn't hurt" is not enough. If you want to take a resource,
>> you should be going to explain, why do you need this.
> I've explained the reason below... isn't it sufficient?


Sorry, but I don't see any explanation.

Thanks,
Edward.
