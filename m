From: dimas <dimas000@ya.ru>
Subject: Re: How can i use -o dont_load_bitmap in mount command [on
 /dev/sdb]
Date: Sun, 25 Oct 2015 17:02:21 +0300
Message-ID: <20151025170221.2d4fd8b4@Ulf.tvoe.tv>
References: <f73911fd49c20ac3d0c8476631bd655a@mail.velocitynet.com.au>
Reply-To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, dimas000@ya.ru
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ya.ru; s=mail; t=1445781742;
	bh=K6wI8g8T1DLkgZ4Wp9tcNgqbrmnaaaSuaICz9LGEC0c=;
	h=Date:From:To:Subject:Message-ID:In-Reply-To:References:Reply-To:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=a23+Ud8C/XUw1yDNbxbGj41ncxkgzRl3UeSD2eGQlQFMj+QXFSSlbV8ZhKpwURZJx
	 rKhtXJlUjile3WmVny1wn87156kaYdTpvvZ6uzdcL1hvxXGc0hL6mj+SNAEVI6OqQt
	 zVRBQOUbDeXVU7oSZ6ehxHQCyGR0SttQIIamWuoo=
In-Reply-To: <f73911fd49c20ac3d0c8476631bd655a@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>

mount -o dont_load_bitmap /dev/sdb /media/disk


2015-298 23:37 doiggl@velocitynet.com.au <doiggl@velocitynet.com.au> wrote:
> Hello,
> How can I use -o dont_load_bitmap in #mount command
> An example would be nice.
> 
> currently tryingto use:
> # mount /dev/sdb /media/disk
> 
> The entire disk /dev/sdb is  one reiser4 volume
> 
> Thankyou
> --Glenn
> 
> 
> Background history
> ==================
> http://www.spinics.net/lists/reiserfs-devel/msg04688.html
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
