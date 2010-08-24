From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: reiser4 mkfs, cryptcompress, tail packing, etc.
Date: Tue, 24 Aug 2010 21:21:00 +0200
Message-ID: <4C741B9C.5070302@gmail.com>
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
>> plugin and tail packing options at mkfs time specifically relating to 
>> reiser4.
>
> mkfs.reiser4 -l:
>
> compression modes (works "per file"):
>
> "latt"              (id:0x1 type:0xd) ['Check on dynamic lattice' 
> compression mode plugin.]
> If logical cluster in incompressible, then switch compression off and 
> check every
> K-th cluster, where K dynamically increased to 32 on every non-success 
> after
> compression. If cluster is compressible, than K is set back to 1, etc..
>
> "ultim"             (id:0x2 type:0xd) ['Check ultimately' compression 
> mode plugin.]
> Switch compression off forever after the first case of non-success.
>
> "force"             (id:0x3 type:0xd) ['Compress evrything' 
> compression mode plugin.]
> Force to compress everything.
>
> "conv"              (id:0x4 type:0xd) ['Convert to extent' compression 
> mode plugin.]
> If the first logical cluster of the file is incompressible, then 
> switch compression off forever.

Sorry, this is not everything. Here should also go "otherwise switch to 
"latt" mode
(see above)".
So not everything is bad for media-files in this mode.
