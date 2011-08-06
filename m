From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: rebuild-tree fails on large volume
Date: Sat, 06 Aug 2011 10:09:43 +0200
Message-ID: <4E3CF6C7.1090300@gmail.com>
References: <4E3A7945.9090404@i4yoo.de> <alpine.DEB.2.01.1108052344150.9183@trent.utfs.org> <4E3CE7ED.2090909@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-type:content-transfer-encoding;
        bh=nJHTvsGBf5KOcSOay1KF3Y8Bs6YiBqutq9yfrR2Y6PM=;
        b=h8Ije++92DeBlQ1fuVIAxNByGRTv/zciIh2oxlVrkBFma28KqQuP2robLWOxQZUKZG
         oTLvsEwoaDHXJ8e3vBZkFU1YQysKX4igmgaDh3GaEZ0ash18jOJcF7D5G3tzjMhLqizt
         uMUrOlVqG5+yWAdOgnmjLjFIniQZU1wGHrjGs=
In-Reply-To: <4E3CE7ED.2090909@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Christian Kujau <lists@nerdbynature.de>, Carsten Ralle <cr@i4yoo.de>, reiserfs-devel@vger.kernel.org

On 08/06/2011 09:06 AM, Jeff Mahoney wrote:
> On 08/06/2011 02:47 AM, Christian Kujau wrote:
>> On Thu, 4 Aug 2011 at 12:49, Carsten Ralle wrote:
>>> http://www.spinics.net/lists/reiserfs-devel/msg02679.html
>>>
>>> I looked all over the place but couldn't find any infos about the
>>> version to patch.
>>
>> The patch applies cleanly to reiserfsprogs-3.6.21[0].
>>
>> @Jeff: will the patch be applied to the next (?) reiserfsprogs release?
>>
>> Thanks,
>> Christian.
>>
>> [0] https://www.kernel.org/pub/linux/utils/fs/reiserfs/
>
> I don't actually maintain reiserfsprogs unless the openSUSE version has
> now become the official one. I've been meaning to get back to you about
> this but it's been a rough week.


What's up Jeff? You are writing btrfsck? :)
