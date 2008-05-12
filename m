From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Check for ccreg40
Date: Tue, 13 May 2008 03:05:43 +0400
Message-ID: <4828CD47.7000001@gmail.com>
References: <4bd33c39b3698590d11cc9709fbb08a1@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4bd33c39b3698590d11cc9709fbb08a1@free.fr>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: geearf@free.fr
Cc: reiserfs-devel@vger.kernel.org

John wrote:

>Hello,
>
>is there a way to check if I enable ccreg40 when I created my partition?
>  
>

debugfs.reiser4 -t /dev/xxx | grep reg40

The first found string will show if it was formated by reg40 (default) 
or ccreg40 option.

>I do not remember anymore what I did with the big partition, and hope I did it but...
>
>So
>1- Is there a way to check that?
>  
>

So yes, it is (the ugly one for now..)

>2- If I forgot is there a way to fix that without mkfs and therefore needing to copy my data elsewhere?
>  
>

What do you want to fix?

Thanks,
Edward.
