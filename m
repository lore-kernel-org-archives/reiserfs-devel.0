From: =?ISO-8859-1?Q?Fr=E9d=E9ric_Weisbecker?= <fweisbec@gmail.com>
Subject: Re: kill-the-bkl/reiserfs: request for linux-next inclusion
Date: Sun, 24 May 2009 21:41:35 +0200
Message-ID: <c62985530905241241x2c72e92dn8265fe849b1f0b07@mail.gmail.com>
References: <c62985530905201640j4a550b5bi7673e5a9f21029ce@mail.gmail.com>
	 <20090522105033.1426d409.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:cc:content-type
         :content-transfer-encoding;
        bh=nLj9iOl2wo8TSFwhO58g5TSpYgbPThCAQ3DvSz9ouIM=;
        b=mSJ1pw3OAfOi0rGU6t3JTl70tyryHePNaFDV0kf6eqSkZFCSCWaYxlg3JEJRsFUCkc
         laILjaJf8tBaDr67w+A2Cwy6iVsSw+e5dLaoen2tAm/HZ58XPOaXx+dbPmK91I3xK5po
         vCZ6Dq0RKH4tjxbTYD09iQMZxQcvY9mAutSPE=
In-Reply-To: <20090522105033.1426d409.sfr@canb.auug.org.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Reiserfs <reiserfs-devel@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, Chris Mason <chris.mason@oracle.com>, Ingo Molnar <mingo@elte.hu>, Alexander Beregalov <a.beregalov@gmail.com>, Al Viro <viro@zeniv.linux.org.uk>

Le 22 mai 2009 02:50, Stephen Rothwell <sfr@canb.auug.org.au> a =E9crit=
 :
> Hi Fr=E9d=E9ric,
>
> On Thu, 21 May 2009 01:40:57 +0200 Fr=E9d=E9ric Weisbecker <fweisbec@=
gmail.com> wrote:
>>
>> I guess Al is traveling or something.
>>
>> Until it finds its way to the VFS tree, it would be nice if this
>> reiserfs bkl removal tree could be included in linux-next
>> for testing.
>> Could you please include it ?
>>
>> You can pull from:
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/frederic/random-tracin=
g.git
>> reiserfs/kill-bkl-rc6
>
> I have included this tree from today.
>
> What I tell everyone: all patches/commits in the tree/series must
> have been:
>
> =A0 =A0 =A0 =A0posted to a relevant mailing list
> =A0 =A0 =A0 =A0reviewed
> =A0 =A0 =A0 =A0unit tested
> =A0 =A0 =A0 =A0destined for the next merge window (or the current rel=
ease)



Thanks,

I remember there was a checklist like that for linux-next but couldn't
retrieve it.
They meet all these requirements except the reviewed part.
Some of them have been reviewed by several people but not the last batc=
hes,
(or at least the last batches haven't received any comments).



> *before* they are included. =A0The linux-next tree is for integration
> testing and to lower the impact of conflicts between subsystems in th=
e
> next merge window.
>
> Basically, this should be just what you would send to Linus (or ask h=
im
> to fetch). =A0It is allowed to be rebased if you deem it necessary.


Ok thanks.


> --
> Cheers,
> Stephen Rothwell =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sfr@canb.auug=
=2Eorg.au
> http://www.canb.auug.org.au/~sfr/
>
--
To unsubscribe from this list: send the line "unsubscribe reiserfs-deve=
l" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
