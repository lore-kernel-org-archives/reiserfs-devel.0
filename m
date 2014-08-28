From: Matt <jackdachef@gmail.com>
Subject: Re: linux-3.16.2 queue (3.16.1+)
Date: Thu, 28 Aug 2014 21:18:17 +0200
Message-ID: <CAG-aW07Lx=WOEf+j=_+G5T57uzhvKiP3-ZpaadKvoafW=iJKrw@mail.gmail.com>
References: <CAG-aW06Q9VVyW-atZEsURs0rfjysdEbxb_dC4Tm3K-tZg++tQg@mail.gmail.com>
	<20140828152205.GA18432@kroah.com>
	<CAG-aW05qkQKgntBM87XHSMECjD-GMjeRt+m0-0CkezBG_weCOg@mail.gmail.com>
	<20140828153252.GA18868@kroah.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=bf2Q9KRxQ8c3pV5Gd1n5W8VKa7cf5EQ9aRmLjm2U+j0=;
        b=SmLnucIuhlHVHCeCgYkbtysSonSZUnTuOFnyCAKK28z5mpfVmchwtm5Qg60/shbCMl
         3TUbwfg1Jg5efU8QCKVtaBPEIQZFVZ1+Y3aVsKO3ZK92wYB2gvniKV+RH0PtyoiEgLEO
         Z5rONFjoJtxZq7ZZjMQegLXRlylxKpC4JA/XyYXWURL69NVaS7weeZw3R3Wb5dK3WVBV
         366YhQZxFZzggbzd2JXqIi9oYIVjirqmfTpkaF8EK5QJB9ctyDXaFXWynPsMxEowOoAf
         FGmIP9Py3kVRztk1pgByoBHM9pKi9zDpSW1TPp9aKKXdiEoTi8qZSuTOdkI7FDMERDsA
         3B+Q==
In-Reply-To: <20140828153252.GA18868@kroah.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

On Thu, Aug 28, 2014 at 5:32 PM, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Thu, Aug 28, 2014 at 05:27:27PM +0200, Matt wrote:
>> On Thu, Aug 28, 2014 at 5:22 PM, Greg KH <gregkh@linuxfoundation.org> wrote:
>> > On Thu, Aug 28, 2014 at 05:16:58PM +0200, Matt wrote:
>> >> Hi Greg,
>> >>
>> >>
>> >> please consider adding the following 2 patches to 3.16.2:
>> >>
>> >> Jan Kara (1):
>> >>       reiserfs: Fix use after free in journal teardown
>> >>
>> >> Jeff Mahoney (1):
>> >>       reiserfs: fix corruption introduced by balance_leaf refactor
>> >>
>> >>
>> >>
>> >> Reason/Related:
>> >>
>> >> https://bugzilla.kernel.org/show_bug.cgi?id=83121
>> >>
>> >> https://bugzilla.kernel.org/show_bug.cgi?id=83321
>> >>
>> >> http://forums.gentoo.org/viewtopic-t-998538-postdays-0-postorder-asc-start-0.html
>> >>
>> >>
>> >> Many thanks in advance
>> >
>> > I need git commit ids of these patches in Linus's tree, can you provide
>> > those please?
>> >
>> > thanks,
>> >
>> > greg k-h
>>
>>
>> Sure:
>>
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=27d0e5bc85f3341b9ba66f0c23627cf9d7538c9d
>> reiserfs: fix corruption introduced by balance_leaf refactor
>>
>>
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=01777836c87081e4f68c4a43c9abe6114805f91e
>> reiserfs: Fix use after free in journal teardown
>>
>>
>>
>> are checkpatch warnings usually also fixed within stable releases ?
>
> No, not at all, please read Documentation/stable_kernel_patches.txt for
> what is acceptable for stable kernel patches.
>
> thanks,
>
> greg k-h


okay, will do

thanks for pointing that out


Regards

Matt
