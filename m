From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 + loop + NFS = disaster.
Date: Sun, 22 May 2011 13:04:49 +0200
Message-ID: <4DD8EDD1.7040401@gmail.com>
References: <4DD7E3C9.3030103@gmail.com> <4DD7E8D0.2090300@gmail.com> <4DD87F64.2040407@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :cc:subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=dNFgbb9VxBi7e2CQ5McbotnoRsDzzK6JSlHBxItg7+I=;
        b=G+GIv3iHckGwnuXCoCi6xTj6nPzkQIKrUv4OP5Cq330PqTNv0mCZXm0GyTOduY9ODG
         RTyuN8mhHAiS72wCDBUax3yFzPPX+0kGjufmh3WavD/LnDfM+dTJOxZaOGNfSbbXsYhl
         9zswe54v3wV9c5lLR/AsiUHGxy3M+TYm3rgR0=
In-Reply-To: <4DD87F64.2040407@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: dE <de.techno@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 05/22/2011 05:13 AM, dE wrote:
> On 05/21/11 22:01, Edward Shishkin wrote:
>> On 05/21/2011 06:09 PM, dE wrote:
>>> I've been trying to loop mount reiser4 which resides on a file on an
>>> exported NFS partition, it mounts fine but when copying a lot of small
>>> files inside a complex directory tree everything just hangs all of a
>>> sudden, in fact the whole share hangs. Any operation on the share
>>> (including bash completion) will hang bash (or in that case any
>>> application) completely.
>>>
>>> Doing the same will work with any other FS. Parameters for reiser4 -
>>
>> which kernel is on NFS server?
>>
>> Thanks,
>> Edward.
>>
> 2.6.32-debian.

Could you please upgrade to the latest one (.38)?
I remember there were some problems with loop
devices over reiser4 files that have been fixed.

Thanks,
Edward.


  Client is 2.6.37-zen (Gentoo)
>>>
>>> create=ccreg40,compress=gzip1,compressMode=force,fibration=lexic_fibre,formatting=tails

"formatting=tails" makes sense only for default file plugin (creg40).

Thanks,
Edward.
