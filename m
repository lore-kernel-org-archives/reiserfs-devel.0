From: David Masover <ninja@slaphack.com>
Subject: Re: what if I touch a reiser4 partition and ...
Date: Sat, 27 Aug 2005 11:56:39 -0500
Message-ID: <43109B47.9000706@slaphack.com>
References: <2b973fa605082622442afd3040@mail.gmail.com>	 <4310106C.2060401@slaphack.com> <b14e81f0050827062337363c44@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25661-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b14e81f0050827062337363c44@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: michael chang <thenewme91@gmail.com>
Cc: =?ISO-8859-1?Q?Miguel_Ernesto_P=E9rez_Cabrera?= <solohayuno@gmail.com>, reiserfs-list@namesys.com

michael chang wrote:
> On 8/27/05, David Masover <ninja@slaphack.com> wrote:
> 
>>And last I checked, reiser4 doesn't have a resizer -- not even a way to
>>grow the FS.  So your correct course of action would probably have been
>>to back everything up, resize hdd5, mkfs, and then restore.  If you
> 
> 
> Yet. AFAIK, as soon as someone funds namesys a few millions or
> whatever, they'll write one.  After vanilla inclusion, and from what
> it seems, the online repacker.

Online repacker would make it possible to shrink the FS online.  But I
don't see why we can't *already* grow the FS, even offline.  You don't
need a repacker for that.

>>I know you've heard the lecture before, and it's little comfort now, but
>>backup is cheap.  Data recovery services are expensive.  And data loss
>>is unacceptible.
> 
> 
> I believe it was you, yes, that learnt this the hard way? ;-)

Almost.  I was very, very lucky.

Note to self:  cp, don't mv, and don't try to reattach an IDE drive to a
running system!

