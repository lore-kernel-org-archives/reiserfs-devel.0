From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Reiser4
Date: Fri, 17 Dec 2010 18:51:04 +0100
Message-ID: <4D0BA308.5050602@gmail.com>
References: <20101217162550.GA1864@ishi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20101217162550.GA1864@ishi>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Milan Buska <milan.buska@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

Milan Buska wrote:
> Hi all.
>   

Hello.

> I have a few questions.
>
> 1, fs reiser4 is limited by file size
>   

file size is limited by MAX_LFS_FILESIZE,
see definition in ./include/linux/fs.h

> 2, is there any connection between the reiser4 and SATA disk
>   

not sure what do you mean..
