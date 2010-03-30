From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: problem with corrupted filesystem
Date: Tue, 30 Mar 2010 12:24:04 +0200
Message-ID: <4BB1D144.4070506@gmail.com>
References: <10637573.555449.1269939595054.JavaMail.fmail@mwmweb063>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <10637573.555449.1269939595054.JavaMail.fmail@mwmweb063>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marcus Becker <Becker_Marcus1@web.de>
Cc: reiserfs-devel@vger.kernel.org

Marcus Becker wrote:
> the problem is actual reproduceable. I emerged gcc again and the excact same happened:
>
> disi-laptop portage # rm -r *
> rm: cannot remove `sys-devel/gcc-4.4.3/work/gcc-4.4.3/libjava/classpath/resource/gnu/java/locale': Directory not empty
>   

Hello.

Would you please pack the metadata by
debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
and let me download the file meta.gz

Thanks,
Edward.


>  
>
> I am not sure, why it doesn't like that particular folder..

