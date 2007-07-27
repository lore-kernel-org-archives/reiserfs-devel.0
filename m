From: Edward Shishkin <edward@namesys.com>
Subject: Re: 2.6.23-rc1-mm1: reiser4 compressed and zero length file
Date: Sat, 28 Jul 2007 01:58:36 +0400
Message-ID: <46AA6A8C.7000504@namesys.com>
References: <200707272140.39114.lardel@interia.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200707272140.39114.lardel@interia.pl>
Sender: reiserfs-devel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: lardel@interia.pl
Cc: ReiserFS Mailing List <reiserfs-devel@vger.kernel.org>

lardel@interia.pl wrote:

>Hi,
>A filesystem created by:
>mkfs.reiser4 -o create=ccreg40 /dev/sda8
>can't read zero length files:
># touch test
># cat test
>cat: test: Invalid argument
>
>Uncompressed filesystems are ok. vanilla with 2.6.22 patch is fine too.
>
>  
>

Hello,
the cryptcompress-related fixups from reiser4-for-2.6.22 are not yet in 
-mm tree
and can be found here:
ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.23-rc1-mm1

Thanks,
Edward.

>Regards,
>Rafal
>
>----------------------------------------------------------------------
>Piekne kobiety wsrod samych swin!
>Obejrzyj
>
>  
>
>>>>http://link.interia.pl/f1b18
>>>>        
>>>>
>
>-
>To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
>the body of a message to majordomo@vger.kernel.org
>More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>
>  
>

