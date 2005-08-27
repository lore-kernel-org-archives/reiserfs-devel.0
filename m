From: David Masover <ninja@slaphack.com>
Subject: Re: what if I touch a reiser4 partition and ...
Date: Sat, 27 Aug 2005 12:25:16 -0500
Message-ID: <4310A1FC.5070105@slaphack.com>
References: <2b973fa605082622442afd3040@mail.gmail.com>	 <4310106C.2060401@slaphack.com> <b14e81f0050827062337363c44@mail.gmail.com> <43109B47.9000706@slaphack.com> <4310A093.4070306@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25663-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4310A093.4070306@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: michael chang <thenewme91@gmail.com>, =?ISO-8859-1?Q?Miguel_Ernesto?= =?ISO-8859-1?Q?_P=E9rez_Cabrera?= <solohayuno@gmail.com>, reiserfs-list@namesys.com

Vladimir V. Saveliev wrote:
> Hello
> 
> David Masover wrote:
> 
>>michael chang wrote:
>>
>>>On 8/27/05, David Masover <ninja@slaphack.com> wrote:
>>>
>>>
>>>>And last I checked, reiser4 doesn't have a resizer -- not even a way to
>>>>grow the FS.  So your correct course of action would probably have been
>>>>to back everything up, resize hdd5, mkfs, and then restore.  If you
>>>
>>>Yet. AFAIK, as soon as someone funds namesys a few millions or
>>>whatever, they'll write one.  After vanilla inclusion, and from what
>>>it seems, the online repacker.
>>
>>Online repacker would make it possible to shrink the FS online.  But I
>>don't see why we can't *already* grow the FS, even offline.  You don't
>>need a repacker for that.
> 
> 
> Afaik, if any of disk partitions is mounted - re-partition-ing takes effect only up on reboot.
> Therefore, being able to grow mounted filesystem does not gain you too much.

There are things like LVM, which allow a partition to be extended
online.  Also, not many install/rescue disks have support for Reiser4
yet, so it would be helpful if one could:

- boot random rescue disk
- resize partition
- boot main Linux installation
- extend filesystem

Anyway, how hard could it be?

