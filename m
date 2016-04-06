From: Mathieu Belanger <admin@korinar.com>
Subject: Re: [BUG] Big fiability issue?
Date: Wed, 6 Apr 2016 09:25:40 -0500
Message-ID: <20160406092540.abbb5f64954b9ca3d18c6b95@korinar.com>
References: <5703DD31.50604@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=korinar.com; h=
	content-transfer-encoding:content-type:content-type:mime-version
	:x-mailer:references:in-reply-to:message-id:subject:subject:from
	:from:date:date:received:received; s=korinar; t=1459952758; bh=F
	uU4KSGDVOOEE7AgBVh7ko3QYp7tWE7sHDhtk6A8jvI=; b=SPhWbYI9OrlvwdV1f
	BIcgAHy+E8TZdzHN4AewgZcQuKX9eRrZ49wCL9UZFfgJjSgVXE213xOt91UeoNqM
	aLh+w9rwK0nF6q3eniCDCC0+l3UtWNZ5ou+T2YV0qTQuXc5GgeRVtG3u/MxCM+GH
	OqVFPio8j9joG03cIsN8nV0HMk=
In-Reply-To: <5703DD31.50604@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Mathieu =?ISO-8859-1?Q?B=E9langer?= <b747xx@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Well, I did boot systemrescuecd to fsck my /dev/sda2 and mount it ro to
do the backup and I was able to get all the data back but with a bonus :
I can mount the fscked /dev/sda2 in rw on systemrescuecd, the corruption
don't come back. SystemrescueCD is based on Gentoo I think. But the one
I got got a 3.18 kernel. I did manually compile the latest tools to be
sure and a got an error because 3.18 support format40 4.0.0, not 4.0.1
but that error did not affect me.

I will do more test with that "corrupt" partition before restorating
the backup.

On Tue, 5 Apr 2016 17:43:45 +0200
Edward Shishkin <edward.shishkin@gmail.com> wrote:

> Hello Mathieu,
> 
> I found that by default reiser4 still relies on a block layer feature,
> which is not longer supported. This is so-called "barriers". And yes,
> on the power outage bad things are bound to happen. However, it
> is up to bad luck.
> 
> The attached patch removes the rest of block barriers support in
> reiser4. So, now we honestly wait for IO completion of wandered
> blocks (overwrite set) before submitting a journal header (journal
> footer).
> 
> Not sure if it will address your problem though. Also, data corruption
> after rw-mounting of checked (rebuild-fs) partition is still a concern.
> 
> Thanks,
> Edward.


-- 
Mathieu Belanger <admin@korinar.com>
