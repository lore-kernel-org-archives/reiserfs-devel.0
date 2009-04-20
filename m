From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: 2.6.30-rc2: reiserfs_delete_xattrs: Couldn't delete all xattrs 
	(-13)
Date: Mon, 20 Apr 2009 18:25:05 +0400
Message-ID: <a4423d670904200725x69d28139h812524390c6de8e5@mail.gmail.com>
References: <a4423d670904161223r2e026b6u903137c709318551@mail.gmail.com>
	 <49EC8317.9080300@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=XQbwPCRskgs10rCaQp4546QWoehirIoRWnnHdp6C0o4=;
        b=fjsJuTImrHr3p+GaB2BFbHlkMzN7b4O5ReRtJgXxbTbLDmsRb6CCxUa8gqN9mEoLfK
         OBvgjNKCn5z6a1ymF3WCC09Pa1bdF9PMyjji7H2to1+MookyBZoTi5K8fEJihBI5D771
         dOj29CkXahA3BAAr0gmxYIFHtlszXrCIBKfhA=
In-Reply-To: <49EC8317.9080300@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Jeff Mahoney <jeffm@suse.com>
Cc: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>

2009/4/20 Jeff Mahoney <jeffm@suse.com>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Alexander Beregalov wrote:
>> Hi Jeff
>>
>> The kernel prints this message every 20seconds
>> [ =C2=A0836.973100]
>> [ =C2=A0836.983494] REISERFS warning (device sda2): jdm-20004
>> reiserfs_delete_xattrs: Couldn't delete all xattrs (-13)
>> [ =C2=A0836.983496]
>> [ =C2=A0894.203634] REISERFS warning (device sda2): jdm-20004
>> reiserfs_delete_xattrs: Couldn't delete all xattrs (-13)
>> [ =C2=A0894.203636]
>> [ =C2=A0894.205784] REISERFS warning (device sda2): jdm-20004
>> reiserfs_delete_xattrs: Couldn't delete all xattrs (-13)
>>
>> commit a41f1a4715
>>
>> CONFIG_REISERFS_FS=3Dy
>> # CONFIG_REISERFS_CHECK is not set
>> # CONFIG_REISERFS_PROC_INFO is not set
>> # CONFIG_REISERFS_FS_XATTR is not set
>>
>> I did not enable XATTR before,
>> should I enable it now ?
>
> You shouldn't need to, and you shouldn't be seeing those messages.
>
> What are you doing to reproduce it? I disabled the xattr config optio=
n,
> copied a directory tree over and removed it. I didn't see anything.
Just regular work. For example kernel compiling.
I see that messages on 2 of 3 systems (x86 and parisc). The third
system is x86 also,
no messages at all. I do not know how to "switch" messages on.
Let me know if I can help, perhaps dump superblock or something.
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
