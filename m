From: Spam <spam@tnonline.net>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 01:19:35 +0200
Message-ID: <1453698131.20040826011935@tnonline.net>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com>
 <20040825152805.45a1ce64.akpm@osdl.org> <112698263.20040826005146@tnonline.net>
 <Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-20539-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <Pine.LNX.4.58.0408251555070.17766@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Linus Torvalds <torvalds@osdl.org>
Cc: Andrew Morton <akpm@osdl.org>, Hans Reiser <reiser@namesys.com>, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com





> On Thu, 26 Aug 2004, Spam wrote:
>> 
>> > My own order of preference is b) c) a).  The fact that one filesystem will
>> > offer features which other filesystems do not and cannot offer makes me
>> > queasy for some reason.
>> 
>>   This last sentence makes me wonder. Where is Linux heading? The idea
>>   that   a  FS  cannot  contain  features that no other FS has is very
>>   scary.

> That's not what Andrew said or meant.

> Note the "cannot offer". As in "there is no way to offer them even if the
> filesystem could support it otherwise". 

> We have tons of filesystems that do things other filesystems cannot do.
> Most filesystems support writing to a file - despite the fact that some
> filesystems (iso9600 being an obvious one) cannot. The infrastructure is
> there in the VFS layer, and it becomes a _choice_ for the filesystem
> whether it offers certain capabilities.

> So look at what Andrew said, again: his top choice would be (b). Let's see
> what that was again, shall we?

>> b) accept the reiser4-only extensions with a view to turning them into
>>    kernel-wide extensions at some time in the future, so all filesystems
>>    will offer the extensions (as much as poss) or

> In other words, if reiserfs does something special, we should make 
> standard interfaces for doing that special thing, so that everybody can
> do it without stepping on other peoples toes.

  Agreed  that would be the best. But how much time and effort will it
  be,  and  how much of the original ideas would be lost on the way to
  implement  them  in  the  VFS? Especially with new and very advanced
  FS's like Reiser4.

  Isn't  the  line  between the actual file system and the virtual one
  very hair thin? Where would the separation lay in Reiser4?
  
> That doesn't mean that we'd _force_ everybody to do it. The same way we
> don't force iso9660 to write to a CD-ROM.

>       Linus

  I got caught in the moment of flame war. My appologies.

  ~S



