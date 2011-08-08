From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: rebuild-tree fails on large volume
Date: Tue, 09 Aug 2011 01:08:29 +0200
Message-ID: <4E406C6D.9010109@gmail.com>
References: <4E3A7945.9090404@i4yoo.de> <alpine.DEB.2.01.1108052344150.9183@trent.utfs.org> <4E3CE7ED.2090909@suse.com> <4E404155.7050706@suse.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=WoA1svv8TwRTj5qi5r8Yp+o6X+iW0qzfnmY/JMkThVQ=;
        b=B1GVFDVFoXj8jxJX4Vhx9bdkzO6zDHNvKZWqAebFFMB+M+W8jottlzTcRgBvVi1K2h
         sPp/r0lbIzZNG8R1lb1LZgBpx0JmE9v2uc/a0k6y5OsskZ9cg2YbCOxMQfemkc+ItC/Y
         0Lv4cJLabCY0SAcrMN9G3dv5MqUDiD3FEa+W8=
In-Reply-To: <4E404155.7050706@suse.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.de>
Cc: Christian Kujau <lists@nerdbynature.de>, Carsten Ralle <cr@i4yoo.de>, reiserfs-devel@vger.kernel.org

On 08/08/2011 10:04 PM, Jeff Mahoney wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 08/06/2011 03:06 AM, Jeff Mahoney wrote:
>> On 08/06/2011 02:47 AM, Christian Kujau wrote:
>>> On Thu, 4 Aug 2011 at 12:49, Carsten Ralle wrote:
>>>> http://www.spinics.net/lists/reiserfs-devel/msg02679.html
>>>>
>>>> I looked all over the place but couldn't find any infos about
>>>> the version to patch.
>>>
>>> The patch applies cleanly to reiserfsprogs-3.6.21[0].
>>>
>>> @Jeff: will the patch be applied to the next (?) reiserfsprogs
>>> release?
>>>
>>> Thanks, Christian.
>>>
>>> [0] https://www.kernel.org/pub/linux/utils/fs/reiserfs/
>>
>> I don't actually maintain reiserfsprogs unless the openSUSE version
>> has now become the official one. I've been meaning to get back to you
>> about this but it's been a rough week.
>>
>> -Jeff
>>
>
> Attached is the patch I use for large file systems.


Great.
It seems we'll release 3.6.22 near Christmas.
I also have something to push to reiser4progs...

Thanks,
Edward.
