From: Chris Mason <clmason@fusionio.com>
Subject: Re: [BULK]  [PATCH] reiserfs: fix journal list handling
Date: Mon, 6 May 2013 14:57:48 -0400
Message-ID: <20130506185748.5844.59533@localhost.localdomain>
References: <5187FB79.4000206@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fusionio.com;
	s=default; t=1367866670;
	bh=OUlX+mtd9jOr863FL04yQ2Sn2UBbh5dbf7yxL+7l6Uk=;
	h=From:To:References:In-Reply-To:Subject:Date;
	b=MdRYWGvql1Yi7lDvS632j1ztMyY/0Y9Ixe4fcWkcYf+e3jPpcxrfYBTaY7CFY6To6
	 Dg7z98kndylw4GsY5RObdxqKHSkMEDi912Ngp2ZjUdUp1NRKX+jBKh3cCAiJq7GeTx
	 xACJPhwwd+9cB2Dsk3nbfacAgXZ88T7XPyw3ThcU=
In-Reply-To: <5187FB79.4000206@suse.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>, reiserfs-devel <reiserfs-devel@vger.kernel.org>

Quoting Jeff Mahoney (2013-05-06 14:50:33)
> reiserfs has open coded linked lists to handle its cnode infrastructure.
> 
> While converting them to list_heads, I found that while the patch looked
> perfectly straightforward based on what the code should have been doing,
> it caused crashes nearly immediately. The issue can be reproduced
> without the conversion by clearing the hprev/hnext pointers in
> remove_journal_hash() when the cnode is removed from the hash list.
> 
> It turns out that the code has been working by happy accident for over
> a decade

Chris from 1999 is really sorry about that one.  The new code looks much
less error prone.

-chris
