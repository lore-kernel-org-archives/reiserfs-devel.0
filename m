From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: what if I touch a reiser4 partition and ...
Date: Sat, 27 Aug 2005 21:19:15 +0400
Message-ID: <4310A093.4070306@namesys.com>
References: <2b973fa605082622442afd3040@mail.gmail.com>	 <4310106C.2060401@slaphack.com> <b14e81f0050827062337363c44@mail.gmail.com> <43109B47.9000706@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25662-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43109B47.9000706@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: David Masover <ninja@slaphack.com>
Cc: michael chang <thenewme91@gmail.com>, =?ISO-8859-1?Q?Miguel_Ernesto?= =?ISO-8859-1?Q?_P=E9rez_Cabrera?= <solohayuno@gmail.com>, reiserfs-list@namesys.com

Hello

David Masover wrote:
> michael chang wrote:
>>On 8/27/05, David Masover <ninja@slaphack.com> wrote:
>>
>>>And last I checked, reiser4 doesn't have a resizer -- not even a way to
>>>grow the FS.  So your correct course of action would probably have been
>>>to back everything up, resize hdd5, mkfs, and then restore.  If you
>>
>>Yet. AFAIK, as soon as someone funds namesys a few millions or
>>whatever, they'll write one.  After vanilla inclusion, and from what
>>it seems, the online repacker.
> 
> Online repacker would make it possible to shrink the FS online.  But I
> don't see why we can't *already* grow the FS, even offline.  You don't
> need a repacker for that.

Afaik, if any of disk partitions is mounted - re-partition-ing takes effect only up on reboot.
Therefore, being able to grow mounted filesystem does not gain you too much.

> 
>>>I know you've heard the lecture before, and it's little comfort now, but
>>>backup is cheap.  Data recovery services are expensive.  And data loss
>>>is unacceptible.
>>
>>I believe it was you, yes, that learnt this the hard way? ;-)
> 
> Almost.  I was very, very lucky.
> 
> Note to self:  cp, don't mv, and don't try to reattach an IDE drive to a
> running system!
> 
> 
> 

