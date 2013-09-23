From: Chris Gentile <cnjgentile@gmail.com>
Subject: Re: Reiser4 for Linux-3.11
Date: Mon, 23 Sep 2013 17:50:26 +0000
Message-ID: <52407F62.801@gmail.com>
References: <524035E9.1070208@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=zEnB4WZ/xb3y9vMkHI6W6KHETLaLm7cgzDU3lliMUVM=;
        b=Mn7jOg+cgv941R5a2ffPG8AzLmqIblBolBHcXvq5lvWyvj+EZ8n3HGBBAyiL6V4rA/
         LAYQ8CMw4a6mTATAjZTb0qlpZVXt2N7syDDPaluFVdtHS6qcg7fc3UqLfDT9RudCDFWh
         DU6keEWL0MhwjgkG0nvDdyxmuSV5XxzV4RMR7qW0cdYmbVYzm5owksqw1QSdjNggczwa
         qQT7AqVUu2kwSwiPDbsuA/P6jhCqx34/GLRAre1YadAym7ztcI+GbGPyg6C2D7XxMsHl
         YkQH0erZU9/sgeFKLzc9dhYuP96yZG3R6eg97c6fnIGOcl/kG98ZbZhfTRGN8yqnlGHe
         pzJw==
In-Reply-To: <524035E9.1070208@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>, ReiserFS Development mailing list <reiserfs-devel@vger.kernel.org>

Awesome I"ll make sure to spread the word.. I think a msg to
Phoronix.com is in order :)
Chris


On 09/23/13 12:36, Edward Shishkin wrote:
> Changes since reiser4-for-3.10:
>
> Ivan Shapovalov
>
> . Port for linux-3.9:
>   . use length argument in ->invalidatepage();
>   . use ->iterate() instead of ->readdir();
>   . fix up namespace collision: rename d_lock to d_c_lock;
>   . replace num_physpages (went away) with totalram_pages;
>   . replace d_count of struct dentry with d_lockref.count
>
> Edward Shishkin
>
>   . use free value 0x00000002 for PF_FLUSHER;
>   . initialize wb_writeback_work->for_sync with 1 in reiser4_sync_fs().
>
>
> Please, find at
> http://sourceforge.net/projects/reiser4/files/reiser4-for-linux-3.x/
>
> Thanks,
> Edward.
> -- 
> To unsubscribe from this list: send the line "unsubscribe
> reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



