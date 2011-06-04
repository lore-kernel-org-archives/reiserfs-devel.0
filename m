From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: how can I identify  un-corrupted files on r4 partition
Date: Sat, 04 Jun 2011 11:59:13 +0200
Message-ID: <4DEA01F1.2010201@gmail.com>
References: <16a1726a0dbbb9ffa9fe7758d2b04b81@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=Z+jJjPym9M0zESR0LMjDOBHbWzQFx1C0dp+CIAHKxHs=;
        b=Qm9VfxbJzhnhrUF1UdJ6wn7kOj41h6b8TkCsBdVQ5/6rkQZiIHNpowAb0p9RpEjoey
         DkMOOduZvhQDWw+UHzETvdr3r3ULUurHUkyLkb3r027XSS6QO7TBtNJmPWK8bv7cxLA6
         5uRk8GQhUTJh8Jt3ppWJRf1/+OR0zHpYCnzx0=
In-Reply-To: <16a1726a0dbbb9ffa9fe7758d2b04b81@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On 06/04/2011 08:31 AM, doiggl@velocitynet.com.au wrote:
> Hello,

Hello.

> How can I list out files on a reiser4 partition which are ok to copy to
> another partition?

There is no tools which provide such statistics.

> i.e the ones with NO corruption in metadata or on disk.
> The partition has a mixture of corrupted and un-corrupted files.
>
> I plan to copy the  files off which are ok  , then reformt the disk.
>
> How can that be done ?

Run fsck on the partition, then copy and reformat.

Thanks,
Edward.
