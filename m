From: Justin TerAvest <teravest@google.com>
Subject: Re: [PATCH] fixlet: Remove fs_excl from struct task.
Date: Mon, 11 Jul 2011 13:44:22 -0700
Message-ID: <CAN5ZDdfVEvxgwmRPwMVSq7iqTTaQ5fi5A-qtCsiqzTRjhOuL+A@mail.gmail.com>
References: <1308949107-1962-1-git-send-email-teravest@google.com> <20110624220240.GA6455@infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=google.com; s=beta;
	t=1310417086; bh=G4EgMo2KADF3RUrPeSkSIZTR6zQ=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type:Content-Transfer-Encoding;
	b=nNnJZ9AL/KlocaJ4RVgh/lM/NOMlBUcuDBz+7Y6smGfXwdUbPK5JryfsAiOv2+ier
	 b4pFU3iPbbl34jBLNHQmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=beta;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=RxugiRMI67TCO67BMjb41wR/7XcDO939G8jghQbiyQc=;
        b=eIkdWocyAJr4vySv+FgcdjLlJducOVt85AHVICkL5IuZKXzYKuFuuzFohV8QBrrWDF
         M2uYJDAOudm0vTYX6+GA==
In-Reply-To: <20110624220240.GA6455@infradead.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Christoph Hellwig <hch@infradead.org>
Cc: jaxboe@fusionio.com, viro@zeniv.linux.org.uk, jeffm@suse.de, tytso@google.com, mingo@elte.hu, peterz@infradead.org, linux-kernel@vger.kernel.org, reiserfs-devel@vger.kernel.org, linux-fsdevel@vger.kernel.org

Jens,

Have you had a chance to look at this? Christoph mentioned you'd
wanted to keep this,
but the last discussion I see is from 2009 and it doesn't look like
much has happened since then.


On Fri, Jun 24, 2011 at 3:02 PM, Christoph Hellwig <hch@infradead.org> =
wrote:
> On Fri, Jun 24, 2011 at 01:58:27PM -0700, Justin TerAvest wrote:
>> fs_excl is a poor man's priority inheritance for filesystems to hint=
 to
>> the block layer that an operation is important. It was never clearly
>> specified, not widely adopted, and will not prevent starvation in ma=
ny
>> cases (like across cgroups).
>>
>> I talked to Ted Ts'o about this, and he said that it used to used mo=
re
>> frequently in the 2.4 and prior versions of Linux, back when we were
>> first converting from the Big Kernel Lock to having subsystem level
>> locks, and so it made sense to use fs_excl when a process owned the
>> global fs mutex and was waiting for an I/O to complete, but it's no
>> longer used much at all, and filesystems have better ways to mark an=
 I/O
>> request as high priority.
>
> That's not quite true, it was added in Linux 2.6.13 in commit
> 22e2c507c301c3dbbcf91b4948b88f78842ee6c9:
>
> =A0 =A0 =A0 =A0[PATCH] Update cfq io scheduler to time sliced design
>
> The users back then where the same as today: a few reiserfs journal
> callsites and lock_super. =A0In addition to the lock_super uses in va=
rious
> fringe filesystems still left today it was also used around ->put_sup=
er
> (aka umount) and ->write_super, which at the point had already lost t=
he
> grunt work of sync action to ->sync_fs.
>
> That beeing said I never liked it and asked for a removal a while ago=
,
> but Jens still wanted to keep it. =A0As far as I'm concerned we shoul=
d
> kill it gently, and if any regressions arise fix them with a bio flag=
=2E
>
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
