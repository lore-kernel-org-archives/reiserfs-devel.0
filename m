From: Anders Aagaard <aagaande@gmail.com>
Subject: Re: Reiser4 on dmcrypt
Date: Fri, 15 Aug 2008 23:20:20 +0200
Message-ID: <48A5F314.8080601@gmail.com>
References: <48A59695.5030701@gmail.com> <48A5A446.1000106@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=yMcNBxYbKFrqfHP4XX+Ol4LO6Qqpl9P3UYEdDPyMSxU=;
        b=pVkpbl2TMbKk8fTxolCmWjVJcr/KSPnnAimOI+5c8hj/gRbPog7oGuFFKrXzSvAva9
         xfm/aCF2oCPnQnH7aNqO5NnyCoF+neWQyTHT+oZt7O19rM94ytP+iNhhuP9zKsNwBlcq
         Zak7xrQGN/1L/8FsYgqbmqj3K+X8t2ARLXzas=
In-Reply-To: <48A5A446.1000106@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-devel@vger.kernel.org

Edward Shishkin wrote:
> Anders Aagaard wrote:
>> Hi
>>
>> Been trying to move my home directory over to reiser4, and I ran into
>> some issues, this is what I did:
>>
>> PASSCODE="temptest"
>> echo $PASSCODE | cryptsetup luksFormat /dev/sdf6 -c
>> twofish-cbc-essiv:sha256 -s 256
>> echo $PASSCODE | cryptsetup luksOpen /dev/sdf6 tempHome
>> mkfs.reiser4 -o create=ccreg40,compress=lzo1 /dev/mapper/tempHome
>>
>> mount -t reiser4 -o noatime /dev/mapper/tempHome /mnt/x
>>
>> rsync -vax --progress /home/neuron/ /mnt/x/
>>
>> During rsync I noticed this in top while moving over a virtualbox image:
>>   PID USER      PR  NI  VIRT  RES  SHR S %CPU %MEM    TIME+  COMMAND
>>  2427 root      20   0     0    0    0 R  100  0.0  14:32.01 pdflush
>>  9497 root      20   0     0    0    0 R  100  0.0  11:38.48 rsync
>>
>> It did continue, but I figured something was wrong, so I interrupted
>> the rsync and unmounted.  The rsync reported my copy speed was down to
>> 3-4mb/sec.  This is on a fairly new quad core, so I should be able to
>> encrypt and compress the data without difficulty.
>>
> 
> Yeah, something goes wrong..
> Would you please try default (reg40) plugin in the same configuration?


That does work, although the performance reported by rsync seems very 
unstable (although that could be a lot of issues), varying between 10 
and 25mb/sec.  Note that I do not have the patch to enable write 
barriers on single dm devices, so it's running in "synchronous write", I 
will try with that patch aswell though.

> 
> Thanks,
> Edward.
> 
>> I remounted and started again, it starts by coping at 14-15mb/sec, and
>> then just slows down as pdflush hits 100% cpu usage.  Iowait also goes
>> down to around 5%.  When I interrupt it pdflush disapears instantly,
>> and rsync sticks around for 10-15 seconds (making it unmountable for
>> that period) until it dies.
>>
>> The file it's having problems with is a 6.8gb virtualbox image I use
>> as a gentoo test enviroment.
>>
>> Anders Aagaard
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe
>> reiserfs-devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> 
> 

