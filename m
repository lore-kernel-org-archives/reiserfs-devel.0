From: "Tom Mortensen" <tmmlkml@gmail.com>
Subject: Re: reiserfs fs/reiserfs/bitmap.c:1287
Date: Thu, 9 Aug 2007 11:18:27 -0700
Message-ID: <a52a95e30708091118k1aa962d8u214a7f0624df78e3@mail.gmail.com>
References: <15366.199.125.14.2.1184261266.squirrel@localmail-dr.mcsimons.com>
	 <46967D7D.5090204@suse.com>
	 <a52a95e30708081529i7cee02ddq61471378c2a12ffa@mail.gmail.com>
	 <46BA57AC.2040306@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1759417AbXHISSo@vger.kernel.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed;
        d=gmail.com; s=beta;
        h=domainkey-signature:received:received:message-id:date:from:to:subject:cc:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
        b=M8D1mYvTRMjIvZZ1rWZLwvZH6r7n9+8H+ONHaeuSf3F7TAGya9c7p0muijPzar/rZBCBLP5IZ46DxVvlNiKkiLQxrEhVFQECsB8apL0FPknhjbdhKU2z2lMiBonb+a8wLfWOisgDtwwNvIi8CI4CC8bThLh3MiJt6XVCn1Q+dRQ=
In-Reply-To: <46BA57AC.2040306@suse.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff Mahoney <jeffm@suse.com>
Cc: tony@tvortex.net, linux-kernel@vger.kernel.org, ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

Using mkreiserfs version 3.6.19.  But file system is less than 80GB.

On 8/8/07, Jeff Mahoney <jeffm@suse.com> wrote:

> In any event, something is corrupting your bitmaps and that needs to get
> tracked down. The size of the file system is important. I've been seeing
> reports of users hitting similar problems with file systems larger than
> 8 TiB. The cause is that the s_bmap_nr field in the superblock is 16
> bit, and the file system assumes it's correct. mkreiserfs < 3.6.20 will
> happily create those file systems with a value that has wrapped, while
> mkreiserfs >= 3.6.20 will zero the value out, causing a mount failure
> unless the kernel has been patched to support the full size and to
> interpret s_bmap_nr == 0 as "value has overflowed."
