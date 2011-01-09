From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Negative blocks in rebuild-tree
Date: Sun, 09 Jan 2011 01:58:16 +0100
Message-ID: <4D290828.8050304@gmail.com>
References: <4D28674A.60603@keff.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=hmuArpJbki69nTb0qkVLLFk+QORhYhJ5VYPwHfgb57A=;
        b=cZ+gU8oqtrdITsSKZNkz7wRiQB8ADOt4rCNnlpj3mOaek4SBHwT35bhXA650Ov2Pno
         RgiQSE5H7ZlsAiIq4lICRVm5WNwH09E9RDolp4BR637DK1lMhvwc24xHiRShqkTBMKQU
         x4sHgzll/OggnSsfnQFjkuClFRyKqHTz9bf8s=
In-Reply-To: <4D28674A.60603@keff.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Sebastian Hyrwall <sh@keff.org>, Jeff Mahoney <jeffm@suse.com>
Cc: reiserfs-devel@vger.kernel.org

On 01/08/2011 02:31 PM, Sebastian Hyrwall wrote:
> Hi

Hello.

>
> I am getting a negative block-number with reiserfsck when doing
> --rebuild-tree -S (or without -S). This causes a segmentation fault
> later (pass 2) in the check because it tries to read a "non-existant
> block". My rebuild takes 3 days and i didn't copy the stdout-info the
> first time so I will post some more info as soon as it becomes available.
>
> Pass 0:
> ####### Pass 0 #######
> The whole partition (-710934672 blocks) is to be scanned
> Skipping 117586 blocks (super block, journal, bitmaps)


So you do have a ~16T partition. Correct?


  -711052258 blocks


> will be read
>
> Does anyone have any idea on how to fix this?
>
> On a 64-bit system.


It looks like you have encountered an overflow/truncation fsck bug 
specific to giant volumes.

I would first ask Jeff: AFAIK he is planning to enable 16T files
in reiserfs.
Jeff, do you have any non-published fixups for such problems?

Thanks,
Edward.


>
> Sincerely,
> Sebastian H
> --
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html

