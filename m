From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: [BUG] Big fiability issue?
Date: Wed, 6 Apr 2016 18:32:04 +0200
Message-ID: <57053A04.5020501@gmail.com>
References: <5703DD31.50604@gmail.com>
 <20160406092540.abbb5f64954b9ca3d18c6b95@korinar.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=hjKYR7do/IfhIa+w+lZaryfQyMS2Znx4ZRzeQwqhjj8=;
        b=I2Vex+ntiP2LGR7lWjandiYmcoyw1hT4HQorox2oI8BLtQkub+JF9+u7312Gp5Dkcs
         MgSt330y1wHggi9BE5PVp1cKgKbVm2MnloNTBcMuVc2qkD9Jmk7uxRLU5mGJQxAS6x/G
         DNQ9x31pMq9msXKtEeYfUL4AK/+EWXyyVfBAQCEW/JiaOLSY/zUBjZy9B7oyvL7uqD9P
         WasdzxcbTZ79kGpl2lG2RvHKPnDknGNfGQKOrNOEZl7XiWYKF4EONWMFvYUHeD7I/z9X
         2ByHeYEuBMWkQwGvxGKAruljGIwpggCvocz1RB+xvzfBd12G5Itys7LoZtGedp5GZ2Rm
         POUA==
In-Reply-To: <20160406092540.abbb5f64954b9ca3d18c6b95@korinar.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mathieu Belanger <admin@korinar.com>
Cc: =?UTF-8?Q?Mathieu_B=c3=a9langer?= <b747xx@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>



On 04/06/2016 04:25 PM, Mathieu Belanger wrote:
> Well, I did boot systemrescuecd to fsck my /dev/sda2 and mount it ro to
> do the backup and I was able to get all the data back but with a bonus :
> I can mount the fscked /dev/sda2 in rw on systemrescuecd, the corruption
> don't come back. SystemrescueCD is based on Gentoo I think. But the one
> I got got a 3.18 kernel.


Please, mount it with "no_write_barrier" option on all kernels older
than 4.5.1 (not yet released). Horrible name, of course: this should
sound like "no_block_write_barrier", or something like this, but it is
too late to fix...

Thanks,
Edward.


>   I did manually compile the latest tools to be
> sure and a got an error because 3.18 support format40 4.0.0, not 4.0.1
> but that error did not affect me.
>
> I will do more test with that "corrupt" partition before restorating
> the backup.
>
> On Tue, 5 Apr 2016 17:43:45 +0200
> Edward Shishkin <edward.shishkin@gmail.com> wrote:
>
>> Hello Mathieu,
>>
>> I found that by default reiser4 still relies on a block layer feature,
>> which is not longer supported. This is so-called "barriers". And yes,
>> on the power outage bad things are bound to happen. However, it
>> is up to bad luck.
>>
>> The attached patch removes the rest of block barriers support in
>> reiser4. So, now we honestly wait for IO completion of wandered
>> blocks (overwrite set) before submitting a journal header (journal
>> footer).
>>
>> Not sure if it will address your problem though. Also, data corruption
>> after rw-mounting of checked (rebuild-fs) partition is still a concern.
>>
>> Thanks,
>> Edward.
>

