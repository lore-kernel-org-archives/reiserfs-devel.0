From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 mkfs, cryptcompress, tail packing, etc.
Date: Tue, 24 Aug 2010 19:56:38 +0200
Message-ID: <4C7407D6.6070000@gmail.com>
References: <4C73EDEF.8020701@bobich.net> <4C7405CF.3040609@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4C7405CF.3040609@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Gordan Bobic <gordan@bobich.net>
Cc: reiserfs-devel@vger.kernel.org

Edward Shishkin wrote:
> Gordan Bobic wrote:
>> Hi,
>
> Hello.
>
>>
>> It's been a while since I last tried reiser4, and having just looked 
>> at the wiki, I couldn't find any info at all on the cryptocompress 
>> plugin and tail packing options

Reiser4 tail packing policy can be set by "-o formatting=xxx" option.
List of all available options can be displayed by mkfs.reiser4 -l:

"extents"           (id:0x0 type:0x5) ['Extents only' tail policy plugin.]
"tails"             (id:0x1 type:0x5) ['Tails only' tail policy plugin.]
"smart"             (id:0x2 type:0x5) [Smart tail policy: If file is 
smaller than 20K, store it in tails,
otherwise convert it to extents. Default option.
