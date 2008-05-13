From: John <geearf@free.fr>
Subject: Re: Check for ccreg40
Date: Tue, 13 May 2008 02:32:12 +0200
Message-ID: <4250f5aa6c29e06b78b2bb4eb81887d3@free.fr>
References: <4828CD47.7000001@gmail.com>
Reply-To: geearf@free.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4828CD47.7000001@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org



On Tue, 13 May 2008 03:05:43 +0400, Edward Shishkin <edward.shishkin@gmail.com> wrote:
> John wrote:
> 
>>Hello,
>>
>>is there a way to check if I enable ccreg40 when I created my partition?
>>
>>
> 
> debugfs.reiser4 -t /dev/xxx | grep reg40
> 
> The first found string will show if it was formated by reg40 (default)
> or ccreg40 option.
>>
> 
> So yes, it is (the ugly one for now..)
> 
>>
> 
> What do you want to fix?
> 
> Thanks,
> Edward.
> --

1- I did some tests on an empty partition and it is the same output in ccreg40 and reg40 so it is not working here.

2- I want a ccreg40 partition of course, but this is my biggest partition so if it is not I am in trouble to copy files somewhere else...

Thanks

