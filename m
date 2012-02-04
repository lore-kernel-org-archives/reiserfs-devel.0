From: <doiggl@velocitynet.com.au>
Subject: Re: command 'mount /dev/sdc /media/disk2' failed after fsck.reiser4 --build-fs /dev/sdc
Date: Sun, 05 Feb 2012 01:12:52 +1100
Message-ID: <17c09724dbb7deeb11a6f40b3fd34ee0@mail.velocitynet.com.au>
References: <eb15abdb129343708952e5616ec0e8df@mail.velocitynet.com.au> <op.v8t5gqschogzsi@g17b> <3810d7a879b20a2003ac2e1cecd026da@mail.velocitynet.com.au> <4F25649B.7030309@gmail.com> <69e7bb2502ecd3951f2b7c72fe092a06@mail.velocitynet.com.au> <4F279D42.60708@gmail.com> <969c482756fd4751ecd068f39132c524@mail.velocitynet.com.au> <4F27F2BA.8090300@gmail.com> <4a0ae9e43af128af1546a6c14bb5add3@mail.velocitynet.com.au> <5930d524cbeb70f029e65542dab5495b@mail.velocitynet.com.au> <4F296BDE.2010902@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4F296BDE.2010902@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

On Wed, 01 Feb 2012 17:44:14 +0100, Edward Shishkin
<edward.shishkin@gmail.com> wrote:
> On 02/01/2012 05:20 PM, doiggl@velocitynet.com.au wrote:
> 
> [...]
> 
>> FSCK: node.c: 108: repair_node_items_check: Node (227923161), items
(22)
>> and (23): Wrong order of keys.
>> FSCK: node.c: 108: repair_node_items_check: Node (284305753), items
(61)
>> and (62): Wrong order of keys.
>>          Read nodes 1481038
>>
>>          Good nodes 471512
>>                  Leaves of them 466164, Twigs of them 5348
>>          Time interval: Wed Feb  1 23:07:28 2012 - Wed Feb  1 23:11:16
>>          2012
>>
>> ***** fsck.reiser4 finished at Wed Feb  1 23:11:16 2012
>> Closing fs...done
>>
>> FS is consistent.
>>
>> Question:
>> Do I keep running these 2 commands till something happens ???
>> 1. # fsck.reiser4 --check /dev/sdc
>> 2. # fsck.reiser4 --build-fs  /dev/sdc
>> Thanks glenn
> 
> 
> Hello.
> You have encountered a bug in fsck: it doesn't repair your
> corruption for unknown reasons.
> 
> Could you please pack the metadata by
> debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
> and let me download the file meta.gz
> 
> I'll take a look at this at leisure, but unfortunately I
> can not promise a quick fixup.
> 
> Thanks,
> Edward.

Hello,
I am just trying to to find a free file sharing service to share as the
file its on the large side, I am still looking.
If there are any free sites file to handle large files, that would be
handy to know.
It looks like it will a long time to upload once a transfer site site is
found. 
Glenn

File details
3,133,918,605  meta.gz

# md5sum meta.gz 
41c2ad7cf10c90fa73a287d1f2ddaef3  meta.gz

