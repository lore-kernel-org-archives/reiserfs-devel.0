From: "Dushan Tcholich" <dusanc@gmail.com>
Subject: Re: kernel BUG at fs/reiser4/plugin/item/ctail.c
Date: Mon, 4 Aug 2008 12:28:06 +0200
Message-ID: <a08621850808040328o36ab4901m63a0d978a221e833@mail.gmail.com>
References: <558.1643-13003-1386678025-1217242012@post.cz>
	 <488DD846.70002@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=ZxcWIbSAev7RotVloSFfSQX1zD5J88oZLYborV7CTzc=;
        b=b7jtIKZJ29Zu1pH7p6ns9dc05JCk7ZcB08MgMRKULhj6hs2qaN9DnC7zTrDzvfQb5E
         smxET2vDTJOrZ1ZvGDqyEEP8tCGys/0PAeZvWOjfmCpsDtDd7cPTwFq9yMuDmSFcG3pq
         faVlzKNF99hiu+nVqMMa8ldzibZ5JMwzg2D0I=
In-Reply-To: <488DD846.70002@gmail.com>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: "Mr. Tao" <tao@post.cz>, Reiserfs mailing list <reiserfs-devel@vger.kernel.org>

Would it be possible if there would be a new version of fsck.reiser4
to fix those false positives about wrong size when checking
cryptocompress partitions?
There are some users that reported those and it's not comforting when
your fs spews thousands of errors, even when someone tells you they're
false.

Oh and what about making cryptocompress default format on mkfs.reiser4 ?

Have a nice day
Dushan
