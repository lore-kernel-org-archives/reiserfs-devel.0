From: dE <de.techno@gmail.com>
Subject: Re: reiser4 + loop + NFS = disaster.
Date: Sun, 22 May 2011 08:43:40 +0530
Message-ID: <4DD87F64.2040407@gmail.com>
References: <4DD7E3C9.3030103@gmail.com> <4DD7E8D0.2090300@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=UBAilEZy9TXLrqul5IWmUxKK7qRm+JDY3AuLLb01ZkA=;
        b=vIV7BcZndWVMlFr9+94Iwve1F6H/LjD+ECrdGy+73pSOwZZgyXeS+ibhU7vWd5iCnc
         K4c7LF2dnQZPHRLEbdcK1pTuJAZw5q3/xxu4KiAQiqX/JLgz5TBvaASDVQN43DYZK6N1
         xE/yOY9UrYZNtqCBrxwOO1VxbG32D8KrCIT3M=
In-Reply-To: <4DD7E8D0.2090300@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

On 05/21/11 22:01, Edward Shishkin wrote:
> On 05/21/2011 06:09 PM, dE wrote:
>> I've been trying to loop mount reiser4 which resides on a file on an
>> exported NFS partition, it mounts fine but when copying a lot of small
>> files inside a complex directory tree everything just hangs all of a
>> sudden, in fact the whole share hangs. Any operation on the share
>> (including bash completion) will hang bash (or in that case any
>> application) completely.
>>
>> Doing the same will work with any other FS. Parameters for reiser4 -
>
> which kernel is on NFS server?
>
> Thanks,
> Edward.
>
2.6.32-debian. Client is 2.6.37-zen (Gentoo)
>>
>> create=ccreg40,compress=gzip1,compressMode=force,fibration=lexic_fibre,formatting=tails 
>>
>>

