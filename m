From: Toby Thain <toby@telegraphics.com.au>
Subject: Re: Reiser4
Date: Fri, 17 Dec 2010 12:24:59 -0500
Message-ID: <BLU0-SMTP113A014DBCD5C68475D737BF160@phx.gbl>
References: <20101217162550.GA1864@ishi> <BLU0-SMTP8EA8B3422B8DF2C0E8A7ABF160@phx.gbl> <20101217172038.GA1730@ishi>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <20101217172038.GA1730@ishi>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Milan Buska <milan.buska@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 17/12/10 12:20 PM, Milan Buska wrote:
> 17. Dec (Friday) v 11:31:33 -0500 2010, toby@telegraphics.com.au napsal(a):
>> On 17/12/10 11:25 AM, Milan Buska wrote:
>>> Hi all.
>>>
>>> I have a few questions.
>>>
>>> 1, fs reiser4 is limited by file size
>>> 2, is there any connection between the reiser4 and SATA disk
>>> 3, I formatted disk partition with the command 
>>> 	# mkfs.reiser4-o create = ccreg40, compress = gzip1 
>>                                                       ^^^^^
>>> 	and the system seems slower to me. Is this possible?
>>
>>
>> Slower than what?
> 
> It was just my subjective impression.
> Sorry.
> 
> file size 64M
> time tar -xf file.tar.bz2


This doesn't seem like a very good filesystem benchmark.

Did you deliberately enable gzip1 compression? Presumably that would
affect performance. But I think you need to find a better way to measure it.

--Toby


> --- reiser4 ------    --- reiserfs ---
> real    0m27.436s     real    0m31.165s
> user    0m23.242s     user    0m24.546s
> sys     0m6.118s      sys     0m5.905s
> 
>>
>> --Toby
> 
> Milan
> 

