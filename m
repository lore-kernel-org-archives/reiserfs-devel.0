From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: How can checksums (node41) be of real help?
Date: Tue, 24 May 2016 15:45:55 +0200
Message-ID: <5310185d-c358-f5aa-9309-9d40daff90ad@gmail.com>
References: <c7519dd1-871e-9dab-9bac-2d8aa1ee1951@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=subject:to:references:from:cc:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=BabJ8En44oLOMytCAiZE71/y2tcdr556FM6W21CP74Q=;
        b=vCIzw/f0opX6pQ4k5tzkKpeGrqkl01ejF5w/FnT9AtEo8hcWdloqYpm0nohD01ck0u
         ljNO2NpT9ArHNiZhlQK4doI6tTKazFmnoHoKVonRA+Q96H8e70eN7MWTBihS64ZaWVMH
         imLPRb+JqeqdTfsd0pFa3EofYrTv3zHU8QUieSIOUUyXsYDtojbuh+jQdm8bBROMKEFH
         I0o/Bc074F5noG3epG2XzqriSrtdkL0NF5mtNQqPWdwaamtguBOoIPaZDy3RC+3BRJ6X
         k8LzmO0eJh1wGYd9kzQyAapnvXgyzQoboPD7Uq/yy5lWyF2Qr8dq/nqCb+kXh8CwTdUG
         /BUA==
In-Reply-To: <c7519dd1-871e-9dab-9bac-2d8aa1ee1951@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Georgios Tsalikis <georgios@tsalikis.net>
Cc: Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

On 05/24/2016 12:01 PM, Edward Shishkin wrote:
> On 05/24/2016 10:50 AM, Georgios Tsalikis wrote:
>
> > I suppose they are great for discovering corrupted files, but is 
> there any way we can use them to retrieve a good copy of corrupted files?
>
> Hello,
>
> Currently if checksum verification failed, then the file system 
> becomes readonly
> with the suggestion (in kernel messages) to repair the partition with 
> fsck.
>
> Ofc, it is not convenient, but better than nothing. More efficient way 
> is to support replicas, so
> that every time when checksum verification failed, you upload 
> respective replica. It is not difficult
> to implement. Just allocate/release replicas simultaneously with 
> conventional formatted blocks.
> Pointers to replicas can be placed near the checksums (a new node42 
> format is needed).
> The patches 3.18.6-reiser4-add-node41-support.patch and 
> reiser4progs-1.0.9-add-node41-support.patch
> are a good example of how to add a new node format.


The cleanest option, however, would be to implement external mirrors in the
context of reiser4 logical volumes support, that I am currently working on.
So if you are patient, then wait for the announce of basic things (I 
think this
summer, but not sure).

Thanks,
Edward.
