From: Mathieu Belanger <admin@korinar.com>
Subject: Re: [BUG] Big fiability issue?
Date: Wed, 6 Apr 2016 09:35:27 -0500
Message-ID: <20160406093527.51ef273aa9b79e3b629b5f49@korinar.com>
References: <5703DD31.50604@gmail.com>
	<20160406092540.abbb5f64954b9ca3d18c6b95@korinar.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=korinar.com; h=
	content-transfer-encoding:content-type:content-type:mime-version
	:x-mailer:references:in-reply-to:message-id:subject:subject:from
	:from:date:date:received:received; s=korinar; t=1459953344; bh=B
	zmlWiy6sixRFqQQ+T92Q3EUsSdKXYD5OXlFlJuS1gI=; b=DAxvhOAh30WcIv+lI
	U69zuN4hU0/OvRC8e0iotbAbUAmP+igqhKDzSfhUOERVFcE1mtqm5r1TB7Mrioc1
	PodTYF5zDR79/eS1pm5gc2M92a8VseJUJNOhnZ1ZgykKbIElq3FOAB2PtK/3h1HB
	6ZYuK5PFNRq+lfbnW1U1HMM/pg=
In-Reply-To: <20160406092540.abbb5f64954b9ca3d18c6b95@korinar.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mathieu Belanger <admin@korinar.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, Mathieu =?ISO-8859-1?Q?B?= =?ISO-8859-1?Q?=E9langer?= <b747xx@gmail.com>, Reiserfs development mailing list <reiserfs-devel@vger.kernel.org>

Another message, now, to confirm that everything is fine once booted
on my main Gentoo, corruption do not come back. All directory (/opt, /mnt)
are back and broken binaries are back alive too like nothing append.

So for now on until the reason is found, I will use sysrescuecd to
do the fscks and mount it in rw there first and then reboot on my
normal OS.

Mathieu

On Wed, 6 Apr 2016 09:25:40 -0500
Mathieu Belanger <admin@korinar.com> wrote:

> Well, I did boot systemrescuecd to fsck my /dev/sda2 and mount it ro to
> do the backup and I was able to get all the data back but with a bonus :
> I can mount the fscked /dev/sda2 in rw on systemrescuecd, the corruption
> don't come back. SystemrescueCD is based on Gentoo I think. But the one
> I got got a 3.18 kernel. I did manually compile the latest tools to be
> sure and a got an error because 3.18 support format40 4.0.0, not 4.0.1
> but that error did not affect me.
> 
> I will do more test with that "corrupt" partition before restorating
> the backup.
> 
> On Tue, 5 Apr 2016 17:43:45 +0200
> Edward Shishkin <edward.shishkin@gmail.com> wrote:
> 
> > Hello Mathieu,
> > 
> > I found that by default reiser4 still relies on a block layer feature,
> > which is not longer supported. This is so-called "barriers". And yes,
> > on the power outage bad things are bound to happen. However, it
> > is up to bad luck.
> > 
> > The attached patch removes the rest of block barriers support in
> > reiser4. So, now we honestly wait for IO completion of wandered
> > blocks (overwrite set) before submitting a journal header (journal
> > footer).
> > 
> > Not sure if it will address your problem though. Also, data corruption
> > after rw-mounting of checked (rebuild-fs) partition is still a concern.
> > 
> > Thanks,
> > Edward.
> 
> 
> -- 
> Mathieu Belanger <admin@korinar.com>
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Mathieu Belanger <admin@korinar.com>
