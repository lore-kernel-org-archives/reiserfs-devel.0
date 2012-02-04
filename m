From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: command 'mount /dev/sdc /media/disk2' failed after fsck.reiser4
 --build-fs /dev/sdc
Date: Sat, 04 Feb 2012 16:13:04 +0100
Message-ID: <4F2D4B00.9060000@gmail.com>
References: <eb15abdb129343708952e5616ec0e8df@mail.velocitynet.com.au> <op.v8t5gqschogzsi@g17b> <3810d7a879b20a2003ac2e1cecd026da@mail.velocitynet.com.au> <4F25649B.7030309@gmail.com> <69e7bb2502ecd3951f2b7c72fe092a06@mail.velocitynet.com.au> <4F279D42.60708@gmail.com> <969c482756fd4751ecd068f39132c524@mail.velocitynet.com.au> <4F27F2BA.8090300@gmail.com> <4a0ae9e43af128af1546a6c14bb5add3@mail.velocitynet.com.au> <5930d524cbeb70f029e65542dab5495b@mail.velocitynet.com.au> <4F296BDE.2010902@gmail.com> <17c09724dbb7deeb11a6f40b3fd34ee0@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=QO/4RbYs6DYXQ9yRDZJZeqsr5WXiR0mj0+RLe/9mo4c=;
        b=f93T+rYNb71fTSUKbgh9AIpYd6ulEn9px2KfgsIZvRr8Mmv/vCUs8joC9I/fqA80cR
         HOOQ11nyiW27A3fdAneqwly47azN7ecig6CLKK6OAmQ/VzdO1HvWOvJcxmF/ryf6/dVJ
         S28RwM/cOHmGJy8JwNe7xoSJFOgtE2+86HN68=
In-Reply-To: <17c09724dbb7deeb11a6f40b3fd34ee0@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: doiggl@velocitynet.com.au, ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On 02/04/2012 03:12 PM, doiggl@velocitynet.com.au wrote:

[...]

> Hello,
> I am just trying to to find a free file sharing service to share as the
> file its on the large side, I am still looking.
> If there are any free sites file to handle large files, that would be
> handy to know.
> It looks like it will a long time to upload once a transfer site site is
> found.
> Glenn
>
> File details
> 3,133,918,605  meta.gz
>


Again, please, don't use large volumes.
There is no production support team for reiser4.
The smaller volumes, the more chances that things will
be fixed.

Edward.


> # md5sum meta.gz
> 41c2ad7cf10c90fa73a287d1f2ddaef3  meta.gz
