From: Milan Buska <milan.buska@gmail.com>
Subject: Re: Reiser4
Date: Fri, 17 Dec 2010 18:20:38 +0100
Message-ID: <20101217172038.GA1730@ishi>
References: <20101217162550.GA1864@ishi>
 <BLU0-SMTP8EA8B3422B8DF2C0E8A7ABF160@phx.gbl>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BLU0-SMTP8EA8B3422B8DF2C0E8A7ABF160@phx.gbl>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Toby Thain <toby@telegraphics.com.au>
Cc: reiserfs-devel@vger.kernel.org

17. Dec (Friday) v 11:31:33 -0500 2010, toby@telegraphics.com.au napsal(a):
> On 17/12/10 11:25 AM, Milan Buska wrote:
> > Hi all.
> > 
> > I have a few questions.
> > 
> > 1, fs reiser4 is limited by file size
> > 2, is there any connection between the reiser4 and SATA disk
> > 3, I formatted disk partition with the command 
> > 	# mkfs.reiser4-o create = ccreg40, compress = gzip1 
>                                                       ^^^^^
> > 	and the system seems slower to me. Is this possible?
> 
> 
> Slower than what?

It was just my subjective impression.
Sorry.

file size 64M
time tar -xf file.tar.bz2
--- reiser4 ------    --- reiserfs ---
real    0m27.436s     real    0m31.165s
user    0m23.242s     user    0m24.546s
sys     0m6.118s      sys     0m5.905s

> 
> --Toby

Milan

-- 
Remember, no question is too stupid and no problem too small
             -- We've all been beginners
