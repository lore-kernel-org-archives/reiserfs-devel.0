From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: [PATCH] kill-the-bkl/reiserfs: Fix induced mm->mmap_sem to 
	sysfs_mutex dependency
Date: Tue, 29 Sep 2009 14:22:42 +0400
Message-ID: <a4423d670909290322u4c1dd886tf55a2ea4a4a0977@mail.gmail.com>
References: <1251167570-5233-1-git-send-email-fweisbec@gmail.com>
	 <20090826201330.GA18761@orion> <20090914203749.GF6045@nowhere>
	 <a4423d670909141433g18659aay6e177b1302e5b4a0@mail.gmail.com>
	 <20090916203747.GB5068@nowhere>
	 <a4423d670909161637r67c933a0n2c142898ea493f22@mail.gmail.com>
	 <20090917050639.GA5060@nowhere>
	 <a4423d670909220655j37cc49f8rcd29d8f154c5e6e6@mail.gmail.com>
	 <20090929074640.GA5233@nowhere>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=B4lXQo2Oz03+nae8udrJ9Md5n4c9SyR3CtoGI5jrlG4=;
        b=gTbxGvc2M/IGbbnTdkf11zFIj++n1GIDfJl82ggjvtFmLo6ibxCUB2ns2GxZjsIJQx
         l1jHyC50jXsQBvU9sFzR2UtTvYtLwmeUNeXnZka7PYwEAPAkDH6DAjI6cNpRlTzdpvCn
         ktv/RHzhMTWzcZzWSQ7LwOu6AQnq44unrDCKM=
In-Reply-To: <20090929074640.GA5233@nowhere>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Frederic Weisbecker <fweisbec@gmail.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Reiserfs <reiserfs-devel@vger.kernel.org>

2009/9/29 Frederic Weisbecker <fweisbec@gmail.com>:
> On Tue, Sep 22, 2009 at 05:55:43PM +0400, Alexander Beregalov wrote:
>> Hi Frederic.
>>
>> Another very similar warning.
>> (smp 2*2core)
>> v2.6.31-7068-g43c1266 plus 193be0ee1 kill-the-bkl/reiserfs: Fix
>> induced mm->mmap_sem to sysfs_mutex dependency
>>
>>
>> [ INFO: possible circular locking dependency detected ]
>> 2.6.31-07095-g25a3912 #4
>> -------------------------------------------------------
>> udevadm/790 is trying to acquire lock:
>> =C2=A0(&mm->mmap_sem){++++++}, at: [<c1098942>] might_fault+0x72/0xc=
0
>>
>> but task is already holding lock:
>> =C2=A0(sysfs_mutex){+.+.+.}, at: [<c110813c>] sysfs_readdir+0x7c/0x2=
60
>>
>> which lock already depends on the new lock.
>
>
>
> Yeah indeed, it's about the same kind of thing.
> Could you please test the following patch?

Thanks, the warning has gone away.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
