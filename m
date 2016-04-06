From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [PATCH] reiser4: port for Linux-4.5
Date: Wed, 6 Apr 2016 17:21:41 +0200
Message-ID: <57052985.8000905@gmail.com>
References: <56FB9A57.3040906@gmail.com>
 <1459903365.31752.2.camel@intelfx.name>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding;
        bh=MFO7VOSD6SObDUVfMAhzZ7QFqaxyVsajgswq8LiPx0k=;
        b=U/NR+My4MvLgP4YGtghaEP4Fx8xl7wJ3cCKQTNkrqAwelxDguraFuOFNR/M3sVYAag
         xD1rVmzDLNoQDDplO16YkwyAXer2gc5HEktIPEplv5VbbapSSyX8brQzigbHcskFqxV3
         6EoUj2m8ZTP70w0JPISJOiDDb0LFCpsFs03ketgJZHJ9j2h+qyqyxnOSZtGkbmNHp4Co
         7G/wXPM2m38zi/3iOKqtC6j5LqgHra2FiMic7Pa3PhfFBfyT1XJ8s8QJLYUWlzrP5+et
         x1lKfT9GKtmf8oCprGkqWhp3xNUoEn3QXcXDulUWf8Cfex7cCrGx/9viGrBwnc1HaN+P
         OERA==
In-Reply-To: <1459903365.31752.2.camel@intelfx.name>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: intelfx@intelfx.name, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Which "adjustments" do you mean?


On 04/06/2016 02:42 AM, Ivan Shapovalov wrote:
> On 2016-03-30 at 11:20 +0200, Edward Shishkin wrote:
>> . Adjust for the new ->get_link() of vfs's inode_operations: we don't
>>     support RCU mode;
>> . check returned value of __copy_from_user() to make gcc happy
>>     (the path is never invoked) in create_item_node40().
>>
>> Signed-off-by: Edward Shishkin <edward.shishkin@gmail.com>
> Hi Edward,
>
> could you please send a separate patch with adjustments for 4.4?
>
> Thanks,

