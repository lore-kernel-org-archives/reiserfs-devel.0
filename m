From: Serkan Kaba <serkan@gentoo.org>
Subject: Re: Corruption with Gentoo's PORTAGE_TMPDIR
Date: Mon, 2 May 2011 10:07:39 +0300
Message-ID: <BANLkTi=Pf45yL6dYoHxxgz-bH8hzBg8SGQ@mail.gmail.com>
References: <4DBD80CF.9070903@gmail.com>
	<4DBDC6EE.1060402@gmail.com>
	<4DBE4DB5.5050606@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4DBE4DB5.5050606@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

2011/5/2 dE <de.techno@gmail.com>:
> No, I don't have compression enabled. I formated the Gentoo partition using
> fibration=lexic_fibre,formatting=extents, adding create=ccreg40 cleared the
> issue.
So let's get the issue solved in uncompressed partitions as well. By
the way, is there a way to compress a reiser4 partition without
reformatting it?

Regards,
Serkan
